import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'add_contact.dart';

class Contact extends StatefulWidget {
  Contact({Key key}) : super(key: key);

  @override
  _ContactState createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  TextEditingController nameController = TextEditingController();
  FocusNode myFocusNode;
  bool status = false;
  bool emergency_tab = true;
  bool friend_tab = false;
  String name="";
  String contact_fullname = "";
  String contact_phonenumber = "";
  String contact_relationship = "";
  getCredential()async{
    Future<SharedPreferences> sharedPreferences = SharedPreferences.getInstance();
    await sharedPreferences.then((value) => setState(() {
      name = value.getString("name");
      print(name);
      nameController = new TextEditingController(text: name);
    }));
    await sharedPreferences.then((value) => setState(() {contact_fullname = value.getString("contact_fullname")??"";}));
    await sharedPreferences.then((value) => setState(() {contact_phonenumber = value.getString("contact_phonenumber")??"";}));
    await sharedPreferences.then((value) => setState(() {contact_relationship = value.getString("contact_relationship")??"";}));
  }
  deleteContact()async{
    Future<SharedPreferences> sharedPreferences = SharedPreferences.getInstance();
    await sharedPreferences.then((value) => value.setString("contact_fullname", ""));
    await sharedPreferences.then((value) => value.setString("contact_phonenumber", ""));
    await sharedPreferences.then((value) => value.setString("contact_relationship", ""));
    setState(() {
      contact_fullname = "";
      contact_phonenumber = "";
      contact_relationship = "";
    });
  }
  @override
  void initState() {
    super.initState();
    getCredential();
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
                  ).then((value) => getCredential());
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
              child: TextField(
                controller: nameController,
                style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w500,),
                decoration: InputDecoration(
                  //border: InputBorder.none,
                    border: InputBorder.none,
                    fillColor: Colors.white,
                    focusColor: Colors.white,
                    hintStyle: TextStyle(color: Colors.white38, fontSize: 20,fontWeight: FontWeight.w300,),
                    hintText: 'Enter your name...'
                ),
              ),
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
                    Text("Emergency Contacts", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: emergency_tab?Colors.white70:Colors.white38,)),
                    SizedBox(height: 7,),
                    Container(height: 5, width: 100, decoration: BoxDecoration(borderRadius: BorderRadius.circular(100), color: emergency_tab?Colors.blue:Colors.transparent),),
                  ],
                ),
              ),SizedBox(width: 10,),],),
            SizedBox(height: 20,),
            Text("Your emergency contact will always receive text notification if you created an incident.", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300, color: Colors.white70,),),
            SizedBox(height: 15,),
            contact_fullname.isNotEmpty?ListTile(title: Row(
              children: [
                Text(contact_fullname, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white70,),),
                Text(" (${contact_relationship})", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300, color: Colors.white70,),),
              ],
            ),
              trailing: GestureDetector(child: Container(height:50,width:50,child: Icon(Ionicons.ios_trash, color: Colors.white70,)), onTap: (){deleteContact();},),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 5,),
                  Text(contact_phonenumber, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300, color: Colors.white70,),),
                  SizedBox(height: 5,),
                  /*
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
                  )*/
                ],),
            ):Container(),

          ],),
        ),
    );
  }
}