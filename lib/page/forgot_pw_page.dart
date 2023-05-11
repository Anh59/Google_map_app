import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  
  final _emailController =TextEditingController();
  @override

  void dispose() {
    _emailController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  Future passwordreset() async{
    try{
      await FirebaseAuth.instance.sendPasswordResetEmail(email: _emailController.text.trim());
        showDialog(
        context: context, 
        builder: (context){
        return AlertDialog(
          content: Text('Password reset link ! check email'), 
          
          );
      
      }
      );
    }
    on FirebaseAuthException catch(e){
      print(e);

      showDialog(
        context: context, 
        builder: (context){
        return AlertDialog(
          content: Text(e.message.toString()),
          
          );
      
      }
      );
    }
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[500],
        elevation: 0,
      ),
      body: Column(
        children: [
          Text('Enter your password'),
          Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 25.0),
                   child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white ),
                      borderRadius: BorderRadius.circular(15)
                    ),
                     child: Padding(
                      
                       padding: const EdgeInsets.only(left: 20.0),
                       child: TextField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Email'
                        ),
                       ),
                     ),
                   ),
                 ),

                 MaterialButton(
                  onPressed: passwordreset,
                    child : Text('reset password',style: TextStyle(color: Colors.white),),
                    color: Colors.green,
                  
                 )
        ],
      ),
    );
  }
}