import 'package:flutter/material.dart';
import 'package:flutter_event_navigation/day_06/list_sample_page.dart';

const fontUbuntu = 'Ubuntu';
const fontRoboto = 'RobotoMono';

// 1. The Entry point
void main() {
  // Run the app
  runApp(const MyApp());
}

// 1. The Entry point
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
        fontFamily: fontUbuntu,
      ),
      debugShowCheckedModeBanner: false,
      home: ListSamplePage(),
    );
  }
}
