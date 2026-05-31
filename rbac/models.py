from django.db import models
from django.contrib.auth.models import User
from django.utils import timezone
from django.db.models.signals import post_save  # 导入信号
from django.dispatch import receiver  # 导入 receiver 装饰器

# 会员等级枚举
USER_LEVEL = (
    (0, "游客"),
    (1, "普通用户"),
    (2, "普通会员"),
    (3, "超级会员"),
    (4, "至尊会员"),
)

# 角色表 对应五大身份角色
class Role(models.Model):
    role_name = models.CharField(max_length=20, verbose_name="角色名称")
    desc = models.CharField(max_length=100, blank=True, verbose_name="角色说明")

    def __str__(self):
        return self.role_name

    class Meta:
        verbose_name = "系统角色"
        verbose_name_plural = verbose_name

# 权限表 拆分核心功能权限
class Permission(models.Model):
    perm_name = models.CharField(max_length=30, verbose_name="权限名称")
    perm_code = models.CharField(max_length=50, unique=True, verbose_name="权限标识")

    def __str__(self):
        return self.perm_name

    class Meta:
        verbose_name = "功能权限"
        verbose_name_plural = verbose_name

# 角色-权限关联表
class RolePerm(models.Model):
    role = models.ForeignKey(Role, on_delete=models.CASCADE, verbose_name="角色")
    perm = models.ForeignKey(Permission, on_delete=models.CASCADE, verbose_name="权限")

    class Meta:
        unique_together = ("role", "perm")
        verbose_name = "角色绑定权限"
        verbose_name_plural = verbose_name

# 用户-角色关联表
# ===================== 用户绑定角色模型 =====================
class UserRole(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE, verbose_name="用户")
    role = models.ForeignKey(Role, on_delete=models.CASCADE, verbose_name="角色")

    class Meta:
        unique_together = ("user", "role")
        verbose_name = "用户绑定角色"
        verbose_name_plural = verbose_name

# ===================== 修复后：角色同步会员等级信号 =====================
@receiver(post_save, sender=UserRole)
def sync_role_to_userinfo(sender, instance, **kwargs):
    """
    后台修改用户角色时，自动同步到UserInfo会员等级
    适配你的Role模型（role_name字段）
    """
    user = instance.user
    role = instance.role

    # 角色名称与等级映射
    role_to_level = {
        "游客": 0,
        "普通用户": 1,
        "普通会员": 2,
        "超级会员": 3,
        "至尊会员": 4,
    }

    # 获取对应等级
    target_level = role_to_level.get(role.role_name, 1)
    
    # 更新用户会员资料
    user_info, _ = UserInfo.objects.get_or_create(user=user)
    user_info.level = target_level
    user_info.save()

# 用户拓展信息表（核心：等级、活跃度、降级、头像框）
class UserInfo(models.Model):
    # 原有基础字段
    user = models.OneToOneField(User, on_delete=models.CASCADE, related_name="userinfo", verbose_name="关联账号")
    level = models.SmallIntegerField(choices=USER_LEVEL, default=1, verbose_name="用户等级")
    avatar_frame = models.CharField(max_length=200, blank=True, verbose_name="专属头像框地址")
    nickname = models.CharField(max_length=20, blank=True, null=True, verbose_name="用户昵称")
    
    # 原有活跃度统计字段
    active_time = models.IntegerField(default=0, verbose_name="累计活跃时长")
    post_num = models.IntegerField(default=0, verbose_name="累计发帖数")
    like_num = models.IntegerField(default=0, verbose_name="累计获赞数")
    comment_num = models.IntegerField(default=0, verbose_name="累计评论数")
    
    # 原有账号字段
    last_login_time = models.DateTimeField(default=timezone.now, verbose_name="最后登录时间")
    violate_count = models.IntegerField(default=0, verbose_name="违规次数")

    # ===================== 新增：总活跃度字段 =====================
    total_activity = models.IntegerField(default=0, verbose_name="总活跃度")

    def __str__(self):
        return self.user.username

    class Meta:
        verbose_name = "用户会员资料"
        verbose_name_plural = "用户会员资料"

    # ===================== 新增：核心功能方法 =====================
    @property
    def level_min_score(self):
        """各等级最低活跃度要求"""
        return {1: 0, 2: 300, 3: 700, 4: 1500}.get(self.level, 0)

    def calculate_activity(self):
        """按规则计算总活跃度"""
        return int(
            self.active_time * 0.1 +
            self.post_num * 5 +
            self.comment_num * 5 +
            self.like_num * 10
            
        )

    def auto_upgrade(self):
        """根据活跃度自动升级等级"""
        score = self.total_activity
        if score >= 1500:
            self.level = 4
        elif score >= 700:
            self.level = 3
        elif score >= 300:
            self.level = 2
        else:
            self.level = 1

    def save(self, *args, **kwargs):
        """重写保存方法，自动执行计算/升级/管理员联动"""
        # 新用户初始化
        if not self.pk:
            self.total_activity = self.calculate_activity()
            super().save(*args, **kwargs)
            return

        # 读取修改前数据
        old_data = UserInfo.objects.get(pk=self.pk)
        # 管理员手动改等级 → 同步活跃度为最低分
        if old_data.level != self.level:
            self.total_activity = self.level_min_score
        # 正常更新 → 自动计算+升级
        else:
            self.total_activity = self.calculate_activity()
            self.auto_upgrade()

        super().save(*args, **kwargs)

# 原有信号：新用户自动创建UserInfo（必须保留）
@receiver(post_save, sender=User)
def create_user_info(sender, instance, created, **kwargs):
    if created:
        UserInfo.objects.get_or_create(user=instance)

from django.db.models.signals import post_save
from django.contrib.auth.models import User
from django.dispatch import receiver

@receiver(post_save, sender=User)
def create_user_info(sender, instance, created, **kwargs):
    """新用户创建时，自动生成会员扩展信息"""
    if created:
        UserInfo.objects.get_or_create(user=instance)