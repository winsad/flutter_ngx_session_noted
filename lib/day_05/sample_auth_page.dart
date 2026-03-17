import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum WidgetType { login, signup }

class SampleAuthPage extends StatefulWidget {
  const SampleAuthPage({super.key});

  @override
  State<SampleAuthPage> createState() => _SampleAuthPageState();
}

class _SampleAuthPageState extends State<SampleAuthPage> {
  final _formKey = GlobalKey<FormState>();
  WidgetType activeWidget = WidgetType.login;

  // login controller
  final _userController = TextEditingController();
  final _passwordController = TextEditingController();

  // sign up controller
  final _signupNameController = TextEditingController();
  final _signupEmailController = TextEditingController();
  final _signupPasswordController = TextEditingController();

  // obsecure conditions
  bool _obsecureLoginPassword = true;
  bool _obsecureSignupPassword = true;

  // default style
  final _formBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide(color: Colors.grey.shade400),
  );
  final _focusBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide(color: Colors.blue),
  );
  final _hintTextStyle = TextStyle(color: Colors.grey, fontSize: 14);
  final _defaultContentSetting = EdgeInsets.symmetric(
    horizontal: 14,
    vertical: 10,
  );

  @override
  void dispose() {
    _userController.dispose();
    _passwordController.dispose();

    _signupNameController.dispose();
    _signupEmailController.dispose();
    _signupPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        // no header
        appBar: AppBar(backgroundColor: Colors.white),

        // body
        body: SafeArea(
          bottom: true,
          top: true,
          child: Container(
            padding: .all(20),
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Builder(
                  builder: (_) {
                    if (activeWidget == WidgetType.login) {
                      return _buildLoginForm();
                    } else {
                      return _buildSignUpFrom();
                    }
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSignUpFrom() {
    return Column(
      mainAxisAlignment: .start,
      crossAxisAlignment: .start,
      children: [
        // header
        _buildHeader('Create Acccount'),

        // form name
        SizedBox(height: 30),
        _buildFormHeader(icon: CupertinoIcons.person, title: 'Your Name'),
        SizedBox(height: 10),
        _buildSignUpNameForm(),

        // form email
        SizedBox(height: 30),
        _buildFormHeader(icon: CupertinoIcons.mail, title: 'Your Email'),
        SizedBox(height: 10),
        _buildSignUpEmailForm(),

        // form password
        SizedBox(height: 30),
        _buildFormHeader(icon: CupertinoIcons.lock, title: 'New Password'),
        SizedBox(height: 10),
        _buildSignUpPasswordForm(),

        // action button
        SizedBox(height: 50),
        _buildActionButton(
          title: 'Create Account',
          onTap: () {
            // validate signup
            _formKey.currentState?.validate();
          },
        ),
        SizedBox(height: 50),

        Row(
          spacing: 8,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Already have an account ?',
              style: TextStyle(color: Colors.black),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  activeWidget = WidgetType.login;
                });
              },
              child: Text(
                'Login',
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSignUpNameForm() {
    return TextFormField(
      controller: _signupNameController,
      keyboardType: .text,
      decoration: InputDecoration(
        hintText: 'Your Name',
        fillColor: Colors.white,
        filled: true,
        // errorText: 'test',
        contentPadding: _defaultContentSetting,
        hintStyle: _hintTextStyle,
        border: _formBorder,
        enabledBorder: _formBorder,
        focusedBorder: _focusBorder,
      ),
      onChanged: (value) {
        log('Nmae Changed $value');
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Invalid Name';
        }
        return null;
      },
    );
  }

  Widget _buildSignUpEmailForm() {
    return TextFormField(
      controller: _signupEmailController,
      keyboardType: .text,
      decoration: InputDecoration(
        hintText: 'Your Email',
        fillColor: Colors.white,
        filled: true,
        // errorText: 'test',
        contentPadding: _defaultContentSetting,
        hintStyle: _hintTextStyle,
        border: _formBorder,
        enabledBorder: _formBorder,
        focusedBorder: _focusBorder,
      ),
      onChanged: (value) {
        log('Email Changed $value');
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Invalid Email';
        }

        if (!value.contains('@')) {
          return 'Required @';
        }
        return null;
      },
    );
  }

  Widget _buildSignUpPasswordForm() {
    return TextFormField(
      controller: _signupPasswordController,
      keyboardType: .text,
      obscureText: _obsecureSignupPassword,
      obscuringCharacter: '•',
      decoration: InputDecoration(
        hintText: 'Create Password',
        fillColor: Colors.white,
        filled: true,
        contentPadding: _defaultContentSetting,
        hintStyle: _hintTextStyle,
        border: _formBorder,
        enabledBorder: _formBorder,
        focusedBorder: _focusBorder,
        suffixIcon: GestureDetector(
          onTap: () {
            setState(() {
              _obsecureSignupPassword = !_obsecureSignupPassword;
            });
          },
          child: Icon(
            _obsecureSignupPassword
                ? CupertinoIcons.eye_slash
                : CupertinoIcons.eye,
            color: _obsecureSignupPassword ? Colors.black : Colors.grey,
          ),
        ),
      ),
      onChanged: (value) {
        //
        log('Password Changed $value');
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'invalid password';
        }

        if (value.length < 6) {
          return 'at least 6 length';
        }
        return null;
      },
    );
  }

  Widget _buildLoginForm() {
    return Column(
      mainAxisAlignment: .start,
      crossAxisAlignment: .start,
      children: [
        // header
        _buildHeader('Welcome Back'),

        // form email
        SizedBox(height: 30),
        _buildFormHeader(
          icon: CupertinoIcons.mail,
          title: 'Your Email/ Your Name',
        ),
        SizedBox(height: 10),

        _buildNameForm(),

        // form password
        SizedBox(height: 20),
        _buildFormHeader(icon: CupertinoIcons.lock, title: 'Your Password'),
        SizedBox(height: 10),

        _buildPasswordForm(),

        SizedBox(height: 50),

        _buildActionButton(
          title: 'Login',
          onTap: () async {
            final formValid = _formKey.currentState?.validate() ?? false;

            if (formValid) {
              FocusScope.of(context).unfocus();

              // show success dialog
              await showDialog(
                context: context,
                barrierDismissible: true,
                builder: (context) {
                  // return Scaffold(body: Container(child: Text('Hello World')));
                  return AlertDialog(
                    title: Text('Successful'),
                    content: Text('Your account have been login successfully.'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('Close'),
                      ),
                    ],
                  );
                },
              );
            }
          },
        ),
        SizedBox(height: 50),

        Row(
          spacing: 8,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Are you a new user ?', style: TextStyle(color: Colors.black)),
            GestureDetector(
              onTap: () {
                setState(() {
                  activeWidget = WidgetType.signup;
                });
              },
              child: Text(
                'sign up',
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildActionButton({
    required String title,
    required void Function() onTap,
  }) {
    return GestureDetector(
      // onTap: () {
      //   // validate the form
      //   _formKey.currentState?.validate();
      // },
      onTap: onTap,
      child: Container(
        height: 45,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(10),
        ),
        alignment: .center,
        child: Text(
          title,
          textAlign: .center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            letterSpacing: 1,
            fontWeight: .bold,
          ),
        ),
      ),
    );
  }

  Widget _buildPasswordForm() {
    return TextFormField(
      controller: _passwordController,
      keyboardType: .text,
      obscureText: _obsecureLoginPassword,
      obscuringCharacter: '•',
      decoration: InputDecoration(
        hintText: 'Enter Password',
        fillColor: Colors.white,
        filled: true,
        contentPadding: _defaultContentSetting,
        hintStyle: _hintTextStyle,
        border: _formBorder,
        enabledBorder: _formBorder,
        focusedBorder: _focusBorder,
        suffixIcon: GestureDetector(
          onTap: () {
            setState(() {
              _obsecureLoginPassword = !_obsecureLoginPassword;
            });
          },
          child: Icon(
            _obsecureLoginPassword
                ? CupertinoIcons.eye_slash
                : CupertinoIcons.eye,
            color: _obsecureLoginPassword ? Colors.black : Colors.grey,
          ),
        ),
      ),
      onChanged: (value) {
        //
        log('Password Changed $value');
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'invalid value';
        }
        return null;
      },
    );
  }

  Widget _buildNameForm() {
    return TextFormField(
      controller: _userController,
      keyboardType: .text,
      decoration: InputDecoration(
        hintText: 'Enter Email',
        fillColor: Colors.white,
        filled: true,
        // errorText: 'test',
        contentPadding: _defaultContentSetting,
        hintStyle: _hintTextStyle,
        border: _formBorder,
        enabledBorder: _formBorder,
        focusedBorder: _focusBorder,
      ),
      onChanged: (value) {
        log('Email Changed $value');
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'invalid value';
        }
        return null;
      },
    );
  }

  Widget _buildFormHeader({required IconData icon, required String title}) {
    return Row(
      spacing: 10,
      children: [
        Icon(icon, color: Colors.grey, size: 18),
        Text(
          title,
          style: TextStyle(fontSize: 12, fontWeight: .w400, color: Colors.grey),
        ),
      ],
    );
  }

  Widget _buildHeader(String title) {
    return Text(
      title,
      textAlign: .center,
      style: TextStyle(fontSize: 24, fontWeight: .bold, color: Colors.black),
    );
  }
}

class LoginWidget extends StatelessWidget {
  const LoginWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Text('Login');
  }
}
