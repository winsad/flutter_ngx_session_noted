// ignore_for_file: use_build_context_synchronously

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobile_application/app/app_colors.dart';
import 'package:flutter_mobile_application/app/app_routes.dart';
import 'package:flutter_mobile_application/providers/account_provider.dart';
import 'package:flutter_mobile_application/providers/auth_provider.dart';
import 'package:flutter_mobile_application/widgets/common_loading_widget.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool visiblePassword = true;
  bool visibleConfirmPassword = true;

  @override
  void dispose() {
    _nameController.dispose();
    _confirmPasswordController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  String? _onValidateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your name';
    }
    return null;
  }

  String? _onValidateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }

    if (!value.contains('@')) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String? _onValidatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  String? _onValidateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    if (value != _passwordController.text) {
      return 'Password Not Match';
    }
    return null;
  }

  void _toggleVisiblePassword() {
    visiblePassword = !visiblePassword;
    setState(() {});
  }

  void _toggleVisibleConfirmPassword() {
    visibleConfirmPassword = !visibleConfirmPassword;
    setState(() {});
  }

  void _onClickedLogin() {
    Navigator.pop(context);
  }

  void _onClickedSignUp() async {
    final validate = _formKey.currentState?.validate() ?? false;
    if (!validate) return;

    await context.read<AuthProvider>().onClickedSignUp(
      _nameController.text,
      _emailController.text,
      _passwordController.text,
    );

    // if the login is sucess => dashboard
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('Sign Up Successfully')));

    context.read<AccountProvider>().refreshUserInfo();

    Navigator.pushReplacementNamed(context, AppRoutes.dashboard);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Consumer<AuthProvider>(
        builder: (context, authProvider, _) {
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: .start,
                    crossAxisAlignment: .start,
                    spacing: 10,
                    children: [
                      SizedBox(
                        height: 70,
                        width: 70,
                        child: ClipOval(
                          child: Image.asset('assets/images/app_icon.jpg'),
                        ),
                      ),
                      Text(
                        'Create Account',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: .bold,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      Text(
                        'Create an account to join our Ngx Community.',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: .w600,
                          color: AppColors.textSecondary,
                        ),
                      ),

                      SizedBox(height: 10),

                      if (authProvider.errorMessage != null)
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 5,
                          ),
                          margin: EdgeInsets.only(bottom: 10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(color: Colors.red),
                          ),
                          child: Text(
                            authProvider.errorMessage ?? '',
                            style: TextStyle(color: Colors.red),
                          ),
                        ),

                      _buildFormHeader(CupertinoIcons.person, 'Your Name'),
                      TextFormField(
                        controller: _nameController,
                        cursorColor: Colors.blue,
                        cursorHeight: 16,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 14,
                            vertical: 10,
                          ),
                          hintText: 'Enter Name',
                          hintStyle: TextStyle(
                            color: Colors.grey.shade400,
                            fontSize: 14,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Colors.grey.shade400,
                              width: 1,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Colors.grey.shade400,
                              width: 1,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Colors.blue,
                              width: 2,
                            ),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                        validator: (value) => _onValidateName(value),
                      ),

                      _buildFormHeader(CupertinoIcons.mail, 'Your Email'),
                      TextFormField(
                        controller: _emailController,
                        cursorColor: Colors.blue,
                        cursorHeight: 16,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 14,
                            vertical: 10,
                          ),
                          hintText: 'Enter Email',
                          hintStyle: TextStyle(
                            color: Colors.grey.shade400,
                            fontSize: 14,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Colors.grey.shade400,
                              width: 1,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Colors.grey.shade400,
                              width: 1,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Colors.blue,
                              width: 2,
                            ),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                        validator: (value) => _onValidateEmail(value),
                      ),

                      SizedBox(height: 5),
                      _buildFormHeader(CupertinoIcons.lock, 'Your Password'),
                      TextFormField(
                        controller: _passwordController,
                        cursorColor: Colors.blue,
                        cursorHeight: 16,
                        obscureText: visiblePassword,
                        obscuringCharacter: '*',
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 14,
                            vertical: 10,
                          ),
                          hintText: 'Enter Password',
                          hintStyle: TextStyle(
                            color: Colors.grey.shade400,
                            fontSize: 14,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Colors.grey.shade400,
                              width: 1,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Colors.grey.shade400,
                              width: 1,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Colors.blue,
                              width: 2,
                            ),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          suffixIcon: GestureDetector(
                            onTap: _toggleVisiblePassword,
                            child: Icon(
                              visiblePassword
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                          ),
                        ),

                        validator: (value) => _onValidatePassword(value),
                      ),

                      SizedBox(height: 5),
                      _buildFormHeader(CupertinoIcons.lock, 'Confirm Password'),
                      TextFormField(
                        controller: _confirmPasswordController,
                        cursorColor: Colors.blue,
                        cursorHeight: 16,
                        obscureText: visibleConfirmPassword,
                        obscuringCharacter: '*',
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 14,
                            vertical: 10,
                          ),
                          hintText: 'Enter Password',
                          hintStyle: TextStyle(
                            color: Colors.grey.shade400,
                            fontSize: 14,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Colors.grey.shade400,
                              width: 1,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Colors.grey.shade400,
                              width: 1,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Colors.blue,
                              width: 2,
                            ),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          suffixIcon: GestureDetector(
                            onTap: _toggleVisibleConfirmPassword,
                            child: Icon(
                              visibleConfirmPassword
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                          ),
                        ),

                        validator: (value) => _onValidateConfirmPassword(value),
                      ),

                      SizedBox(height: 10),

                      // button login
                      GestureDetector(
                        onTap: _onClickedSignUp,
                        child: Container(
                          height: 45,

                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.blue,
                          ),
                          alignment: .center,
                          child: authProvider.isLoading == true
                              ? CommonLoadingWidget()
                              : Text(
                                  'Sign Up',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: .w600,
                                    fontSize: 16,
                                  ),
                                ),
                        ),
                      ),

                      // go signup
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Already have an account? ',
                            style: TextStyle(color: AppColors.textSecondary),
                          ),
                          GestureDetector(
                            onTap: _onClickedLogin,
                            child: Text(
                              'login',
                              style: TextStyle(
                                color: Colors.blue,
                                fontWeight: .w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildFormHeader(IconData icon, String title) {
    return Row(
      children: [
        Icon(icon, color: Colors.grey, size: 18),
        const SizedBox(width: 8),
        Text(
          title,
          textAlign: TextAlign.start,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.normal,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
