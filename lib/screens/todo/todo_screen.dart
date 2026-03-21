import 'package:flutter/material.dart';
import 'package:flutter_event_navigation/model/todo_model.dart';
import 'package:flutter_event_navigation/service/app_service.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  List<TodoModel> todos = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //
      appBar: AppBar(title: Text('Todo API')),

      // body
      body: Center(
        child: Column(
          spacing: 10,
          mainAxisAlignment: .center,
          children: [
            ElevatedButton(
              onPressed: () async {
                todos = await AppService().fetchTodo();
                setState(() {});
              },
              child: Text('Fetch Todos'),
            ),

            if (todos.isEmpty) Text('Todo List is Empty'),

            Expanded(
              child: ListView.separated(
                itemCount: todos.length,
                itemBuilder: (context, index) {
                  final todo = todos[index];

                  return ListTile(
                    title: Text(todo.title),
                    subtitle: Text('${todo.userId} / ${todo.isCompleted}'),
                  );
                },
                separatorBuilder: (context, index) {
                  return Divider();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
