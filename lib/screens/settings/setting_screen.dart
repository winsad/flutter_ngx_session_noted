import 'package:flutter/material.dart';
import 'package:flutter_event_navigation/routes/routes.dart';
import 'package:flutter_event_navigation/screens/user_model.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key, required this.user});

  final UserModel user;

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // header
      appBar: AppBar(
        title: Text("Setting Page"),
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
            Text("This is Setting Page"),

            Column(
              crossAxisAlignment: .start,
              spacing: 5,
              children: [
                //
                Text(
                  'User Details',
                  style: TextStyle(fontWeight: .w500, fontSize: 16),
                ),
                Text('Name: ${widget.user.name}'),
                Text('Age: ${widget.user.age}'),
                Text('Sex: ${widget.user.sex}'),
              ],
            ),

            ElevatedButton(
              onPressed: () {
                // Navigator.pop(context);

                Navigator.popUntil(
                  context,
                  (route) => route.settings.name == RouteName.home,
                );
              },
              child: Text('Go Back Home'),
            ),
          ],
        ),
      ),
    );
  }
}
