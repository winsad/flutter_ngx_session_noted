import 'package:flutter/material.dart';

class ActionButtonPage extends StatefulWidget {
  const ActionButtonPage({super.key});

  @override
  State<ActionButtonPage> createState() => _ActionButtonPageState();
}

class _ActionButtonPageState extends State<ActionButtonPage> {
  String _display = '';

  void _onTapHeader() {
    setState(() {
      _display = "App Bar Header";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: InkWell(
          onTap: () {
            _onTapHeader();
            // setState(() {
            //   _display = "App Bar Header";
            // });
          },
          child: Text('Action Button Page'),
        ),
        centerTitle: true,
      ),

      // body
      body: Center(
        child: Column(
          spacing: 16,
          mainAxisAlignment: .start,
          children: [
            Text('You Clicked ON : $_display'),

            // text button
            TextButton(
              onPressed: () {
                setState(() {
                  _display = 'TEXT BUTTON';
                });
                //
                print('You Clicked on TextButton');
              },
              child: Text('Clicked Me'),
            ),

            InkWell(
              onTap: () {
                setState(() {
                  _display = 'Ink Well';
                });
                //
                print('You Clicked on TextButton');
              },
              child: Container(padding: .all(8), child: Text('Clicked Me')),
            ),

            TextButton(
              onPressed: () {
                setState(() {
                  _display = 'TEXT BUTTON CANCEL';
                });
                //
                print('You Clicked on TextButton');
              },
              child: Text('Cancel', style: TextStyle(color: Colors.red)),
            ),

            // icon button
            Row(
              mainAxisAlignment: .center,
              spacing: 20,
              children: [
                IconButton(
                  onPressed: () {
                    //
                    setState(() {
                      _display = 'ICON BUTTON MINUS';
                    });

                    print('Clicked on ICON BUTTON MINUS');
                  },
                  icon: Icon(Icons.remove, color: Colors.blue),
                ),

                IconButton(
                  onPressed: () {
                    //
                    setState(() {
                      _display = 'ICON BUTTON ADD';
                    });
                    print('Clicked on ICON BUTTON ADD');
                  },
                  icon: Icon(Icons.add, color: Colors.blue),
                ),
              ],
            ),

            // outline icons
            OutlinedButton(
              onPressed: () {
                //
                setState(() {
                  _display = 'OUTLINE BUTTON';
                });
                print('Clicked on OUTLINE BUTTON');
              },
              child: Text('Clicked On OUTLINE BUTTON'),
            ),

            // elevated button
            ElevatedButton(
              style: ButtonStyle(backgroundColor: .all(Colors.blue)),
              onPressed: () {
                setState(() {
                  _display = 'Elevated BUTTON';
                });
                print('Clicked on Elevated BUTTON');
              },
              onLongPress: () {
                print('On Long Press');
              },
              child: Text('Clicked on Elevated Button'),
            ),

            // ink well
            InkWell(
              onTap: () {
                setState(() {
                  _display = "InkWell onTap";
                });
              },
              onDoubleTap: () {
                setState(() {
                  _display = "InkWell onDoubleTap";
                });
              },
              child: Container(
                height: 40,
                width: 200,
                alignment: .center,
                decoration: BoxDecoration(
                  borderRadius: .circular(8),
                  // color: Colors.blue,
                ),
                child: Text('Continue', style: TextStyle(color: Colors.black)),
              ),
            ),

            // gesture detector
            GestureDetector(
              onTap: () {
                setState(() {
                  _display = "GestureDetector onTap";
                });
              },
              onDoubleTap: () {
                setState(() {
                  _display = "GestureDetector onDoubleTap";
                });
              },
              child: Container(
                height: 40,
                width: 200,
                alignment: .center,
                decoration: BoxDecoration(
                  borderRadius: .circular(8),
                  color: Colors.blue,
                ),
                child: Text('Continue', style: TextStyle(color: Colors.black)),
              ),
            ),
          ],
        ),
      ),

      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {},
      //   child: Icon(Icons.add),
      // ),
    );
  }
}
