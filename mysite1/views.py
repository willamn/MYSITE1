from django.http import HttpResponse


def page_2023_view(request):
    html = "<h1>这是第一个页面</h1>"
    return HttpResponse(html)