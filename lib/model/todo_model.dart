class TodoModel {
  final int userId;
  final int id;
  final String title;
  final bool isCompleted;

  const TodoModel({
    required this.id,
    required this.isCompleted,
    required this.title,
    required this.userId,
  });

  // fromJson
  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(
      id: json['id'] ?? -1,
      userId: json['userId'] ?? -1,
      title: json['title'] ?? '',
      isCompleted: json['completed'] ?? false,
    );
  }

  // toJson
  Map<String, dynamic> toJson() {
    return {
      "userId": userId,
      "id": id,
      "title": title,
      "completed": isCompleted,
    };
  }
}
