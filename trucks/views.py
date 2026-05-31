from django.shortcuts import render, get_object_or_404
from .models import Category, Truck, News
from .models import Truck, HotCar

from django.db.models import F

# 首页
def index(request):
    categories = Category.objects.all()
    recommends = Truck.objects.filter(is_recommend=True)[:6]
    news = News.objects.all()[:3]

    return render(request, 'index.html', {
        "categories": categories,
        "recommends": recommends,
        "news": news,
    })

# 产品中心
def product_list(request):
    categories = Category.objects.all()
    # 1. 新的：查询上架的热推车型，按排序号正序
    hot_cars = HotCar.objects.filter(is_active=True).order_by('sort')
    # 2. 原有逻辑：查询全部车型，按创建时间倒序（这里改成正确的字段名create_time）
    trucks = Truck.objects.all().order_by('-create_time')
    # 3. 传给模板：热推 + 原有车型
    return render(request, 'trucks/product_list.html', {
        'categories': categories,
        'hot_cars': hot_cars,  # 新增
        'trucks': trucks       # 原有，保留
    })

def hotcar_detail(request, pk):
    hotcar = get_object_or_404(HotCar, pk=pk)
    return render(request, 'trucks/hotcar_detail.html', {'hotcar': hotcar})

# 产品详情
def product_detail(request, pk):
    truck = get_object_or_404(Truck, pk=pk)
    return render(request, 'product_detail.html', {"truck": truck})

# 资讯
def news_list(request):
    # 1. 先拿全部资讯，按时间倒序
    all_news = list(News.objects.all().order_by("-create_time"))

    # 2. 手动筛选出3条置顶轮播资讯
    top_news_list = [n for n in all_news if n.is_top_news][:3]
    # 取出置顶资讯的ID集合
    top_ids = [item.id for item in top_news_list]

    # 3. 剩下的、不在轮播里的资讯
    bottom_news_list = [n for n in all_news if n.id not in top_ids]

    # 传给模板
    return render(request, "news.html", {
        "top_news": top_news_list,
        "all_news": bottom_news_list,
    })

def news_detail(request, pk):
    # 1. 获取当前资讯（和你原来的代码完全一致）
    new = get_object_or_404(News, pk=pk)

    # 2. 防刷标记：1小时内同一个用户只算1次浏览
    view_key = f"viewed_news_{pk}"
    if not request.session.get(view_key):
        # ✅ 浏览量+1（原子更新，高并发也不会错）
        News.objects.filter(pk=pk).update(views=F("views") + 1)
        # 记录访问状态，1小时内不再计数
        request.session[view_key] = True
        request.session.set_expiry(3600)  # 3600秒 = 1小时

    # 3. 刷新获取最新的浏览量
    new.refresh_from_db()

    # 4. 原有渲染逻辑（完全不变，模板还是用{{ new }}）
    return render(request, 'news_detail.html', {"new": new})

# 页面
def about(request): return render(request, 'about.html')
def company(request): return render(request, 'company.html')
def solutions(request): return render(request, 'solutions.html')
def service(request): return render(request, 'service.html')
def developer(request): return render(request, 'developer.html')

# 产品中心视图
def product_center(request):
    # 读取数据库里所有产品
    product_list = Truck.objects.all()
    # 把产品数据传给前端模板
    return render(request, 'trucks/product.html', {
        'product_list': product_list
    })

def product_detail(request, pk):
    truck = get_object_or_404(Truck, pk=pk)
    return render(request, 'product_detail.html', {"truck": truck})



# ========== 登录/注册/找回密码 视图（不改模型版） ==========
from django.contrib.auth.models import User
from django.contrib.auth import authenticate, login
from django.shortcuts import render, redirect
import re

# 登录视图（支持 用户名/手机号 双登录）
def user_login(request):
    if request.method == "POST":
        username_input = request.POST.get("phone")
        password = request.POST.get("password")
        login_type = request.POST.get("login_type", "user")

        # 优先按用户名/昵称查询 → 再按手机号查询
        user = User.objects.filter(first_name=username_input).first()
        if not user:
            user = User.objects.filter(username=username_input).first()

        # 验证用户和密码
        if user and user.check_password(password):
            if login_type == "admin" and not user.is_staff:
                return render(request, "trucks/login.html", {"error": "无管理员权限"})
            login(request, user)
            # 🔥 关键：登录成功后跳回用户之前的页面
            next_url = request.GET.get('next', '/')
            return redirect(next_url)
        # 错误提示
        return render(request, "trucks/login.html", {"error": "用户名/手机号或密码错误"})
    # GET请求时，把next参数传给模板（可选，更严谨）
    return render(request, "trucks/login.html", {"next": request.GET.get('next', '/')})

# 注册视图（新增用户名唯一校验）
def register(request):
    if request.method == "POST":
        phone = request.POST.get("phone")
        username = request.POST.get("username")  # 用户名/昵称
        pwd1 = request.POST.get("pwd1")
        pwd2 = request.POST.get("pwd2")

        # 1. 校验用户名不可重复
        if User.objects.filter(first_name=username).exists():
            return render(request, "trucks/register.html", {"error": "用户名已被使用"})
        # 2. 手机号格式校验
        if not re.match(r'^1[3-9]\d{9}$', phone):
            return render(request, "trucks/register.html", {"error": "手机号格式错误"})
        # 3. 密码一致校验
        if pwd1 != pwd2:
            return render(request, "trucks/register.html", {"error": "两次密码不一致"})
        # 4. 手机号不可重复
        if User.objects.filter(username=phone).exists():
            return render(request, "trucks/register.html", {"error": "手机号已注册"})

        # 创建用户
        User.objects.create_user(username=phone, password=pwd1, first_name=username)
        return redirect('login')
    return render(request, "trucks/register.html")

def find_pwd(request):
    if request.method == "POST":
        phone = request.POST.get("phone")
        pwd1 = request.POST.get("pwd1")
        pwd2 = request.POST.get("pwd2")

        try:
            user = User.objects.get(username=phone)
        except User.DoesNotExist:
            return render(request, "trucks/find_pwd.html", {"error": "手机号未注册"})

        if pwd1 != pwd2:
            return render(request, "trucks/find_pwd.html", {"error": "两次密码不一致"})

        user.set_password(pwd1)
        user.save()
        return redirect('login')
    return render(request, "trucks/find_pwd.html")

from django.contrib.auth.decorators import login_required
from forum.models import Post, Comment, Like, Collect
from .models import UserProfile
@login_required(login_url='/login/')
def user_center(request):
    user = request.user
    # 统计数据
    post_count = Post.objects.filter(author=user).count()
    comment_count = Comment.objects.filter(user=user).count()
    like_count = Like.objects.filter(user=user).count()
    collect_count = Collect.objects.filter(user=user).count()

    # 详情数据（用于页面内展示）
    my_posts = Post.objects.filter(author=user).order_by('-create_time')
    my_comments = Comment.objects.filter(user=user).select_related('post').order_by('-create_time')
    my_likes = Like.objects.filter(user=user).select_related('post').order_by('-create_time')
    my_collects = Collect.objects.filter(user=user).select_related('post').order_by('-create_time')

    return render(request, 'trucks/user_center.html', {
        'user': user,
        'post_count': post_count,
        'comment_count': comment_count,
        'like_count': like_count,
        'collect_count': collect_count,
        # 详情列表
        'my_posts': my_posts,
        'my_comments': my_comments,
        'my_likes': my_likes,
        'my_collects': my_collects,
    })

@login_required(login_url='/login/')
def upload_avatar(request):
    if request.method == 'POST':
        # 获取用户上传的文件
        avatar_file = request.FILES.get('avatar')
        if avatar_file:
            # 验证：只允许上传图片格式
            if not avatar_file.content_type.startswith('image/'):
                return redirect('user_center')  # 非图片直接返回
            
            # 获取或创建用户资料（老用户自动创建）
            profile, created = UserProfile.objects.get_or_create(user=request.user)
            # 保存头像文件
            profile.avatar = avatar_file
            profile.save()
    # 上传完成后，重定向回用户中心
    return redirect('user_center')


from .models import DevDocument,DevTools,CooperateInfo
# 开发者文档页面
def document_all(request):
    doc_data = DevDocument.objects.all()
    return render(request, 'trucks/doc_page.html', locals())


from django.http import HttpResponse
from django.shortcuts import get_object_or_404
import os

# 新增：处理文档的在线查看/下载
def document_action(request, doc_id, action):
    # 获取文档对象，用你的 DevDocument 模型
    doc = get_object_or_404(DevDocument, id=doc_id)
    file_path = doc.doc_file.path
    filename = os.path.basename(file_path)

    # 读取文件内容
    with open(file_path, 'rb') as f:
        file_data = f.read()

    # 构建响应
    response = HttpResponse(file_data)
    
    # 关键：区分「在线查看」和「下载」的响应头
    if action == 'view':
        # 在线查看：设置 inline，让浏览器直接打开
        response['Content-Disposition'] = f'inline; filename="{filename}"'
        # 必须设置正确的MIME类型，PDF用这个，图片/文本需对应修改
        response['Content-Type'] = 'application/pdf'
    elif action == 'download':
        # 下载：设置 attachment，强制下载
        response['Content-Disposition'] = f'attachment; filename="{filename}"'
        response['Content-Type'] = 'application/octet-stream'

    return response

# 开发工具包页面
def tools_all(request):
    tool_data = DevTools.objects.all()
    return render(request, 'trucks/tool_page.html', locals())

# 合作开发计划页面
def cooperate_detail(request):
    # 获取所有合作计划，按最后更新时间倒序排列，最新的在最前面
    cooperate_list = CooperateInfo.objects.all().order_by('-last_update')
    return render(request, 'trucks/cooperate_page.html', {'cooperate_list': cooperate_list})