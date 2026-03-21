import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //
      appBar: AppBar(
        title: Text('Counter Provider'),
        actions: [
          IconButton(
            onPressed: () {
              // toggle theme
              context.read<ThemeProvider>().toggleTheme();
            },
            icon: Icon(Icons.settings),
          ),
        ],
      ),

      body: Center(
        child: Padding(
          padding: .all(10),
          child: Column(
            spacing: 10,
            mainAxisAlignment: .center,
            crossAxisAlignment: .center,
            children: [
              Text('Count Value'),

              Selector<ThemeProvider, ThemeMode>(
                selector: (_, provider) => provider.themeMode,
                builder: (context, theme, child) {
                  return Text(theme.name.toUpperCase());
                },
              ),

              Selector<CounterProvider, int>(
                selector: (_, provider) => provider.count,
                builder: (context, count, child) {
                  return Text('$count');
                },
              ),

              Selector<CounterProvider, String>(
                selector: (_, provider) => provider.random,
                builder: (context, random, child) {
                  return Text('$random ');
                },
              ),

              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ScreenThree()),
                  );
                },
                child: Text('Go Screen Two'),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Row(
        mainAxisAlignment: .spaceAround,
        children: [
          FloatingActionButton(
            heroTag: 'button-1',
            onPressed: () {
              context.read<CounterProvider>().increase();
            },
            child: Icon(CupertinoIcons.add),
          ),

          FloatingActionButton(
            heroTag: 'button-2',
            onPressed: () {
              context.read<CounterProvider>().onRandom();
            },
            child: Icon(CupertinoIcons.shuffle),
          ),
        ],
      ),
    );
  }
}

class ScreenThree extends StatelessWidget {
  const ScreenThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              // toggle theme
              context.read<ThemeProvider>().toggleTheme();
            },
            icon: Icon(Icons.settings),
          ),
        ],
      ),
      body: Center(
        child: Selector<CounterProvider, int>(
          selector: (_, provider) => provider.count,
          builder: (context, count, child) {
            return Text('$count');
          },
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<CounterProvider>().increase();
        },
        child: Icon(CupertinoIcons.add),
      ),
    );
  }
}

class CounterProvider extends ChangeNotifier {
  int _count = 1;
  int get count => _count;

  String _random = 'N/A';
  String get random => _random;

  void increase() {
    _count = _count + 1;
    notifyListeners();
  }

  // random value
  void onRandom() {
    _random = 'Random: ${Random().nextInt(1000)}';
    notifyListeners();
  }
}

class ThemeProvider extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;
  ThemeMode get themeMode => _themeMode;

  void toggleTheme() {
    _themeMode = themeMode == ThemeMode.light
        ? ThemeMode.dark
        : ThemeMode.light;

    notifyListeners();
  }
}
