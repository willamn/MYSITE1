from django.contrib import admin
from .models import Category, Truck, News

admin.site.register(Category)
admin.site.register(Truck)

@admin.register(News)
class NewsAdmin(admin.ModelAdmin):
    # ✅ 1. 列表页新增「浏览量」列，后台一眼就能看到每条资讯的阅读数
    list_display = ("title", "is_top_news", "create_time", "views")
    
    # ✅ 2. 把浏览量设为只读，后台编辑页只能看不能改，避免数据混乱
    readonly_fields = ("views",)
    
    # ✅ 3. 编辑页显示的字段（保留你原来的，加上views）
    fields = ("title", "summary", "content", "img", "is_top_news", "views")



from .models import DevDocument,DevTools,CooperateInfo

admin.site.register(DevDocument)
admin.site.register(DevTools)
admin.site.register(CooperateInfo)

from .models import HotCar

@admin.register(HotCar)
class HotCarAdmin(admin.ModelAdmin):
    list_display = ('name', 'cover_image', 'sort', 'is_active')
    list_editable = ('sort', 'is_active')  # 后台可直接改排序、上下架
    search_fields = ('name',)
    # 编辑页分块显示，和你现有的News模型风格保持一致
    fieldsets = (
        ('基础信息', {'fields': ('name', 'cover_image', 'short_desc', 'sort', 'is_active')}),
        ('图文详情', {'fields': ('detail_content',)}),
    )