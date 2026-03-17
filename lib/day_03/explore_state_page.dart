import 'dart:math';

import 'package:flutter/material.dart';

class ExploreStatePage extends StatefulWidget {
  const ExploreStatePage({super.key});

  @override
  State<ExploreStatePage> createState() => _ExploreStatePageState();
}

class _ExploreStatePageState extends State<ExploreStatePage> {
  int counter = 0;
  Color backgroundColor = Colors.white;
  bool showContainer = false;

  void _randomCounter() {
    setState(() {
      counter = Random().nextInt(100);
    });
  }

  void _changeBackgroundColor() {
    if (backgroundColor == Colors.white) {
      backgroundColor = Colors.blueGrey;
    } else {
      backgroundColor = Colors.white;
    }

    // print('Color $backgroundColor');
    setState(() {});
  }

  void _toggleContainer() {
    setState(() {
      showContainer = !showContainer;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      // app header
      appBar: AppBar(title: Text('state'), centerTitle: true),

      // body
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            //
            // Text("Counter: $counter", style: TextStyle(fontSize: 30)),
            //
            Text(
              "ShowContainer: $showContainer",
              style: TextStyle(fontSize: 30),
            ),

            // Text("Color: $backgroundColor", style: TextStyle(fontSize: 30)),
            SizedBox(height: 16),

            showContainer
                ? Container(height: 200, width: 200, color: Colors.amber)
                : Text('Container is Hidden'),

            SizedBox(height: 16),

            // InkWell(
            //   onTap: () {
            //     _randomCounter();
            //   },
            //   child: Text('Clicke Me'),
            // ),

            // SizedBox(height: 16),

            // InkWell(
            //   onTap: () {
            //     _changeBackgroundColor();
            //   },
            //   child: Text('Change Color'),
            // ),

            // SizedBox(height: 16),
            InkWell(onTap: _toggleContainer, child: Text('Toggle Container')),
          ],
        ),
      ),
    );
  }
}
