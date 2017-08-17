from django.conf.urls import include, url
from drf_auto_endpoint.router import router

from .views import UserViewSet


router.registerViewSet(r'userinfos', UserViewSet)

urlpatterns = [
    url(r'', include(router.urls)),
]
