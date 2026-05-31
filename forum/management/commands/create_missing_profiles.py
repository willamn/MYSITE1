# forum/management/commands/create_missing_profiles.py
from django.core.management.base import BaseCommand
from django.contrib.auth.models import User
from forum.models import UserProfile

class Command(BaseCommand):
    help = "为所有没有forum.UserProfile的用户批量创建会员信息"

    def handle(self, *args, **options):
        # 找出所有没有关联forum.UserProfile的用户
        users_without_profile = []
        for user in User.objects.all():
            try:
                user.forum_profile
            except UserProfile.DoesNotExist:
                users_without_profile.append(user)
        
        # 批量创建会员信息
        created_count = 0
        for user in users_without_profile:
            UserProfile.objects.create(user=user)
            created_count += 1
            self.stdout.write(f"为用户 {user.username} 创建了会员信息")
        
        self.stdout.write(
            self.style.SUCCESS(
                f"✅ 成功为 {created_count} 个用户创建了会员信息"
            )
        )