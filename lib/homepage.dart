import 'package:flutter/material.dart';

class homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WELCOME TO HOMESCREEN"),
      ),
      body: Container(
        height: 500,
        width: 500,
        decoration: BoxDecoration(
          image: DecorationImage(
            image:
            AssetImage('assets/jp.jpg'),
          ),),
      ),

      backgroundColor: Colors.grey,
    );
  }
}
