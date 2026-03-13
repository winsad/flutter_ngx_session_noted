import 'package:flutter/material.dart';
import 'package:flutter_event_navigation/main.dart';
import 'package:flutter_event_navigation/screens/user_model.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key, required this.user});

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // header
      appBar: AppBar(
        title: Text("Detail Page"),
        centerTitle: true,
        elevation: 1,
      ),

      // body
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          crossAxisAlignment: .center,
          spacing: 10,
          children: [
            Text("This is User Detail Page"),

            // properties
            Column(
              crossAxisAlignment: .start,
              spacing: 5,
              children: [
                Text('User'),
                Text("Name: ${user.name}"),
                Text("Age: ${user.age}"),
                Text("Sex: ${user.sex}"),
              ],
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Go Back Home'),
            ),

            ElevatedButton(
              onPressed: () {
                final newUser = UserModel(age: 10, name: 'Test', sex: "F");
                Navigator.pop(context, newUser);
              },
              child: Text('Back With Result'),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(RouteName.setting);
              },
              child: Text('Go Setting'),
            ),
          ],
        ),
      ),
    );
  }
}

// Home Screen => Detail Screen => Setting Screen
