import 'dart:convert';

import 'package:flutter_event_navigation/model/todo_model.dart';
import 'package:flutter_event_navigation/model/user_model.dart';
import 'package:http/http.dart' as http;

class AppService {
  //
  final String _baseUrl = "https://jsonplaceholder.typicode.com/";
  final _todo = 'todos';
  final _user = 'users';

  /// fetch todo
  Future<List<TodoModel>> fetchTodo() async {
    print("Srtart Fetch Data");

    try {
      final response = await http.get(
        Uri.parse(_baseUrl + _todo),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body) as List<dynamic>;
        // get the raw json data
        final List<TodoModel> todos = data.map((json) {
          return TodoModel.fromJson(json);
        }).toList();

        return todos;
      } else {
        print('failed');
        return [];
      }
    } catch (e) {
      print("Error $e");
      return [];
    }
  }

  /// fetch users
  Future<List<UserModel>> fetchUser() async {
    //
    print('Start Fetch User');

    try {
      // action
      final response = await http.get(
        Uri.parse(_baseUrl + _user),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body) as List;

        // convert to user model
        final users = data.map((json) {
          return UserModel.fromJson(json);
        }).toList();

        return users;
      } else {
        return [];
      }
    } catch (error) {
      // on error
      print('Error $error');
      return [];
    } finally {
      // after the process
      print('Finished Fetch User');
    }
  }
}
