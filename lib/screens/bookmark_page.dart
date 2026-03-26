import 'package:flutter/material.dart';
import 'package:flutter_mobile_application/app/app_routes.dart';
import 'package:flutter_mobile_application/providers/account_provider.dart';
import 'package:flutter_mobile_application/providers/bookmark_provider.dart';
import 'package:flutter_mobile_application/widgets/news_list_widget.dart';
import 'package:provider/provider.dart';

class BookmarkPage extends StatelessWidget {
  const BookmarkPage({super.key});

  void _showClearAllDialog(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: const Text('Clear All Bookmarks?'),
        content: const Text('This will remove all your saved articles.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              context.read<BookmarkProvider>().clearAll();
              Navigator.pop(ctx);
            },
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text('Clear All'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: SafeArea(
        child: Consumer<AccountProvider>(
          builder: (BuildContext context, account, _) {
            if (account.isGuest) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFF7ED),
                          borderRadius: BorderRadius.circular(28),
                        ),
                        child: const Icon(
                          Icons.lock_outline_rounded,
                          size: 52,
                          color: Color(0xFFF59E0B),
                        ),
                      ),
                      const SizedBox(height: 24),
                      const Text(
                        'Sign in to save bookmarks',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF111827),
                        ),
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        'Create an account or sign in to bookmark articles and access them anytime.',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Color(0xFF6B7280), height: 1.5),
                      ),
                      const SizedBox(height: 32),
                      ElevatedButton(
                        onPressed: () => Navigator.pushReplacementNamed(
                          context,
                          AppRoutes.login,
                        ),
                        child: const Text('Sign In'),
                      ),
                    ],
                  ),
                ),
              );
            }

            return Padding(
              padding: .symmetric(horizontal: 16, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 8),
                    child: Row(
                      children: [
                        Text(
                          'Bookmarks',
                          style: Theme.of(context).textTheme.headlineLarge
                              ?.copyWith(
                                fontWeight: FontWeight.w800,
                                letterSpacing: -0.5,
                              ),
                        ),
                        const Spacer(),
                        Consumer<BookmarkProvider>(
                          builder: (ctx, bookmarks, _) {
                            if (bookmarks.bookmarks.isEmpty) {
                              return const SizedBox.shrink();
                            }
                            return TextButton.icon(
                              icon: const Icon(Icons.delete_outline, size: 18),
                              label: const Text('Clear all'),
                              style: TextButton.styleFrom(
                                foregroundColor: Colors.red,
                              ),
                              onPressed: () => _showClearAllDialog(context),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Consumer<BookmarkProvider>(
                      builder: (ctx, provider, _) {
                        // if the bookmark list is empty
                        if (provider.bookmarks.isEmpty) {
                          return Center(
                            child: const Text(
                              'No bookmarks yet',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFF111827),
                              ),
                            ),
                          );
                        }

                        return NewsListWidget(
                          news: provider.bookmarks,
                          showCategory: true,
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
