import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // header
      appBar: AppBar(title: Text("Flutter Day 02"), centerTitle: true),

      // body page
      body: Center(
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            spacing: 10,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // container
              Container(
                //
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                    topRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                  ),
                  border: Border.all(color: Colors.grey, width: 1),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.red,
                      blurRadius: 8,
                      offset: Offset(0, 4),
                    ),
                  ],
                  //
                ),
              ),

              // alignment: Alignment.bottomCenter,
              // padding: EdgeInsets.all(16),
              // margin: EdgeInsets.all(16),
              // child: Container(
              //   //
              //   margin: EdgeInsets.all(16),
              //   height: 200,
              //   width: 150,
              //   color: Colors.brown,
              // ),
              // Text("1. Hello, Flutter"),
              // Text("2. Hello, Flutter"),
              // Text("3. Hello, Flutter"),
              // Text("4. Hello, Flutter"),
              // Text("5. Hello, Flutter"),
              // Text("6. Hello, Flutter"),

              // Container(
              //   height: 50,
              //   width: double.infinity,
              //   color: Colors.blueGrey,
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: [
              //       Expanded(
              //         child: Container(
              //           color: Colors.amber,
              //           alignment: Alignment.center,
              //           child: Text("1. Row"),
              //         ),
              //       ), // 50%
              //       Expanded(
              //         child: Container(
              //           color: Colors.red,
              //           alignment: Alignment.center,
              //           child: Text("2. Row"),
              //         ),
              //       ), // 25%
              //       Expanded(
              //         child: Container(
              //           color: Colors.blue,
              //           alignment: Alignment.center,
              //           child: Text("3. Row"),
              //         ),
              //       ), // 25%
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _layout() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // // Default Text
          // Text(
          //   "Hello, Flutter!",
          //   maxLines: 1,
          //   overflow: TextOverflow.ellipsis,
          //   textAlign: TextAlign.center,
          //   style: TextStyle(
          //     fontSize: 30,
          //     color: Colors.red,
          //     fontWeight: FontWeight.normal,
          //   ),
          // ),

          // SizedBox(height: 16),

          // Text(
          //   "This is the subtitle of the Hello Flutter Content.",
          //   maxLines: 1,
          //   overflow: TextOverflow.ellipsis,
          //   textAlign: TextAlign.center,
          //   style: TextStyle(
          //     fontSize: 14,
          //     color: Colors.black,
          //     fontWeight: FontWeight.normal,
          //     // wordSpacing: 5,
          //     // letterSpacing: 5,
          //   ),
          // ),

          // SizedBox(height: 16),
          // //  "This is the subtitle of the Hello Flutter Content.",
          // RichText(
          //   text: TextSpan(
          //     text: "This is the subtitle of the ",
          //     style: TextStyle(
          //       fontSize: 14,
          //       fontWeight: FontWeight.normal,
          //       color: Colors.black,
          //     ),
          //     children: [
          //       TextSpan(
          //         text: 'Hello Flutter Content. ',
          //         style: TextStyle(
          //           fontWeight: FontWeight.bold,
          //           color: Colors.red,
          //         ),
          //       ),

          //       TextSpan(
          //         text: 'With Text Decorations Style',
          //         style: TextStyle(decoration: TextDecoration.underline),
          //       ),
          //     ],
          //   ),
          // ),

          // SizedBox(height: 16),

          // // Icons
          // Icon(Icons.home, size: 30, color: Colors.blue),
          // Icon(Icons.arrow_downward, size: 30, color: Colors.blue),
          // Icon(Icons.settings, size: 40, color: Colors.black),
          // SizedBox(height: 16),

          // Image Widget
          // get from assets folder in the app
          // Image.asset('assets/images/user.jpg', height: 200, width: 200),

          // SizedBox(height: 16),
          Image.asset(
            'assets/images/user.jpg',
            height: 100,
            width: 100,
            fit: BoxFit.contain,
          ),
          SizedBox(height: 16),

          // Image.network(''),
          Image.network(
            'https://www.pngall.com/wp-content/uploads/5/Profile-Male-PNG.png',
            height: 200,
            width: 200,

            loadingBuilder: (context, child, loadingProgress) {
              // what will we do while download the image
              if (loadingProgress == null) {
                return child;
              }
              return Center(child: Icon(Icons.sync, color: Colors.blueAccent));
            },

            errorBuilder: (context, error, stackTrace) {
              // what we will do if we got error on download
              return Text(
                "Can not load the Image",
                style: TextStyle(color: Colors.red),
              );
            },
          ),

          // // get from local devices
          // Image.memory(''),
          // Image.file(''),
        ],
      ),
    );
  }
}
