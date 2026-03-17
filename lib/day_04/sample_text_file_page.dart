import 'package:flutter/material.dart';

class SampleTextFilePage extends StatefulWidget {
  const SampleTextFilePage({super.key});

  @override
  State<SampleTextFilePage> createState() => _SampleTextFilePageState();
}

class _SampleTextFilePageState extends State<SampleTextFilePage> {
  final passwordController = TextEditingController();
  final nameController = TextEditingController();

  @override
  void initState() {
    nameController.text = "John Doe";
    super.initState();
  }

  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.grey,

      // header
      appBar: AppBar(
        // backgroundColor: Colors.grey,
        centerTitle: true,
        title: Text('Sample TextField'),
      ),

      // body
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            spacing: 10,
            mainAxisAlignment: .center,
            children: [
              // name text field
              TextField(
                controller: nameController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Name',
                  hintText: 'Enter Name',
                  fillColor: Colors.white,
                  filled: true,
                ),
              ),

              // number text field
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Number',
                  hintText: 'Enter Any Number',
                  fillColor: Colors.white,
                  filled: true,
                ),
              ),

              // password text field
              TextField(
                controller: passwordController,
                // obscureText: true,
                // obscuringCharacter: '*',
                decoration: InputDecoration(
                  // labelText: 'Password',
                  label: Text('Password', style: TextStyle(color: Colors.blue)),

                  // hintText: 'Enter Passsword',
                  hint: Text(
                    'Enter Password',
                    style: TextStyle(color: Colors.grey),
                  ),

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    // borderSide: BorderSide(color: Colors.blue),
                  ),

                  prefixIcon: Icon(Icons.password),
                  suffixIcon: Icon(Icons.remove_red_eye),

                  fillColor: Colors.white,
                  filled: true,
                  // border: UnderlineInputBorder(),
                ),
                onChanged: (value) {
                  // work while the form is having changed
                  print('Form Value $value');
                },
              ),

              ElevatedButton(
                onPressed: () {
                  _updatePassword();
                },
                child: Text('Clicked to change Passsword Field'),
              ),

              ElevatedButton(
                onPressed: () {
                  _clearPassword();
                },
                child: Text('Clear'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _updatePassword() {
    passwordController.text = 'This is Password';
  }

  void _clearPassword() {
    // to clear password
    passwordController.clear();
  }
}
