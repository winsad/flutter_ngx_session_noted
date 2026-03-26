import 'package:flutter/material.dart';
import 'package:flutter_mobile_application/models/news_model.dart';
import 'package:flutter_mobile_application/preferences/app_preferences.dart';

class BookmarkProvider extends ChangeNotifier {
  final AppPreferences _prefs = AppPreferences();
  List<NewsModel> _bookmarks = [];

  List<NewsModel> get bookmarks => List.unmodifiable(_bookmarks);

  BookmarkProvider() {
    _loadBookmarks();
  }

  Future<void> _loadBookmarks() async {
    _bookmarks = await _prefs.getBookmarks();
    notifyListeners();
  }

  bool isBookmarked(String id) => _bookmarks.any((b) => b.source.id == id);

  Future<void> toggleBookmark(NewsModel article) async {
    if (isBookmarked(article.source.id)) {
      _bookmarks.removeWhere((b) => b.source.id == article.source.id);
    } else {
      _bookmarks.insert(0, article);
    }
    notifyListeners();
    await _prefs.saveBookmarks(_bookmarks);
  }

  Future<void> removeBookmark(String id) async {
    _bookmarks.removeWhere((b) => b.source.id == id);
    notifyListeners();
    await _prefs.saveBookmarks(_bookmarks);
  }

  Future<void> clearAll() async {
    _bookmarks.clear();
    notifyListeners();
    await _prefs.saveBookmarks(_bookmarks);
  }
}
