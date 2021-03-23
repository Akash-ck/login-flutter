import 'dart:convert';

import 'package:dev/AuthServicer.dart';
import 'package:dev/homepage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final key = GlobalKey<FormState>();

  TextEditingController namecontroller = new TextEditingController();
  TextEditingController passwordcontroller = new TextEditingController();

  AuthService _service = new AuthService();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
            child: Center(
      child: Container(
        width: 300,
        height: 300,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
            width: 250,
            height: 50,
            child: TextFormField(
              controller: namecontroller,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 15),
              validator: (value) {
                if (value.isEmpty) {
                  return "Username Empty";
                }
                return null;
              },
              decoration: InputDecoration(
                hintText: "Username",
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    borderSide: BorderSide(color: Colors.grey)),
              ),
            ),
          ),
          Divider(),
          SizedBox(
            height: 20,
          ),
          Container(
            width: 250,
            height: 50,
            child: TextFormField(
              controller: passwordcontroller,
              obscureText: true,
              validator: (v) {
                if (v.isEmpty) {
                  return "Password is Empty";
                }
                return null;
              },
              decoration: InputDecoration(
                hintText: "Password",
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    borderSide: BorderSide(color: Colors.grey)),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          GestureDetector(
            onTap: () {

              Navigator.push(context, MaterialPageRoute(builder: (context)=> homepage()));
            },
            child: Container(
              height: 50,
              width: 500,
              color: Colors.lightBlueAccent,

              child: Center(
                child: Text("GUEST  LOG IN",style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                ),),

              ),
            ),

          ),
          SizedBox(
            height: 20,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [


              FlatButton.icon(
                color: Colors.blue,
                onPressed: () async{
                  await _service.googleSignIn();

              },
              icon: Icon(Icons.mediation),
                label:  Text("GOOGLE SIGN IN",style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                ),
                ),
              )

            ],

          ),
        ]),
      ),
    )));
  }
}
