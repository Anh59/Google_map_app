import 'package:flutter/material.dart';
import 'package:loginmusic/page/Login_Page.dart';
import 'package:loginmusic/page/register_page.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override

  bool showLoginPage= true;

  void toggleScreen() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  Widget build(BuildContext context) {
    if(showLoginPage){
      return LoginPage(showRegisterPage: toggleScreen);
    }else{
      return RegisterPage(showLoginPage: toggleScreen,);
    }
  }
}