import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loginmusic/auth/auth_page.dart';
import 'package:loginmusic/page/Login_Page.dart';
import '../page/Home_page.dart';


class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainpageState();
}

class _MainpageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder:(context, snapshot){
          if(snapshot.hasData){
            return HomePage();
          }else{
            // child: Text('sai');
            return AuthPage();

          }

        },
      ),

    );
  }
}