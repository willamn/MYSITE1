from django.contrib import admin
from .models import Role, Permission, RolePerm, UserRole, UserInfo

# 原有模型注册
admin.site.register(Role)
admin.site.register(Permission)
admin.site.register(RolePerm)
admin.site.register(UserRole)

# 自定义用户资料后台，显示总活跃度
@admin.register(UserInfo)
class UserInfoAdmin(admin.ModelAdmin):
    list_display = ('user', 'nickname', 'level', 'total_activity', 'active_time', 'post_num', 'comment_num', 'like_num')
    search_fields = ('user__username', 'nickname')
    list_filter = ('level',)
    readonly_fields = ('total_activity',)