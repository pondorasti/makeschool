from django.shortcuts import render
from django.views.generic.list import ListView
from django.views.generic.detail import DetailView

from wiki.models import Article


class ArticleListView(ListView):
    """ Renders a list of all Articles. """
    model = Article

    def get(self, request):
        """ GET a list of Articles. """
        articles = self.get_queryset().all()
        return render(request, 'list.html', {
          'articles': articles
        })

class ArticleDetailView(DetailView):
    """ Renders a specific article based on it's slug."""
    model = Article

    def get(self, request, slug):
        """ Returns a specific wiki article by slug. """
        article = self.get_queryset().get(slug__iexact=slug)
        return render(request, 'article.html', {
          'article': article
        })
