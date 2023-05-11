import 'package:flutter/material.dart';

class checkpage extends StatefulWidget {
  const checkpage({super.key});

  @override
  State<checkpage> createState() => _checkpageState();
}

class _checkpageState extends State<checkpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
     

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Search/check '),
          MaterialButton(
            onPressed: (){
        
            },
            color: Colors.green,
            child: Text('ok'),
          )
        ],
      )),

    );
  }
}
