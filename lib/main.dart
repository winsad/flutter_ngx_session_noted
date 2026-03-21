import 'package:flutter/material.dart';
import 'package:flutter_event_navigation/preference/app_preference.dart';
import 'package:flutter_event_navigation/routes/routes.dart';
import 'package:flutter_event_navigation/screens/provider_page/provider_page.dart';
import 'package:provider/provider.dart';

const fontUbuntu = 'Ubuntu';
const fontRoboto = 'RobotoMono';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await AppPreference().init();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CounterProvider()),
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Selector<ThemeProvider, ThemeMode>(
      selector: (_, provider) => provider.themeMode,
      builder: (context, theme, child) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: .fromSeed(seedColor: Colors.blue),
            fontFamily: fontUbuntu,
          ),
          darkTheme: ThemeData.dark(),
          themeMode: theme,
          debugShowCheckedModeBanner: false,
          initialRoute: RouteName.counterProvider,
          routes: appRoutes,
        );
      },
    );
  }
}
