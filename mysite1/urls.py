from django.contrib import admin
from django.urls import path, include
from django.conf import settings
from django.conf.urls.static import static
from django.contrib.auth import views as auth_views
from trucks import views as trucks_views 

urlpatterns = [
    path('admin/', admin.site.urls),
    path('login/', trucks_views.user_login, name='login'),
    path('logout/', auth_views.LogoutView.as_view(next_page='/')),
    path('ckeditor5/', include('django_ckeditor_5.urls')),
    path('forum/', include('forum.urls')),
    path('', include('trucks.urls')),
]

# 开发环境下，让Django处理上传的媒体文件（图片）
# 仅在DEBUG模式生效，不影响生产环境，也不改动任何原有路由
if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)