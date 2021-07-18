from django.urls import path
from wiki.views import ArticleListView, ArticleDetailView


urlpatterns = [
    path('', ArticleListView.as_view(), name='wiki-list-page'),
    path('w/<str:slug>/', ArticleDetailView.as_view(), name='wiki-details-page'),
]
