// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_event_navigation/routes/routes.dart';
import 'package:flutter_event_navigation/screens/details/detail_screen.dart';
import 'package:flutter_event_navigation/screens/user_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // header
      appBar: AppBar(title: Text("Home Page"), centerTitle: true, elevation: 1),

      // body
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          crossAxisAlignment: .center,
          spacing: 10,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, RouteName.layoutPage);
              },
              child: Text('Go Layout Page'),
            ),

            if (false)
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, RouteName.bookListing);
                },
                child: Text('Book Listing'),
              ),

            if (false)
              ElevatedButton(
                onPressed: () async {
                  // push to detail screen
                  // await Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) {
                  //       return DetailScreen(
                  //         user: UserModel(age: 30, name: 'Sombat', sex: 'Male'),
                  //       );
                  //     },
                  //   ),
                  // ).then((response) {
                  //   log('Response from Details : $response');
                  //   if (response is UserModel) {
                  //     showDialog(
                  //       context: context,
                  //       builder: (context) {
                  //         return AlertDialog(
                  //           title: Text(
                  //             'You have an response value ${response.name} ${response.age}',
                  //           ),
                  //         );
                  //       },
                  //     );
                  //   }
                  // });

                  // push with name
                  Navigator.pushNamed(
                    context,
                    RouteName.detail,
                    arguments: UserModel(age: 30, name: 'Sombat', sex: 'Male'),
                  );
                },
                child: Text('Go To Detail Page 1'),
              ),

            if (false)
              ElevatedButton(
                onPressed: () {
                  // push to detail screen
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return DetailScreen(
                          user: UserModel(age: 22, name: 'John', sex: "Male"),
                        );
                      },
                    ),
                  );
                },
                child: Text('Go To Detail Page 2'),
              ),
            if (false)
              ElevatedButton(
                onPressed: () {
                  // push to detail screen
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) {
                  //       return SettingScreen(
                  //         user: UserModel(age: 30, name: 'Sombat', sex: 'Male'),
                  //       );
                  //     },
                  //   ),
                  // );

                  Navigator.pushNamed(context, RouteName.setting);
                },
                child: Text('Go Setting by Named'),
              ),
            if (false)
              ElevatedButton(
                onPressed: () {
                  // push to detail screen
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) {
                  //       return SettingScreen(
                  //         user: UserModel(age: 30, name: 'Sombat', sex: 'Male'),
                  //       );
                  //     },
                  //   ),
                  // );

                  if (Navigator.canPop(context)) Navigator.pop(context);
                },
                child: Text('POP'),
              ),

            // ElevatedButton(
            //   onPressed: () {
            //     // push to detail screen
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //         builder: (context) {
            //           return SettingScreen(
            //             user: UserModel(age: 30, name: 'Sombat', sex: 'Male'),
            //           );
            //         },
            //       ),
            //     );
            //   },
            //   child: Text('Go Setting by MaterialPageRoute'),
            // ),

            // ElevatedButton(
            //   onPressed: () {
            //     // push to detail screen
            //     // Navigator.push(
            //     //   context,
            //     //   MaterialPageRoute(
            //     //     builder: (context) {
            //     //       return SettingScreen(
            //     //         user: UserModel(age: 30, name: 'Sombat', sex: 'Male'),
            //     //       );
            //     //     },
            //     //   ),
            //     // );
            //     // ios base
            //     Navigator.push(
            //       context,
            //       CupertinoPageRoute(
            //         builder: (context) => SettingScreen(
            //           user: UserModel(age: 30, name: 'Sombat', sex: 'Male'),
            //         ),
            //       ),
            //     );
            //   },
            //   child: Text('Go Setting By CupertinoPageRoute'),
            // ),
          ],
        ),
      ),
    );
  }
}
