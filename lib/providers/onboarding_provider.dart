import 'package:flutter/material.dart';
import 'package:flutter_mobile_application/preferences/app_preferences.dart';

class OnboardingProvider extends ChangeNotifier {
  final AppPreferences _appPreferences = AppPreferences();

  List<OnboardingPageData> pages = [
    OnboardingPageData(
      emoji: '📰',
      title: 'Breaking News at Your Fingertips',
      description:
          'Get the latest headlines from around the world, delivered instantly to your device.',
      color: Color(0xFF1A73E8),
      bgColor: Color(0xFFEFF6FF),
    ),
    OnboardingPageData(
      emoji: '🗂️',
      title: 'Explore Every Category',
      description:
          'Browse technology, sports, health, business, and more — all in one place.',
      color: Color(0xFF7C3AED),
      bgColor: Color(0xFFF5F3FF),
    ),
    OnboardingPageData(
      emoji: '🔖',
      title: 'Save & Read Later',
      description:
          'Bookmark your favorite articles and access them anytime from your saved list.',
      color: Color(0xFF059669),
      bgColor: Color(0xFFECFDF5),
    ),
  ];

  OnboardingPageData? _activeOnboarding;
  OnboardingPageData get activeOnboarding => _activeOnboarding ?? pages.first;

  int _activeIndex = 0;
  int get activeIndex => _activeIndex;

  bool get isFirst => _activeIndex == 0;
  bool get isLast => _activeIndex == pages.length - 1;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  // on page changed
  void onPageChanged(int index) {
    _activeIndex = index;
    _activeOnboarding = pages[index];
    notifyListeners();
  }

  Future onFinished() async {
    _isLoading = true;
    notifyListeners();

    await Future.delayed(Duration(seconds: 1));
    await _appPreferences.updateOnboarding(true);

    _isLoading = false;
    notifyListeners();
  }
}

class OnboardingPageData {
  final String emoji;
  final String title;
  final String description;
  final Color color;
  final Color bgColor;

  const OnboardingPageData({
    required this.emoji,
    required this.title,
    required this.description,
    required this.color,
    required this.bgColor,
  });
}
