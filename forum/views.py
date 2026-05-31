from django.shortcuts import render, redirect, get_object_or_404
from django.contrib.auth.decorators import login_required
from django.http import JsonResponse
from .models import Post, Comment, Like, Collect, PostRule, Notice,PostImage
from trucks.models import UserProfile
from django.contrib.auth.models import User
from django.db.models import Count
from django.utils import timezone
from django.shortcuts import render

# 论坛首页（按分类过滤帖子，和你前台板块对应）
def community(request):
    # 论坛首页（按分类过滤帖子，和你前台板块对应）
    all_posts = Post.objects.filter(status__in=[1, 2])\
        .select_related('author', 'author__userinfo')\
        .order_by('-create_time')

    # 按分类过滤，对应你的前台板块
    new_car_posts = all_posts.filter(category='new_car')
    maintain_posts = all_posts.filter(category='maintain')
    modify_posts = all_posts.filter(category='modify')
    chat_posts = all_posts.filter(category='chat')
    tech_help_posts = all_posts.filter(category='tech_help')
    tech_share_posts = all_posts.filter(category='tech_share')

    # 1. 用户总数（所有注册账号）
    total_users = User.objects.count()

    # 2. 帖子总数（前台可展示全部帖子）
    total_posts = Post.objects.filter(status__in=[1,2]).count()

    # 3. 本月发帖数（已修复时区问题）
    now = timezone.now()
    month_start = now.replace(day=1, hour=0, minute=0, second=0, microsecond=0)
    month_posts = Post.objects.filter(
        create_time__gte=month_start,
        status__in=[1, 2]
    ).count()

    # 4. 会员总数（替换原在线会员，统计UserProfile里的业务会员）
    from rbac.models import UserInfo
    member_count = UserInfo.objects.filter(level__in=[2, 3, 4]).count()
    # 热门帖子（固定9条，置顶帖+热度排序）
    top_post = Post.objects.filter(is_top=True, status=2).first()
    hot_posts_others = Post.objects.filter(is_top=False, status=2).order_by('-likes')[:8]
    if top_post:
        hot_list = [top_post] + list(hot_posts_others)
    else:
        hot_list = list(hot_posts_others[:9])

    # 发帖须知
    post_rule = PostRule.objects.first()
    # 公告
    notices = Notice.objects.filter(is_top=True)

    return render(request, 'forum/community.html', {
        'new_car_posts': new_car_posts,
        'maintain_posts': maintain_posts,
        'modify_posts': modify_posts,
        'chat_posts': chat_posts,
        'tech_help_posts': tech_help_posts,
        'tech_share_posts': tech_share_posts,
        'hot_list': hot_list,
        'post_rule': post_rule,
        'notices': notices,

        'total_users': total_users,    # 用户总数
        'total_posts': total_posts,    # 帖子总数
        'month_posts': month_posts,    # 本月发帖
        'member_count': member_count   # 会员总数
    })
# 发布帖子（带分类选择）
@login_required(login_url='/login/')
@login_required(login_url='/login/')
def publish_post(request):
    if request.method == "POST":
        title = request.POST.get("title")
        content = request.POST.get("content")
        category = request.POST.get("category")
        author = request.user

        user_info = request.user.userinfo
        # 判断是否为至尊会员（level=4）
        if user_info.level == 4:
            # 至尊会员：免审核，直接标记为已通过
            post_status = 1
        else:
            # 其他用户：保持待审核状态
            post_status = 0

        # 创建帖子，带上动态设置的status
        post = Post.objects.create(
            title=title,
            content=content,
            category=category,
            author=author,
            status=post_status,  # 新增：动态设置审核状态
        )

        # 保存多张图片（逻辑完全不变）
        images = request.FILES.getlist("images")
        for img in images:
            if img:
                PostImage.objects.create(post=post, image=img)

        # 发帖成功后直接跳回论坛首页
        return redirect("community")

    return render(request, "forum/publish_post.html")
# 帖子详情页（带评论、点赞、收藏）
def post_detail(request, post_id):
    post = Post.objects.select_related('author', 'author__userinfo').get(id=post_id)
    post = get_object_or_404(Post, id=post_id, status__in=[1, 2])
    comments = post.comments.all().order_by('-create_time')
    
    # 处理未登录用户（给变量默认值，避免报错）
    if request.user.is_authenticated:
        is_liked = Like.objects.filter(user=request.user, post=post).exists()
        is_collected = Collect.objects.filter(user=request.user, post=post).exists()
    else:
        is_liked = False
        is_collected = False
    
    # 点赞数/收藏数
    like_count = post.likes.count()
    collect_count = post.collects.count()
    
    return render(request, 'forum/post_detail.html', {
        'post': post,
        'comments': comments,
        'is_liked': is_liked,
        'is_collected': is_collected,
        'like_count': like_count,
        'collect_count': collect_count,
    })

# 发表评论
@login_required(login_url='/login/')
def add_comment(request):
    if request.method == 'POST':
        post_id = request.POST.get('post_id')
        content = request.POST.get('content')
        post = get_object_or_404(Post, id=post_id)
        Comment.objects.create(post=post, user=request.user, content=content)
        return redirect('post_detail', post_id=post_id)

# 点赞/取消点赞
@login_required(login_url='/login/')
def like_post(request):
    post_id = request.GET.get('post_id')
    post = get_object_or_404(Post, id=post_id)
    like, created = Like.objects.get_or_create(user=request.user, post=post)
    if not created:
        like.delete()
    return JsonResponse({'like_count': post.likes.count()})

# 收藏/取消收藏
@login_required(login_url='/login/')
def collect_post(request):
    post_id = request.GET.get('post_id')
    post = get_object_or_404(Post, id=post_id)
    collect, created = Collect.objects.get_or_create(user=request.user, post=post)
    if not created:
        collect.delete()
    return JsonResponse({'collect_count': post.collects.count()})