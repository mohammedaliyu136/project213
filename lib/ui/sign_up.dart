import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'incident_map.dart';
import 'intro_screens.dart';

class SignUp extends StatefulWidget {
  SignUp({Key key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final nameController = TextEditingController();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  bool isLoading = false;
  setCredential(name, username, password){
    Future<SharedPreferences> sharedPreferences = SharedPreferences.getInstance();
    sharedPreferences.then((value) => value.setString("name", name));
    sharedPreferences.then((value) => value.setString("username", username));
    sharedPreferences.then((value) => value.setString("password", password));
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
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
                  controller: nameController,
                  enabled: isLoading?false:true,
                  style: TextStyle(color: Colors.white,),
                  decoration: InputDecoration(
                      //border: InputBorder.none,
                      border: InputBorder.none,
                      fillColor: Colors.white,
                      focusColor: Colors.white,
                      hintStyle: TextStyle(color: Colors.white38),
                      hintText: 'Enter Your Name'
                  ),
                ),
                SizedBox(height: 2, child: Container(color: Colors.white60,),),
                SizedBox(height: 10,),
                TextField(
                  controller: usernameController,
                  enabled: isLoading?false:true,
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
                  controller: passwordController,
                  enabled: isLoading?false:true,
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
                        child: Text(isLoading?"Creating your account please wait":"Create account and get started"),
                      ),
                      onPressed: (){
                        if(!isLoading){
                          setState(() {
                            isLoading=true;
                          });
                          Firestore.instance.collection('users').document()
                              .setData({
                            'name': nameController.text,
                            'username': usernameController.text,
                            'password': passwordController.text,
                          }).then((value)async{
                            await setCredential(nameController.text, usernameController.text, passwordController.text);
                            setState(() {
                              isLoading=false;
                            });
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => IncidentMap()),
                            );
                          }).catchError((onError)=>null);
                        }else{

                        }
                        /*
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => IncidentMap()),
                        );*/
                      },),
                  )
                ],)
              ],),
            )
        ),
      ],
    );
  }
}