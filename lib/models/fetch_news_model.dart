class FetchHeadlinesModel {
  final String category;
  final String country;
  final int pageSize;
  final int page;

  FetchHeadlinesModel({
    required this.category,
    required this.country,
    required this.pageSize,
    required this.page,
  });

  // to json
  Map<String, dynamic> toJson() {
    if (category == 'all') {
      return {'country': country, 'pageSize': pageSize, 'page': page};
    }

    return {
      'category': category,
      'country': 'us',
      'pageSize': pageSize,
      'page': page,
    };
  }
}

class NewsSearchModel {
  final String searchText;
  final int pageSize;
  final int page;

  NewsSearchModel({
    required this.searchText,
    required this.pageSize,
    required this.page,
  });

  // to json
  Map<String, dynamic> toJson() {
    return {
      'q': searchText,
      'sortBy': 'publishedAt',
      'pageSize': pageSize,
      'page': page,
    };
  }
}
