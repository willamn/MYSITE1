from django.contrib import admin
from .models import Post, Comment, Like, Collect, PostRule, Notice

# 帖子后台管理（保留审核功能）
class PostAdmin(admin.ModelAdmin):
    list_display = ('title', 'author', 'status', 'create_time')
    list_editable = ('status',)
    list_filter = ('status',)
    fields = ('title', 'content', 'author', 'status')

# 注册所有模型，后台可编辑
admin.site.register(Post, PostAdmin)
admin.site.register(Comment)
admin.site.register(Like)
admin.site.register(Collect)
admin.site.register(PostRule)  # 发帖须知
admin.site.register(Notice)     # 论坛公告




