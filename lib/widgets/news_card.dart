import 'package:flutter/material.dart';
import 'package:flutter_mobile_application/models/news_model.dart';

class NewsCardWidget extends StatelessWidget {
  final NewsModel article;
  final VoidCallback onTap;
  final bool showCategory;

  const NewsCardWidget({
    super.key,
    required this.article,
    required this.onTap,
    this.showCategory = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.06),
              blurRadius: 16,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildImage(),
            Padding(
              padding: const EdgeInsets.all(14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (showCategory) _buildCategoryChip(context),
                  Text(
                    article.title,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                      height: 1.4,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  if (article.description.isNotEmpty)
                    Text(
                      article.description,
                      style: theme.textTheme.bodySmall?.copyWith(height: 1.5),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  const SizedBox(height: 12),
                  _buildMeta(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImage() {
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
      child: AspectRatio(
        aspectRatio: 16 / 9,
        child: article.urlToImage.isNotEmpty
            ? Image.network(
                article.urlToImage,
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
    );
  }

  Widget _buildCategoryChip(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        decoration: BoxDecoration(
          color: const Color(0xFFEEF2FF),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          article.category.toUpperCase(),
          style: const TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w700,
            color: Color(0xFF4F46E5),
            letterSpacing: 0.8,
          ),
        ),
      ),
    );
  }

  Widget _buildMeta(BuildContext context) {
    final theme = Theme.of(context);
    final timeAgo = _getTimeAgo(article.publishedAt);
    return Row(
      children: [
        const Icon(Icons.source_outlined, size: 14, color: Color(0xFF6B7280)),
        const SizedBox(width: 4),
        Expanded(
          child: Text(
            article.source.name,
            style: theme.textTheme.bodySmall?.copyWith(
              fontWeight: FontWeight.w600,
              color: const Color(0xFF374151),
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        const SizedBox(width: 8),
        const Icon(
          Icons.access_time_rounded,
          size: 14,
          color: Color(0xFF6B7280),
        ),
        const SizedBox(width: 4),
        Text(timeAgo, style: theme.textTheme.bodySmall),
      ],
    );
  }

  String _getTimeAgo(DateTime date) {
    final diff = DateTime.now().difference(date);
    if (diff.inDays >= 1) return '${diff.inDays}d ago';
    if (diff.inHours >= 1) return '${diff.inHours}h ago';
    return '${diff.inMinutes}m ago';
  }
}
