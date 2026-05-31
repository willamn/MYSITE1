from django.urls import path
from . import views

urlpatterns = [
    path('', views.index, name='index'),

    # 🔥 新增：登录/注册/找回密码/用户中心
    path('login/', views.user_login, name='login'),
    path('register/', views.register, name='register'),
    path('find-pwd/', views.find_pwd, name='find_pwd'),

    path('user-center/', views.user_center, name='user_center'),
    path('upload-avatar/', views.upload_avatar, name='upload_avatar'),

    # 产品（
    path('trucks/', views.product_list, name='trucks'),
    path('trucks/<int:pk>/', views.product_detail, name='truck_detail'),
    path('trucks/hotcar/<int:pk>/', views.hotcar_detail, name='hotcar_detail'),

    # 资讯
    path('news/', views.news_list, name='news'),
    path('news/<int:pk>/', views.news_detail, name='news_detail'),

    # 其他页面
    path('about/', views.about, name='about'),
    path('company/', views.company, name='company'),
    path('solutions/', views.solutions, name='solutions'),
    path('service/', views.service, name='service'),
    path('developer/', views.developer, name='developer'),
    path('document/', views.document_all, name='document'),
    path('document/<int:doc_id>/<str:action>/', views.document_action, name='document_action'),
    path('devtools/', views.tools_all, name='devtools'),
    path('cooperate/', views.cooperate_detail, name='cooperate'),
]