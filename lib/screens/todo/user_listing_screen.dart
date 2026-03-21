import 'package:flutter/material.dart';
import 'package:flutter_event_navigation/model/user_model.dart';
import 'package:flutter_event_navigation/service/app_service.dart';

class UserListingScreen extends StatefulWidget {
  const UserListingScreen({super.key});

  @override
  State<UserListingScreen> createState() => _UserListingScreenState();
}

class _UserListingScreenState extends State<UserListingScreen> {
  List<UserModel> users = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //
      appBar: AppBar(title: Text('User API'), centerTitle: true),

      // body
      body: Center(
        child: Column(
          spacing: 10,
          mainAxisAlignment: .center,
          children: [
            ElevatedButton(
              onPressed: () async {
                users = await AppService().fetchUser();
                setState(() {});
              },
              child: Text('Fetch Users'),
            ),

            if (users.isEmpty) Text('User List is Empty'),

            Expanded(
              child: ListView.separated(
                itemCount: users.length,
                itemBuilder: (context, index) {
                  final user = users[index];

                  return ListTile(
                    onTap: () async {
                      final response = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UserListDetails(user: user),
                        ),
                      );
                    },
                    title: Text(user.username),
                    subtitle: Text(user.email),
                    // subtitle: Text('${todo.userId} / ${todo.isCompleted}'),
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

class UserListDetails extends StatelessWidget {
  const UserListDetails({super.key, required this.user});
  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //
      appBar: AppBar(title: Text('User Details')),

      // body
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          spacing: 8,
          crossAxisAlignment: .start,
          children: [
            // raw
            Text('ID: ${user.id}'),
            Text('name: ${user.name}'),
            Text('username: ${user.username}'),
            Text('email: ${user.email}'),
            Text('phone: ${user.phone}'),
            Text('website: ${user.website}'),

            // company
            Text('Company :'),
            Text('Name: ${user.company?.name}'),
            Text('catchPhrase: ${user.company?.catchPhrase}'),
            Text('bs: ${user.company?.bs}'),
          ],
        ),
      ),
    );
  }
}
