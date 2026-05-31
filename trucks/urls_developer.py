from django.urls import path
from . import views

urlpatterns = [
    path('', views.developer, name='developer'),
]