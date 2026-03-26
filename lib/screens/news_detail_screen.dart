// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_mobile_application/app/app_routes.dart';
import 'package:flutter_mobile_application/models/news_model.dart';
import 'package:flutter_mobile_application/providers/account_provider.dart';
import 'package:flutter_mobile_application/providers/bookmark_provider.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsDetailScreen extends StatelessWidget {
  final NewsModel news;
  const NewsDetailScreen({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 240,
            pinned: true,
            leading: Container(
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const BackButton(color: Color(0xFF111827)),
            ),
            actions: [
              IconButton(
                icon: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(
                    Icons.share_rounded,
                    color: Color(0xFF111827),
                    size: 20,
                  ),
                ),
                onPressed: _onClickedShare,
              ),
              const SizedBox(width: 8),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: news.urlToImage.isNotEmpty
                  ? Image.network(
                      news.urlToImage,
                      fit: BoxFit.cover,
                      errorBuilder: (_, _, _) => Container(
                        color: const Color(0xFFEEEEEE),
                        child: const Icon(
                          Icons.broken_image_rounded,
                          size: 60,
                          color: Color(0xFFBDBDBD),
                        ),
                      ),
                    )
                  : Container(
                      color: const Color(0xFFEEEEEE),
                      child: const Icon(
                        Icons.broken_image_rounded,
                        size: 60,
                        color: Color(0xFFBDBDBD),
                      ),
                    ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFEEF2FF),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      news.category.toUpperCase(),
                      style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF4F46E5),
                        letterSpacing: 0.8,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    news.title,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.w800,
                      height: 1.3,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      const Icon(
                        Icons.source_outlined,
                        size: 16,
                        color: Color(0xFF6B7280),
                      ),
                      const SizedBox(width: 6),
                      Text(
                        news.source.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF374151),
                          fontSize: 13,
                        ),
                      ),
                      const SizedBox(width: 16),
                      const Icon(
                        Icons.calendar_today_outlined,
                        size: 14,
                        color: Color(0xFF6B7280),
                      ),
                      const SizedBox(width: 6),
                      Text(
                        _formatDate(news.publishedAt),
                        style: const TextStyle(
                          color: Color(0xFF6B7280),
                          fontSize: 13,
                        ),
                      ),

                      Spacer(),
                      Consumer<BookmarkProvider>(
                        builder: (BuildContext context, provider, _) {
                          final isBookmarked = provider.isBookmarked(
                            news.source.id,
                          );

                          return GestureDetector(
                            child: SizedBox(
                              child: Icon(
                                isBookmarked
                                    ? Icons.bookmark_rounded
                                    : Icons.bookmark_border_rounded,
                                color: isBookmarked
                                    ? const Color(0xFF1A73E8)
                                    : const Color(0xFF111827),
                                size: 22,
                              ),
                            ),
                            onTap: () async {
                              final account = context.read<AccountProvider>();

                              if (account.isGuest) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: const Text(
                                      'Sign in to save bookmarks',
                                    ),
                                    action: SnackBarAction(
                                      label: 'Sign In',
                                      onPressed: () =>
                                          Navigator.pushReplacementNamed(
                                            context,
                                            AppRoutes.login,
                                          ),
                                    ),
                                  ),
                                );
                                return;
                              }

                              await provider.toggleBookmark(news);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    isBookmarked
                                        ? 'Bookmark removed'
                                        : 'Article bookmarked!',
                                  ),
                                  duration: const Duration(milliseconds: 500),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ],
                  ),
                  const Divider(height: 32),
                  if (news.description.isNotEmpty)
                    Text(
                      news.description,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: const Color(0xFF374151),
                        fontWeight: FontWeight.w500,
                        height: 1.6,
                      ),
                    ),
                  if (news.description.isNotEmpty) const SizedBox(height: 16),
                  Text(
                    _cleanContent(news.content),
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: const Color(0xFF4B5563),
                      height: 1.7,
                    ),
                  ),
                  const SizedBox(height: 32),
                  if (news.url.isNotEmpty)
                    GestureDetector(
                      onTap: _onClickedLaunchUrl,
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: const Color(0xFF1A73E8),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          spacing: 8,
                          children: [
                            const Icon(
                              Icons.open_in_new_rounded,
                              size: 18,
                              color: Colors.white,
                            ),
                            const Text(
                              'Read Full Article',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _formatDate(DateTime date) {
    const months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];
    return '${months[date.month - 1]} ${date.day}, ${date.year}';
  }

  String _cleanContent(String content) {
    if (content.isEmpty) return 'No additional content available.';
    final bracketIndex = content.lastIndexOf('[');
    if (bracketIndex > 0) return content.substring(0, bracketIndex).trim();
    return content;
  }

  Future<void> _onClickedLaunchUrl() async {
    final uri = Uri.tryParse(news.url);
    if (uri != null && await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  void _onClickedShare() {
    SharePlus.instance.share(ShareParams(text: '${news.title}\n\n${news.url}'));
  }
}
