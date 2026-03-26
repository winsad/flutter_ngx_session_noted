import 'package:flutter/cupertino.dart';
import 'package:flutter_mobile_application/models/fetch_news_model.dart';
import 'package:flutter_mobile_application/models/news_model.dart';
import 'package:flutter_mobile_application/services/news_services.dart';

class HomeProvider extends ChangeNotifier {
  final _newsService = NewsServices();

  String _selectedCategory = 'all';
  String get selectedCategory => _selectedCategory;

  bool _loading = false;
  bool _loadingMore = false;
  List<NewsModel> _news = [];
  int _currentPage = 1;
  String? _error;
  bool _hasNextPage = true;
  final int _pageSize = 10;

  bool get loading => _loading;
  List<NewsModel> get news => _news;
  int get currentPage => _currentPage;
  String? get error => _error;
  bool get hasNextPage => _hasNextPage;
  bool get isLoadingMore => _loadingMore;

  static const List<String> categories = [
    'all',
    'technology',
    'business',
    'sports',
    'health',
    'entertainment',
    'science',
  ];

  void onSelectedCategory(String category) {
    _selectedCategory = category;
    fetchNews();
    notifyListeners();
  }

  Future<void> fetchNews({bool refresh = false}) async {
    if (_loading) return;

    _loading = true;
    _error = null;
    _currentPage = 1;
    _hasNextPage = true;
    if (!refresh) {
      _news = [];
    }
    notifyListeners();

    try {
      final response = await _newsService.fetchHeadlines(
        FetchHeadlinesModel(
          category: _selectedCategory,
          country: 'us',
          pageSize: _pageSize,
          page: _currentPage,
        ),
      );

      _news = List.from(response.articles);
      if (response.articles.length < _pageSize - 1) {
        _hasNextPage = false;
      }
      //
    } catch (e) {
      _error = e.toString();
    } finally {
      _loading = false;
      notifyListeners();
    }
  }

  Future<void> fetchMoreNews() async {
    if (_loading || _loadingMore || !_hasNextPage) return;

    _loadingMore = true;
    notifyListeners();

    try {
      final nextPage = _currentPage + 1;
      final result = await _newsService.fetchHeadlines(
        FetchHeadlinesModel(
          category: _selectedCategory,
          country: 'us',
          pageSize: _pageSize,
          page: nextPage,
        ),
      );

      if (result.articles.isNotEmpty) {
        _news.addAll(result.articles);
        _currentPage = nextPage;
      }

      if (result.articles.length < _pageSize - 1) {
        _hasNextPage = false;
      }
    } catch (e) {
      _error = e.toString();
      // Optional: don't set hasNextPage to false on error so user can retry
    } finally {
      _loadingMore = false;
      notifyListeners();
    }
  }
}
