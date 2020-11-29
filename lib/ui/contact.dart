import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_switch/flutter_switch.dart';

import 'add_contact.dart';

class Contact extends StatefulWidget {
  Contact({Key key}) : super(key: key);

  @override
  _ContactState createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  FocusNode myFocusNode;
  bool status = false;
  bool emergency_tab = true;
  bool friend_tab = false;
  @override
  void initState() {
    super.initState();

    myFocusNode = FocusNode();
  }

  @override
  void dispose() {
    // Clean up the focus node when the Form is disposed.
    myFocusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(31, 34, 50, 1),
        appBar: AppBar(title: Text("Contacts"), centerTitle: true, elevation: 0, backgroundColor: Colors.transparent,
          actions: [
            GestureDetector(
                child: Icon(Ionicons.md_person_add, color: Colors.white),
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddContact()),
                  );
                },
            ),
            SizedBox(width: 40,)
          ],),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(children: [
            Padding(
              padding: const EdgeInsets.only(left:18.0),
              child: Text("Your full name", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: Colors.white70,),),
            ),
            Padding(
              padding: const EdgeInsets.only(left:18.0, bottom:10),
              child: Text("Mohammed Aliyu", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: Colors.white,),),
            ),
            SizedBox(height: 1, child:Container(color: Colors.white60,),),
            SizedBox(height: 10,),
            Text("This name will be displayed for your contacts", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300, color: Colors.white70,),),
            SizedBox(height: 30,),
            Row(mainAxisAlignment:MainAxisAlignment.center, children: [
              GestureDetector(
                onTap: (){
                  if(!emergency_tab){
                    setState(() {
                      friend_tab = !friend_tab;
                      emergency_tab = !emergency_tab;
                    });
                  }
                },
                child: Column(
                  children: [
                    Text("Emergency", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: emergency_tab?Colors.white70:Colors.white38,)),
                    SizedBox(height: 7,),
                    Container(height: 7, width: 7, decoration: BoxDecoration(borderRadius: BorderRadius.circular(100), color: emergency_tab?Colors.blue:Colors.transparent),),
                  ],
                ),
              ),SizedBox(width: 20,),
              GestureDetector(
                onTap: (){
                  if(!friend_tab){
                    setState(() {
                      friend_tab = !friend_tab;
                      emergency_tab = !emergency_tab;
                    });
                  }
                },
                child: Column(
                  children: [
                    Text("Friends", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: friend_tab?Colors.white70:Colors.white38,)),
                    SizedBox(height: 7,),
                    Container(height: 7, width: 7, decoration: BoxDecoration(borderRadius: BorderRadius.circular(100), color: friend_tab?Colors.blue:Colors.transparent),),
                  ],
                ),
              ),],),
            SizedBox(height: 30,),
            Text("Your emergency contact will always receive text notification if you created an incident.", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300, color: Colors.white70,),),
            SizedBox(height: 15,),
            friend_tab?ListTile(title: Row(
              children: [
                Text("Mohammed Aliyu", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white70,),),
                Text(" (Friend)", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300, color: Colors.white70,),),
              ],
            ),
              trailing: Icon(Ionicons.ios_trash, color: Colors.white70,),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 5,),
                  Text("080332493840", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300, color: Colors.white70,),),
                  SizedBox(height: 5,),
                  Row(
                    children: [
                      FlutterSwitch(showOnOff: false, activeTextColor: Colors.black, inactiveTextColor: Colors.blue[50], value: status,
                        onToggle: (val) {
                          setState(() {
                            status = val;
                          });
                        },
                      ),
                      SizedBox(width: 10,),
                      Text("Notification", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300, color: Colors.white70,),),
                    ],
                  )
              ],),
            ):Container(),
            friend_tab?SizedBox(height: 15,):Container(),
            ListTile(title: Row(
              children: [
                Text("Musa Ibrahim", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white70,),),
                Text(" (Brother)", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300, color: Colors.white70,),),
              ],
            ),
              trailing: Icon(Ionicons.ios_trash, color: Colors.white70,),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 5,),
                  Text("070332113840", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300, color: Colors.white70,),),
                  SizedBox(height: 5,),
                  Row(
                    children: [
                      FlutterSwitch(showOnOff: false, activeTextColor: Colors.black, inactiveTextColor: Colors.blue[50], value: status,
                        onToggle: (val) {
                          setState(() {
                            status = val;
                          });
                        },
                      ),
                      SizedBox(width: 10,),
                      Text("Notification", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300, color: Colors.white70,),),
                    ],
                  )
                ],),
            ),

          ],),
        ),
    );
  }
}