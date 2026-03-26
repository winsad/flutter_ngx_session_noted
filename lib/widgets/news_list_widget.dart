import 'package:flutter/material.dart';
import 'package:flutter_mobile_application/app/app_routes.dart';
import 'package:flutter_mobile_application/models/news_model.dart';
import 'package:flutter_mobile_application/widgets/common_loading_widget.dart';
import 'package:flutter_mobile_application/widgets/news_card.dart';

class NewsListWidget extends StatefulWidget {
  final List<NewsModel> news;
  final bool isLoading;
  final bool isLoadingMore;
  final String? error;
  final VoidCallback? onRefresh;
  final VoidCallback? onLoadMore;
  final bool showCategory;
  final bool hasNextPage;

  const NewsListWidget({
    super.key,
    required this.news,
    this.isLoading = false,
    this.isLoadingMore = false,
    this.error,
    this.onRefresh,
    this.onLoadMore,
    this.showCategory = false,
    this.hasNextPage = true,
  });

  @override
  State<NewsListWidget> createState() => _NewsListWidgetState();
}

class _NewsListWidgetState extends State<NewsListWidget> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    // Trigger load more when scrolling near the bottom
    if (_scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent - 500 &&
        !widget.isLoadingMore &&
        widget.hasNextPage &&
        widget.onLoadMore != null) {
      widget.onLoadMore!();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isLoading && widget.news.isEmpty) {
      return CommonLoadingWidget(color: Colors.blue);
    }

    if (widget.error != null && widget.news.isEmpty) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 10,
          children: [
            Text(
              'Failed to load news',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            if (widget.onRefresh != null)
              TextButton.icon(
                icon: const Icon(Icons.refresh_rounded),
                label: const Text('Retry'),
                onPressed: widget.onRefresh,
              ),
          ],
        ),
      );
    }

    if (widget.news.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 10,
          children: [
            Text('No Data Founded'),
            if (widget.onRefresh != null)
              TextButton(
                onPressed: widget.onRefresh,
                child: Text('Tab to Refresh'),
              ),
          ],
        ),
      );
    }

    if (widget.onRefresh != null) {
      return RefreshIndicator(
        onRefresh: () async => widget.onRefresh!(),
        color: const Color(0xFF1A73E8),
        child: _buildNewsList(),
      );
    }

    return _buildNewsList();
  }

  Widget _buildNewsList() {
    return ListView.builder(
      controller: _scrollController,
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemCount: widget.news.length + (widget.isLoadingMore ? 1 : 0),
      itemBuilder: (ctx, i) {
        // Show loading indicator at the bottom
        if (i == widget.news.length) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Center(
              child: SizedBox(
                width: 32,
                height: 32,
                child: CircularProgressIndicator(
                  color: const Color(0xFF1A73E8),
                  strokeWidth: 2,
                ),
              ),
            ),
          );
        }

        return NewsCardWidget(
          article: widget.news[i],
          showCategory: widget.showCategory,
          onTap: () => Navigator.pushNamed(
            ctx,
            AppRoutes.newsDetail,
            arguments: widget.news[i],
          ),
        );
      },
    );
  }
}
