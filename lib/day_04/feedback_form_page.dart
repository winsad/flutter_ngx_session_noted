import 'package:flutter/material.dart';

class FeedbackFormPage extends StatefulWidget {
  const FeedbackFormPage({super.key});

  @override
  State<FeedbackFormPage> createState() => _FeedbackFormPageState();
}

class _FeedbackFormPageState extends State<FeedbackFormPage> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _descriptionCotroller = TextEditingController();
  final _dateController = TextEditingController();

  final _nameFocus = FocusNode();

  bool _enabled = false;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // _nameFocus.requestFocus();
    });

    // _nameController.addListener()

    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _descriptionCotroller.dispose();
    _dateController.dispose();

    _nameFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Feedback Form'),
        centerTitle: true,
        elevation: 0,
      ),

      // body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: .start,
            children: [
              //
              Text(
                'Please Review Your Feedback!',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: .bold,
                  color: Colors.blue,
                ),
              ),

              SizedBox(height: 20),

              // name
              Text(
                'Name',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 10),
              TextField(
                controller: _nameController,
                focusNode: _nameFocus,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: 'Enter Name',
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                ),
                onChanged: (value) {
                  _checkEnabled();
                },
              ),

              // email
              SizedBox(height: 20),
              Text(
                'Email',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 10),
              TextField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: 'Enter Email',
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                ),

                onChanged: (value) {
                  _checkEnabled();
                },
              ),

              // date form input
              // SizedBox(height: 20),
              // Text(
              //   'Date Form',
              //   style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              // ),
              // SizedBox(height: 10),
              // InputDatePickerFormField(
              //   initialDate: DateTime.now(),
              //   firstDate: DateTime.now(),
              //   lastDate: DateTime.now(),
              // ),

              // date form picker
              // SizedBox(height: 20),
              // Text(
              //   'Date Picker',
              //   style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              // ),
              // SizedBox(height: 10),
              // InkWell(
              //   onTap: _pickDate,
              //   child: TextField(
              //     controller: _dateController,
              //     keyboardType: TextInputType.emailAddress,
              //     enabled: false,
              //     decoration: InputDecoration(
              //       hintText: 'Pick Date',
              //       fillColor: Colors.white,
              //       filled: true,
              //       border: OutlineInputBorder(
              //         borderRadius: BorderRadius.circular(8),
              //         borderSide: BorderSide.none,
              //       ),
              //     ),
              //   ),
              // ),

              // desciption
              SizedBox(height: 20),
              Text(
                'Description',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 10),
              TextField(
                controller: _descriptionCotroller,
                keyboardType: TextInputType.text,
                maxLines: 5,
                decoration: InputDecoration(
                  hintText: 'Enter Description',
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                ),
                onChanged: (value) {
                  _checkEnabled();
                },
              ),

              SizedBox(height: 20),

              InkWell(
                onTap: _enabled
                    ? () {
                        _checkValidateForm();
                      }
                    : null,
                child: Container(
                  height: 45,
                  width: double.infinity,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: _enabled ? Colors.blue : Colors.grey,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    'Validate',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _checkEnabled() {
    final name = _nameController.text.trim();
    final email = _emailController.text.trim();
    final description = _descriptionCotroller.text.trim();

    print('$name $email $description');

    if (name.isEmpty ||
        email.isEmpty ||
        !email.contains('@') ||
        description.isEmpty) {
      _enabled = false;
      setState(() {});

      return;
    }

    _enabled = true;
    setState(() {});
  }

  void _checkValidateForm() {
    final name = _nameController.text.trim();
    final email = _emailController.text.trim();
    final description = _descriptionCotroller.text.trim();

    if (name.isEmpty) {
      _showSnackBar('Name is Required');
      _nameFocus.requestFocus();
      return;
    }

    if (email.isEmpty) {
      _showSnackBar('Email is Required');
      return;
    }

    if (!email.contains('@')) {
      _showSnackBar('Email is invalid');
      return;
    }

    if (description.isEmpty) {
      _showSnackBar('Descption is Required');
      return;
    }
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.redAccent,
        duration: Duration(seconds: 3),
      ),
    );
  }

  // pick the date
  void _pickDate() async {
    final date = await showDatePicker(
      context: context,
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
      initialDate: DateTime.now(),
    );

    if (date != null) {
      _dateController.text = '${date.day} - ${date.month} - ${date.year}';
    }
  }
}

class Sample {
  final int _b = 30;
  int a = 10;
}
