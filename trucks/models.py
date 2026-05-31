from django.db import models
from django_ckeditor_5.fields import CKEditor5Field
from django.contrib.auth.models import User

# 1. 产品类型
class Category(models.Model):
    name = models.CharField("产品类型名称", max_length=50)

    def __str__(self):
        return self.name

    class Meta:
        verbose_name = "产品类型"
        verbose_name_plural = "产品类型"

# 2. 产品（带类型）
class Truck(models.Model):
    category = models.ForeignKey(Category, on_delete=models.CASCADE, verbose_name="产品类型", default=1)
    name = models.CharField("产品名称", max_length=100)
    brand = models.CharField("品牌", max_length=50)
    price = models.DecimalField("价格", max_digits=10, decimal_places=2)
    stock = models.IntegerField("库存", default=0)
    img_url = models.ImageField(
    upload_to='trucks/product/',
    verbose_name="产品上传图片",
    blank=True,
    null=True
    )
    intro = models.TextField("介绍", blank=True)
    is_recommend = models.BooleanField("是否推荐", default=False)
    create_time = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.name

    class Meta:
        verbose_name = "产品"
        verbose_name_plural = "产品"

#  热推车型
class HotCar(models.Model):
    name = models.CharField(max_length=100, verbose_name="车型名称")
    cover_image = models.ImageField(upload_to='hotcar_covers/', verbose_name="封面图")
    short_desc = models.CharField(max_length=200, verbose_name="简短简介")
    detail_content = CKEditor5Field(verbose_name="图文详情", config_name='default', blank=True, null=True)
    sort = models.IntegerField(default=0, verbose_name="排序号（数字越小越靠前）")
    is_active = models.BooleanField(default=True, verbose_name="是否上架/热推")
    created_at = models.DateTimeField(auto_now_add=True, verbose_name="创建时间")

    class Meta:
        verbose_name = "热推车型"
        verbose_name_plural = "热推车型"
        ordering = ['sort', '-created_at']

    def __str__(self):
        return self.name

# 3. 资讯
class News(models.Model):
    title = models.CharField(max_length=100, verbose_name="资讯标题")
    summary = models.TextField(verbose_name="简短简介", blank=True)
    content = CKEditor5Field(verbose_name="详细内容", config_name='default')

    # 1. 资讯封面图片
    img = models.ImageField(
        upload_to="news_cover/",
        verbose_name="资讯封面图片",
        blank=True,
        null=True
    )

    # 2. 最新时讯 / 顶部轮播选项（后台勾选）
    is_top_news = models.BooleanField(
        default=False,
        verbose_name="设为顶部最新时讯(轮播)"
    )

    # 发布时间
    create_time = models.DateTimeField(auto_now_add=True, verbose_name="发布时间")

    # 浏览量统计字段
    # 用PositiveIntegerField保证不会出现负数，默认初始值为0
    views = models.PositiveIntegerField(default=0, verbose_name="浏览量")

    def __str__(self):
        return self.title

    class Meta:
        verbose_name = "资讯管理"
        verbose_name_plural = "资讯管理"

#创建头像扩展模型
class UserProfile(models.Model):
    # 和 Django 默认 User 表一对一绑定，每个用户只有一个资料
    user = models.OneToOneField(User, on_delete=models.CASCADE, related_name='profile')
    # 头像字段，文件会自动存到 media/avatars/ 目录
    avatar = models.ImageField(upload_to='avatars/', null=True, blank=True, verbose_name='用户头像')

    def __str__(self):
        return self.user.first_name
    




from django.db import models
from django.utils import timezone

# 1.开发者文档模型
class DevDocument(models.Model):
    title = models.CharField(max_length=120, verbose_name="文档标题")
    introduce = models.TextField(blank=True, verbose_name="文档简介")
    doc_file = models.FileField(upload_to='file_docs/', verbose_name="上传文档文件")
    add_time = models.DateTimeField(default=timezone.now, verbose_name="上传时间")

    class Meta:
        verbose_name = "开发者文档"
        verbose_name_plural = verbose_name
        ordering = ['-add_time']

    def __str__(self):
        return self.title

# 2.开发工具包模型
class DevTools(models.Model):
    tool_name = models.CharField(max_length=120, verbose_name="工具包名称")
    version = models.CharField(max_length=40, verbose_name="版本号")
    tool_desc = models.TextField(verbose_name="工具介绍")
    tool_zip = models.FileField(upload_to='file_tools/', verbose_name="上传压缩包")
    release_time = models.DateTimeField(default=timezone.now, verbose_name="发布时间")

    class Meta:
        verbose_name = "开发工具包"
        verbose_name_plural = verbose_name
        ordering = ['-release_time']

    def __str__(self):
        return f"{self.tool_name} {self.version}"

# 3.合作开发计划模型（复用你已做好的图片上传）
class CooperateInfo(models.Model):
    plan_title = models.CharField(max_length=120, verbose_name="计划标题")
    plan_content = CKEditor5Field(verbose_name="详细图文内容", config_name='default')
    last_update = models.DateTimeField(auto_now=True, verbose_name="最后更新时间")

    class Meta:
        verbose_name = "合作开发计划"
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.plan_title

