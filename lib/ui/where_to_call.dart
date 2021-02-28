import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class WhereToCall extends StatefulWidget {
  WhereToCall({Key key}) : super(key: key);

  @override
  _WhereToCallState createState() => _WhereToCallState();
}

class _WhereToCallState extends State<WhereToCall> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Row(
            children: [
              Container(
                color:Colors.white,
                child: Column(
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: 100,),
                          GestureDetector(
                            child: Container(height: 50, width: 50, color: Colors.white70,child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              //child: Image.asset("assets/images/i_contact.png", width: 20,),
                              child: Icon(Ionicons.ios_call, color: Colors.blue, size: 30,),
                            )),
                            onTap: (){
                            },
                          ),
                          SizedBox(height: 10,),
                          GestureDetector(
                            child: Container(height: 50, width: 50, color: Colors.white,child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(Ionicons.ios_home, color: Colors.grey, size: 30,),
                            )),
                            onTap: (){
                              Navigator.pop(context);
                              Navigator.pop(context);
                            },
                          ),
                        ],),
                    ),
                    GestureDetector(
                      child: Container(height: 50, width: 50, color: Colors.white,child: Padding(
                        padding: const EdgeInsets.only(left:0.0, bottom:18),
                        child: Icon(Ionicons.ios_close, color: Colors.grey, size: 50,),
                      )),
                      onTap: (){
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ),
              Expanded(child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(31, 34, 50, 1)
                    ),
                    height: MediaQuery.of(context).size.height,
                    //child: MapSample(),
                  ),
                  SafeArea(
                    child: Container(color:Color.fromRGBO(31, 34, 50, 1), width: MediaQuery.of(context).size.width, child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Choose where to call", style: TextStyle(fontSize: 20, color: Colors.white))
                          ],),
                        Row(children: [
                          Expanded(child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Notify other people in the area about the incident. Select category", style: TextStyle(fontSize: 16, color: Color.fromRGBO(147, 154, 194, 100))),
                          )),
                        ],),
                        SizedBox(height: 15,),
                        Padding(
                          padding: const EdgeInsets.only(bottom:2.0),
                          child: Container(height: 70, width: MediaQuery. of(context).size.width, child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text("911", style: TextStyle(color: Colors.white, fontSize: 18),),
                                ),
                              ],
                            ), color: Colors.purple,),
                          )),
                        ),
                        //SizedBox(height: 5,),
                        Padding(
                          padding: const EdgeInsets.only(bottom:2.0),
                          child: Container(height: 50, width: MediaQuery. of(context).size.width, child: Padding(
                            padding: const EdgeInsets.only(left:10.0, right:10.0),
                            child: Container(child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text("Campus Security", style: TextStyle(color: Colors.white, fontSize: 18),),
                                ),
                              ],
                            ), color: Colors.purple,),
                          )),
                        ),
                      ],
                    ),),
                  ),
                ],
              ))
            ],
          ),
        ],
      ),
    );
  }
}