from django.db import models
from django.contrib.auth.models import User
from django.core.validators import FileExtensionValidator

# 帖子分类（和你前台的板块完全对应）
CATEGORY_CHOICES = (
    ('new_car', '新车测评'),
    ('maintain', '维修保养'),
    ('modify', '整车改装'),
    ('chat', '闲聊灌水'),
    ('tech_help', '技术求助'),
    ('tech_share', '技术交流'),
)

# 帖子模型（带分类+审核状态）
class Post(models.Model):
    is_top = models.BooleanField(verbose_name="置顶帖子", default=False)
    STATUS_CHOICES = (
        (0, '待审核'),
        (1, '已发布'),
        (2, '热门帖子'),
    )
    title = models.CharField(max_length=200, verbose_name="帖子标题")
    content = models.TextField(verbose_name="帖子内容")
    category = models.CharField(max_length=20, choices=CATEGORY_CHOICES, verbose_name="帖子分类", default='chat')
    author = models.ForeignKey(User, on_delete=models.CASCADE, verbose_name="发布者")
    status = models.IntegerField(choices=STATUS_CHOICES, default=0, verbose_name="帖子状态")
    create_time = models.DateTimeField(auto_now_add=True, verbose_name="发布时间")
    is_audited = models.BooleanField(default=False, verbose_name="是否审核通过")
    # 新增：帖子图片字段（完全兼容你现有模型，可选上传）
    image = models.ImageField(
        upload_to='forum/posts/%Y/%m/',  # 图片按日期存到 media/forum/posts/年/月/ 下
        blank=True,  # 允许不填（纯文字帖子也能发）
        null=True,
        verbose_name="帖子图片",
        validators=[FileExtensionValidator(allowed_extensions=['jpg', 'jpeg', 'png', 'gif'])]  # 仅允许图片格式
    )

    def __str__(self):
        return self.title

    class Meta:
        ordering = ['-create_time']
        verbose_name = "帖子"
        verbose_name_plural = "帖子"

#帖子图片模型
class PostImage(models.Model):
    post = models.ForeignKey(
        Post, 
        on_delete=models.CASCADE, 
        related_name='images',  # 必须写这个！
        verbose_name="所属帖子"
    )
    image = models.ImageField(upload_to='forum/posts/%Y/%m/', verbose_name="帖子图片")

# 发帖须知模型（后台可编辑）
class PostRule(models.Model):
    content = models.TextField(verbose_name="发帖须知内容")
    update_time = models.DateTimeField(auto_now=True, verbose_name="更新时间")

    def __str__(self):
        return "发帖须知"
    class Meta:
        verbose_name = "发帖须知"
        verbose_name_plural = "发帖须知"

# 论坛公告模型（后台可发布）
class Notice(models.Model):
    title = models.CharField(max_length=100, verbose_name="公告标题")
    content = models.TextField(verbose_name="公告内容")
    is_top = models.BooleanField(default=True, verbose_name="置顶公告")
    create_time = models.DateTimeField(auto_now_add=True, verbose_name="发布时间")

    def __str__(self):
        return self.title
    class Meta:
        verbose_name = "论坛公告"
        verbose_name_plural = "论坛公告"
        ordering = ['-is_top', '-create_time']

# 评论模型
class Comment(models.Model):
    post = models.ForeignKey(Post, related_name='comments', on_delete=models.CASCADE, verbose_name="所属帖子")
    user = models.ForeignKey(User, on_delete=models.CASCADE, verbose_name="评论用户")
    content = models.TextField(verbose_name="评论内容")
    create_time = models.DateTimeField(auto_now_add=True, verbose_name="评论时间")

    def __str__(self):
        return f"{self.user.username} 评论了 {self.post.title}"
    class Meta:
        verbose_name = "评论"
        verbose_name_plural = "评论"

# 点赞模型
class Like(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE, verbose_name="点赞用户")
    post = models.ForeignKey(Post, related_name='likes', on_delete=models.CASCADE, verbose_name="点赞帖子")
    create_time = models.DateTimeField(auto_now_add=True, verbose_name="点赞时间")

    class Meta:
        unique_together = ('user', 'post')
        verbose_name = "点赞"
        verbose_name_plural = "点赞"

# 收藏模型
class Collect(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE, verbose_name="收藏用户")
    post = models.ForeignKey(Post, related_name='collects', on_delete=models.CASCADE, verbose_name="收藏帖子")
    create_time = models.DateTimeField(auto_now_add=True, verbose_name="收藏时间")

    class Meta:
        unique_together = ('user', 'post')
        verbose_name = "收藏"
        verbose_name_plural = "收藏"


