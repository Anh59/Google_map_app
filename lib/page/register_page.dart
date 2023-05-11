import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  

  final VoidCallback showLoginPage;
const RegisterPage({Key? key,required this.showLoginPage}) :super(key: key);
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _comfirmpasswordController = TextEditingController();

  void dispose(){
     _emailController.dispose();
    _passwordController.dispose();
    _comfirmpasswordController.dispose();
    super.dispose();
  }

Future signUp() async{
  if(passwordcomfirmed()){}
  await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: _emailController.text.trim(), 
    password: _passwordController.text.trim(),);
}


//check password
bool passwordcomfirmed(){

  if(_passwordController.text.trim() == _comfirmpasswordController.text.trim()){
    
    return true;

  }else{
    return false;


  }
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
                Icon(Icons.map,
                size: 50,),
          
          
                Text("MAP FLEX",style:TextStyle(fontSize: 30,fontWeight: FontWeight.bold ),),
                 SizedBox(height: 10,),
                 Text("We Come To The Map Flex ",style:TextStyle(fontSize: 15 ,fontWeight: FontWeight.bold),),
                 SizedBox(height: 40,),
          
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

                SizedBox(height: 20,),
          ///comfirmpassword
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

                        controller: _comfirmpasswordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          
                          hintText: 'Comfirm Password'
                        ),
                       ),
                     ),
                   ),
                 ),
          
                SizedBox(height: 10),
          
                 Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 25.0),
                   child: GestureDetector(

                    onTap: signUp,
                     child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(color: Colors.green,
                      borderRadius: BorderRadius.circular(12)
                      ),
                             
                      child: Center(child: Text('Sign up'
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
          
                     Text('I am  a member ?',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                     GestureDetector(
                      onTap: widget.showLoginPage,
                      child: Text('Login now',style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),)),
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