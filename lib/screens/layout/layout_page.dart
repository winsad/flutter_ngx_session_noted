import 'package:flutter/material.dart';

class LayoutPage extends StatefulWidget {
  const LayoutPage({super.key});

  @override
  State<LayoutPage> createState() => _LayoutPageState();
}

class _LayoutPageState extends State<LayoutPage> with TickerProviderStateMixin {
  late final TabController _controller = TabController(
    length: 3,
    vsync: this,
    initialIndex: 0,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // header
      appBar: AppBar(title: Text('Layout Page')),

      // TapBar
      body: DefaultTabController(
        length: 3,
        initialIndex: _controller.index,
        child: Column(
          children: [
            // tab bar header
            TabBar(
              controller: _controller,
              // isScrollable: true,
              // tabAlignment: TabAlignment.start,
              dividerColor: Colors.transparent,
              tabs: [
                Tab(text: 'Tab 1'),
                Tab(text: 'Tab 2'),
                Tab(text: 'Tab 3'),
              ],
            ),

            // tab bar view/body
            Expanded(
              child: TabBarView(
                controller: _controller,
                children: [
                  Center(
                    child: Column(
                      mainAxisAlignment: .center,
                      children: [
                        Text('Tab View 1'),
                        TextButton(
                          onPressed: () {
                            //
                            _controller.animateTo(1);
                          },
                          child: Text('Next'),
                        ),
                      ],
                    ),
                  ),
                  Center(child: Text('Tab View 2')),
                  Center(child: Text('Tab View 3')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}




    //   body: Center(
    //     child: Stack(
    //       fit: StackFit.expand,
    //       // mainAxisAlignment: .center,
    //       // crossAxisAlignment: .center,
    //       children: [
    //         //
    //         Image.network('https://covers.openlibrary.org/b/id/12711613-L.jpg'),

    //         Align(
    //           alignment: .center,
    //           child: Container(
    //             height: 200,
    //             width: 200,
    //             decoration: BoxDecoration(
    //               color: Colors.red.withValues(alpha: 0.5),
    //             ),
    //             child: Text('This is Layer Two'),
    //           ),
    //         ),

    //         Align(
    //           alignment: .center,
    //           child: Container(
    //             height: 100,
    //             width: 100,
    //             decoration: BoxDecoration(color: Colors.amber),
    //             child: Text('This is Layer Three'),
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    // );