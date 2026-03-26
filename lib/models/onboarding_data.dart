import 'package:flutter/material.dart' show Color;

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
