import 'package:flutter/material.dart';

// 1. The Entry point
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
      // home: HomePageStateLess(),
    );
  }
}

/// What is diff btw stateless and statefulwidget

// stateless
class HomePageStateLess extends StatelessWidget {
  HomePageStateLess({super.key});

  int _counter = 0;

  void _incrementCounter() {
    // setState(() {
    _counter = _counter + 1;
    print('Counter Value: $_counter');
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Counter App"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            const Text('Hello World'),
            Text(
              'This counter is: $_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            OutlinedButton(onPressed: () {}, child: Text('Click Me')),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

// stateful
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decreaseCounter() {
    setState(() {
      _counter = _counter - 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.blue, title: Text(widget.title)),
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            const Text('Hello World'),
            const Text('Welcome to Flutter Evening'),
            Text(
              'This counter is: $_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            OutlinedButton(onPressed: () {}, child: Text('Click Me')),
          ],
        ),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FloatingActionButton(
            onPressed: _decreaseCounter,
            tooltip: 'Increment',
            child: Text('-'),
          ),

          FloatingActionButton(
            onPressed: _incrementCounter,
            tooltip: 'Increment',
            child: Text('+'),
          ),
        ],
      ),
    );
  }
}
