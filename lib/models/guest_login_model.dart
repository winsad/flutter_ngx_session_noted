class GuestLoginModel {
  final String token;
  final String role;
  final String expiresIn;

  GuestLoginModel({
    required this.token,
    required this.role,
    required this.expiresIn,
  });

  factory GuestLoginModel.fromJson(Map<String, dynamic> json) {
    return GuestLoginModel(
      token: json['token'] ?? '',
      role: json['role'] ?? '',
      expiresIn: json['expiresIn'] ?? '',
    );
  }
}
