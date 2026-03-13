import 'package:flutter/material.dart';
import 'package:flutter_event_navigation/screens/book_details.dart';
import 'package:flutter_event_navigation/screens/book_listing.dart';
import 'package:flutter_event_navigation/screens/detail_screen.dart';
import 'package:flutter_event_navigation/screens/home_screen.dart';
import 'package:flutter_event_navigation/screens/setting_screen.dart';
import 'package:flutter_event_navigation/screens/user_model.dart';

const fontUbuntu = 'Ubuntu';
const fontRoboto = 'RobotoMono';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.blue),
        fontFamily: fontUbuntu,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: RouteName.home,
      routes: {
        RouteName.home: (context) => HomeScreen(),
        RouteName.detail: (context) {
          final user = ModalRoute.of(context)?.settings.arguments as UserModel?;
          return DetailScreen(user: user!);
        },
        RouteName.setting: (context) => SettingScreen(
          user: UserModel(age: 30, name: 'Jonh', sex: 'M'),
        ),
        RouteName.bookListing: (context) => BookListing(),
        RouteName.bookDetails: (context) => BookDetails(),
      },
    );
  }
}

class RouteName {
  static const String home = '/';
  static const String detail = 'detail-screen';
  static const String setting = 'setting-screen';
  static const String bookListing = 'book-listing';
  static const String bookDetails = 'book-details';
}
