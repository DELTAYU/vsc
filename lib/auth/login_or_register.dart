import 'package:flutter/material.dart';
import 'package:vsc/pages/login_page.dart';
import 'package:vsc/pages/register_page.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});
  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
  bool showLoginPge = true;

  void togglePages() {
    setState(() {
      showLoginPge = !showLoginPge;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPge) {
      return LoginPage(onTap: togglePages);
    } else {
      return RegisterPage(onTap: togglePages);
    }
  }
}
