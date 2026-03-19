void test() {
  final user1 = User(name: 'name1', email: 'email1', phone: 'phone1');
  final user2 = User(name: 'name1', email: 'email1', phone: 'phone1');

  print(user1 == user2);

  // final user2 = user1.copyWith(phone: 'phone2');
  //user2 = User(name: 'name1', email: 'email1', phone: 'phone2');
}

class User {
  final int? id;
  final String name;
  final String email;
  final String phone;
  final DateTime createdAt;

  User({
    this.id,
    required this.name,
    required this.email,
    required this.phone,
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now();

  // to map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] as int,
      name: map['name'] as String,
      email: map['email'] as String,
      phone: map['phone'] as String,
      createdAt: DateTime.parse(map['createdAt'] as String),
    );
  }

  User copyWith({
    int? id,
    String? name,
    String? email,
    String? phone,
    DateTime? createdAt,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  String toString() =>
      'User(id: $id, name: $name, email: $email, phone: $phone, createdAt: $createdAt)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is User &&
        other.id == id &&
        other.name == name &&
        other.email == email &&
        other.phone == phone &&
        other.createdAt == createdAt;
  }

  @override
  int get hashCode =>
      id.hashCode ^
      name.hashCode ^
      email.hashCode ^
      phone.hashCode ^
      createdAt.hashCode;
}
