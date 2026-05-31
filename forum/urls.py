from django.urls import path
from . import views


urlpatterns = [
    path('', views.community, name='community'),  # 社区首页
    path('publish/', views.publish_post, name='publish_post'),  # 发帖
    path('post/<int:post_id>/', views.post_detail, name='post_detail'),  # 帖子详情
    path('add_comment/', views.add_comment, name='add_comment'),  # 评论
    path('like/', views.like_post, name='like_post'),  # 点赞
    path('collect/', views.collect_post, name='collect_post'),  # 收藏
]