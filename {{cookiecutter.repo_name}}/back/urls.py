from django.conf.urls import include, url
from django.contrib import admin
from django.conf import settings

from rest_framework import urls as drf_urls

from levit_report import urls as report_urls

from {{ cookiecutter.repo_name }} import api_urls
from {{ cookiecutter.repo_name }}.views import (EmberView, MeView, LoginView, LogoutView,
                                                service_worker_view, root_files_view)

from export_app import urls as export_app_urls, settings as export_app_settings


urlpatterns = []

if settings.DEBUG:
    urlpatterns = [
        url(r'(?P<filetype>(service-worker|sw-toolbox))(?P<buildhash>(-\w*)?)\.js$', service_worker_view),
        url(r'^(?P<filename>(crossdomain\.xml|manifest\.appcache|robots\.txt))$', root_files_view),
    ]

urlpatterns += [
    # Examples:
    # url(r'^$', '.views.home', name='home'),
    # url(r'^blog/', include('blog.urls')),

    url(r'^admin/', include(admin.site.urls)),
    url(r'^api/v1/', include(api_urls)),
    url(r'^api-auth/', include(drf_urls)),
    url(r'^api/auth/login/', LoginView.as_view()),
    url(r'^api/auth/logout/', LogoutView.as_view()),
    url(r'^api/auth/me/', MeView.as_view()),
    url(r'^models/', include(export_app_urls, namespace=export_app_settings.URL_NAMESPACE)),
    url(r'^reports/', include(report_urls)),

    url(r'', EmberView.as_view(template_name='index.html'), name='ember'),
]
