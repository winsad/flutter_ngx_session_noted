class ApiReponse<T> {
  final bool success;
  final String message;
  final T? data;

  ApiReponse({required this.success, required this.message, this.data});

  factory ApiReponse.fromJson(
    Map<String, dynamic> json,
    T Function(Map<String, dynamic> j) fromJsonT,
  ) {
    return ApiReponse<T>(
      success: json['success'] as bool? ?? false,
      message: json['message'] as String? ?? '',
      data: json['data'] != null
          ? fromJsonT(json['data'] as Map<String, dynamic>)
          : null,
    );
  }
}
