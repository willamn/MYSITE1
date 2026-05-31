# rbac/apps.py（恢复默认）
from django.apps import AppConfig

class RbacConfig(AppConfig):
    default_auto_field = 'django.db.models.BigAutoField'
    name = 'rbac'