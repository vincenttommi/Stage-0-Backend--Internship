from django.urls import path
from .views import PublicationAPI  




urlpatterns = [
    path("publication/", PublicationAPI.as_view(), name="publication-api"),
]
