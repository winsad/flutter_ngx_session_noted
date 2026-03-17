import 'package:flutter/material.dart';

class UserCardPage extends StatelessWidget {
  const UserCardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,

      // header
      appBar: AppBar(title: Text('User Card Page'), centerTitle: true),

      // body
      body: Center(
        child: Container(
          width: 300,
          height: 450,
          padding: .all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.black26),
          ),

          // child
          child: Column(
            spacing: 10,
            children: [
              //
              Container(
                padding: .all(4),
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  shape: .circle,
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 4,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: CircleAvatar(
                  foregroundImage: AssetImage('assets/images/user.jpg'),
                ),
              ),

              Text(
                'John Doe',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
              ),
              Text(
                'Web Developer',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  color: Colors.grey,
                ),
              ),
              Text(
                'Passionate about creating beautiful and functional website. Alway\'s learning and exploring new technologies',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                ),
              ),

              SizedBox(height: 20),

              // row icons
              Row(
                mainAxisAlignment: .center,
                spacing: 15,
                children: [
                  // icon1
                  Container(
                    height: 40,
                    width: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.black12,
                      shape: BoxShape.circle,
                    ),

                    child: Icon(Icons.home, color: Colors.black54),
                  ),

                  // icon 2
                  Container(
                    height: 40,
                    width: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.black12,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.access_alarm, color: Colors.black54),
                  ),

                  // icon 3
                  Container(
                    height: 40,
                    width: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.black12,
                      shape: BoxShape.circle,
                    ),

                    child: Icon(Icons.safety_check, color: Colors.black54),
                  ),

                  // icons 4
                  Container(
                    height: 40,
                    width: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.black12,
                      shape: BoxShape.circle,
                    ),

                    child: Icon(Icons.settings, color: Colors.black54),
                  ),
                ],
              ),

              SizedBox(height: 10),

              //
              Container(
                height: 50,
                width: double.infinity,
                alignment: .center,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: .circular(10),
                ),
                child: Text(
                  'Connect',
                  style: TextStyle(
                    color: Colors.white,
                    letterSpacing: 1,
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
