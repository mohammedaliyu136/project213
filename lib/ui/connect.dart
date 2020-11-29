import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Connect extends StatefulWidget {
  Connect({Key key}) : super(key: key);

  @override
  _ConnectState createState() => _ConnectState();
}

class _ConnectState extends State<Connect> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final commentController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(31, 34, 50, 1),
        appBar: AppBar(title: Text("Connect"), centerTitle: true, elevation: 0, backgroundColor: Colors.transparent),
        body:Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(children: [
            Text("Have comments, Question? send us a quick message", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white70,),),
            SizedBox(height: 15,),
            Text("Your name", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white70,),),
            SizedBox(height: 5,),
            TextFormField(
              keyboardType: TextInputType.name,
              controller: nameController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Color.fromRGBO(242,242,242,1),
                hintText: 'Enter your name',
                hintStyle: TextStyle(color: Color.fromRGBO(126,131,137,0.53)),
                contentPadding: const EdgeInsets.only(left: 21.0, bottom: 13.0, top: 13.0),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(10),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              //onSaved: (input)=>bloc.email=input,
            ),
            SizedBox(height: 15,),
            Text("Your email", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white70,),),
            SizedBox(height: 5,),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              controller: emailController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Color.fromRGBO(242,242,242,1),
                hintText: 'Enter your email',
                hintStyle: TextStyle(color: Color.fromRGBO(126,131,137,0.53)),
                contentPadding: const EdgeInsets.only(left: 21.0, bottom: 13.0, top: 13.0),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(10),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              //onSaved: (input)=>bloc.email=input,
            ),
            SizedBox(height: 15,),
            Text("Your Comment", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white70,),),
            SizedBox(height: 5,),
            TextFormField(
              keyboardType: TextInputType.text,
              controller: commentController,
              maxLines: 3,
              decoration: InputDecoration(
                filled: true,
                fillColor: Color.fromRGBO(242,242,242,1),
                hintText: 'Enter your comment',
                hintStyle: TextStyle(color: Color.fromRGBO(126,131,137,0.53)),
                contentPadding: const EdgeInsets.only(left: 21.0, bottom: 13.0, top: 13.0),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(10),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              //onSaved: (input)=>bloc.email=input,
            ),
            SizedBox(height: 35,),
            RaisedButton(child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: Text("Send", style: TextStyle(fontSize: 20, color: Colors.white),),
            ),onPressed: (){
              Firestore.instance.collection('connects').document()
                  .setData({
                'name': nameController.text,
                'email': emailController.text,
                'comment': commentController.text,
                  });
            },
            color: Colors.blue,
            )
          ],),
        )
    );
  }
}