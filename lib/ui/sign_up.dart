import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

import 'intro_screens.dart';

class SignUp extends StatefulWidget {
  SignUp({Key key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(31, 34, 50, 1),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: ListView(children: [
            SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Alert", style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.w600),),],
            ),
            SizedBox(height: 10,),
            Row(children: [
              Expanded(child: Padding(
                padding: const EdgeInsets.only(top:8.0,),
                child: Text("In order to use this app, you'll need to allow location, mic and camera services.",
                  style: TextStyle(fontSize: 15, color: Colors.grey[300],),),
              )),
            ],),
            SizedBox(height: 20,),
            TextField(
              style: TextStyle(color: Colors.white,),
              decoration: InputDecoration(
                  //border: InputBorder.none,
                  border: InputBorder.none,
                  fillColor: Colors.white,
                  focusColor: Colors.white,
                  hintStyle: TextStyle(color: Colors.white38),
                  hintText: 'Enter Name'
              ),
            ),
            SizedBox(height: 2, child: Container(color: Colors.white60,),),
            SizedBox(height: 10,),
            TextField(
              style: TextStyle(color: Colors.white,),
              decoration: InputDecoration(
                  //border: InputBorder.none,
                  border: InputBorder.none,
                  fillColor: Colors.white,
                  focusColor: Colors.white,
                  hintStyle: TextStyle(color: Colors.white38),
                  hintText: 'Enter Username'
              ),
            ),
            SizedBox(height: 2, child: Container(color: Colors.white60,),),
            SizedBox(height: 10,),
            TextField(
              style: TextStyle(color: Colors.white,),
              decoration: InputDecoration(
                  //border: InputBorder.none,
                  border: InputBorder.none,
                  fillColor: Colors.white,
                  focusColor: Colors.white,
                  hintStyle: TextStyle(color: Colors.white38),
                  hintText: 'Enter password'
              ),
            ),
            SizedBox(height: 2, child: Container(color: Colors.white60,),),
            SizedBox(height: 30,),
            Row(children: [
              Expanded(
                child: RaisedButton(
                  child: Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Text("Create account and get started"),
                  ),
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => IntroScreens()),
                    );
                  },),
              )
            ],)
          ],),
        )
    );
  }
}