import 'package:flutter/material.dart';
import 'package:flutter_event_navigation/routes/routes.dart';

const fontUbuntu = 'Ubuntu';
const fontRoboto = 'RobotoMono';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // await AppPreference().init();

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
      routes: appRoutes,
    );
  }
}
