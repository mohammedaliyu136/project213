import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

import 'sign_up.dart';

class PermissionPage extends StatefulWidget {
  PermissionPage({Key key}) : super(key: key);

  @override
  _PermissionPageState createState() => _PermissionPageState();
}

class _PermissionPageState extends State<PermissionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(31, 34, 50, 1),
        body: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Column(children: [
              SizedBox(height: 40,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Alert", style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.w600),),],
              ),
              SizedBox(height: 10,),
              Row(children: [
                Expanded(child: Padding(
                  padding: const EdgeInsets.only(top:8.0, left: 16),
                  child: Text("In order to use this app, you'll need to allow location, mic and camera services.",
                    style: TextStyle(fontSize: 15, color: Colors.grey[300],),),
                )),
              ],),
            SizedBox(height: 20,),
            ListTile(
              leading: Icon(Ionicons.ios_send, color: Colors.white),
              title: Text("The app uses your location to determine broadcast area for the incident", style: TextStyle(fontSize: 15, color: Colors.grey[300],)),),
            SizedBox(height: 10,),
            ListTile(
              leading: Icon(Ionicons.ios_camera, color: Colors.white),
              title: Text("The app uses picture to send the content to police", style: TextStyle(fontSize: 15, color: Colors.grey[300],)),),
            SizedBox(height: 40,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [RaisedButton(child: Text("Next"),onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignUp()),
                );
              },)],)
          ],),
        )
    );
  }
}