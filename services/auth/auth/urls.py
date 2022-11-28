from django.contrib import admin
from django.urls import path, include

from rest_framework_simplejwt.views import (
    TokenObtainPairView,
    TokenRefreshView,
    TokenVerifyView,
)

from core.urls import router

urlpatterns = [
    path("admin/", admin.site.urls),
    path("api/auth/admin/", admin.site.urls),
    path("api/auth/api/", include(router.urls)),
    path("api/auth/api/token/", TokenObtainPairView.as_view(), name="token_obtain_pair"),
    path("api/auth/api/token/refresh/", TokenRefreshView.as_view(), name="token_refresh"),
    path("api/auth/api/token/verify/", TokenVerifyView.as_view(), name="token_verify"),
]
