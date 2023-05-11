import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:loginmusic/page/forgot_pw_page.dart';

class LoginPage extends StatefulWidget {
  
  final VoidCallback showRegisterPage;//phương thức phát hiện củ chỉ 
  const LoginPage({Key? key,required this.showRegisterPage}) :super(key: key);
  
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {


  // text controller (cấp bộ điều khiển )
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future singIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: _emailController.text.trim(), 
      password: _passwordController.text.trim());
  }

//quản lý bộ nhớ khi ko sử dụng
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column( 
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Image.asset("lib/images/white.jpg"),
                Icon(Icons.map,
                // static const IconData map = IconData(0xe3c8, fontFamily: 'MaterialIcons');
                size: 50,),
          
          
                Text("MAP FLEX",style:TextStyle(fontSize: 30,fontWeight: FontWeight.bold ),),
                 SizedBox(height: 10,),
                 Text("We Come To The Map Flex ",style:TextStyle(fontSize: 15 ,fontWeight: FontWeight.bold),),
                 SizedBox(height: 40,),
          //email
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
          
                SizedBox(height: 20,),
          
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

                        controller: _passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          
                          hintText: 'Password'
                        ),
                       ),
                     ),
                   ),
                 ),
          
                SizedBox(height: 10,),
                //reset password
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [

                      GestureDetector(
                        onTap: (){
                          Navigator.push(context ,
                          MaterialPageRoute(builder: (context){
                            return ForgotPasswordPage();
                          }));
                        },

                        child: Text('Forgot Password ?',style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),)),
                    ],
                  ),
                ),
                SizedBox(height: 10),
          
                 Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 25.0),
                   child: GestureDetector(

                    onTap: singIn,
                     child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(color: Colors.green,
                      borderRadius: BorderRadius.circular(12)
                      ),
                             
                      child: Center(child: Text('Sign In'
                      ,style: TextStyle(color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      ),
                      )),
                     ),
                   ),
                 ),
          
                 SizedBox(height: 10),
          
                 Row( 
                  mainAxisAlignment: MainAxisAlignment.center,
                   children: [
          
                     Text('Not a member ?',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),


                     GestureDetector(
                      onTap: widget.showRegisterPage,
                      child: Text('Register now',style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),)),
                   ],
                 )
              ],
            ),
          ),
        ),
      ),
    );
  }
}