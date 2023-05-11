import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loginmusic/page/Login_Page.dart';
import 'package:loginmusic/page/test.dart';

import '../map/maplocatin.dart';
import '../map/searchmap.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Map Flex'),
          
          actions: [
      
          // MaterialButton(
          //   onPressed: (){
          //     // FirebaseAuth.instance.signOut();
          //   },
            
          //   child: Icon(Icons.search),
          // ),
          
          // MaterialButton(
          //   onPressed: (){
          //     // FirebaseAuth.instance.signOut();
          //   },
            
          //   child: Icon(Icons.map),
          // ),

          //thoát 
            MaterialButton(
            onPressed: (){
              FirebaseAuth.instance.signOut();
            },
           
            child: Icon(Icons.logout),
          )
            
      ],
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //check điều hướng 
           ElevatedButton(onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
                // return const checkpage();
               return const MapSample();
              }));
            },
            
        //  child: const Text("Simple Map"),
         child: Icon(Icons.map)),


        //tới tim kiếm 
        ElevatedButton(onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
                return const searchmap();
              }));
            },
            
        //  child: const Text("Simple Map"),
         child: Icon(Icons.search)), 


          // Text('thanh cong '),
          // MaterialButton(
          //   onPressed: (){
          //     FirebaseAuth.instance.signOut();
          //   },
          //   color: Colors.green,
          //   child: Text('sign out '),
          // )
        ],
      )),

    );
  }
}