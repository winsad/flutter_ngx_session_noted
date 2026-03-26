class NewsResponse {
  final String status;
  final int totalResults;
  final List<NewsModel> articles;

  NewsResponse({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  factory NewsResponse.fromJson(Map<String, dynamic> json) {
    return NewsResponse(
      status: json['status'] ?? 'error',
      totalResults: json['totalResults'] ?? 0,
      articles: (json['articles'] as List<dynamic>? ?? [])
          .map((item) => NewsModel.fromJson(item as Map<String, dynamic>))
          .toList(),
    );
  }
}

class NewsModel {
  final SourceModel source;
  final String title;
  final String description;
  final String urlToImage;
  final String url;
  final String author;
  final DateTime publishedAt;
  final String category;
  final String content;

  const NewsModel({
    required this.source,
    required this.title,
    required this.description,
    required this.urlToImage,
    required this.author,
    required this.url,
    required this.publishedAt,
    required this.category,
    required this.content,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      source: SourceModel.fromJson(json['source'] ?? {}),
      title: json['title'] ?? 'No Title',
      description: json['description'] ?? '',
      urlToImage: json['urlToImage'] ?? '',
      author: json['author'] ?? 'Unknown',
      url: json['url'] ?? '',
      publishedAt:
          DateTime.tryParse(json['publishedAt'] ?? '') ?? DateTime.now(),
      category: json['category'] ?? 'general',
      content: json['content'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
    'source': source.toJson(),
    'title': title,
    'description': description,
    'urlToImage': urlToImage,
    'author': author,
    'url': url,
    'publishedAt': publishedAt.toIso8601String(),
    'category': category,
    'content': content,
  };
}

class SourceModel {
  final String id;
  final String name;

  SourceModel({required this.id, required this.name});

  factory SourceModel.fromJson(Map<String, dynamic> json) {
    return SourceModel(id: json['id'] ?? '', name: json['name'] ?? '');
  }

  factory SourceModel.init() {
    return SourceModel(id: '', name: '');
  }

  Map<String, dynamic> toJson() => {'id': id, 'name': name};
}
