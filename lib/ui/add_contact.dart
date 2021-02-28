import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddContact extends StatefulWidget {
  AddContact({Key key}) : super(key: key);

  @override
  _AddContactState createState() => _AddContactState();
}

class _AddContactState extends State<AddContact> {
  bool status = false;
  TextEditingController nameController = TextEditingController();
  TextEditingController phonenumberController = TextEditingController();
  TextEditingController relationshipController = TextEditingController();

  saveContacts(name, phone, relationship)async{
    String contact_fullname = "";
    String contact_phonenumber = "";
    String contact_relationship = "";
    Future<SharedPreferences> sharedPreferences = SharedPreferences.getInstance();
    await sharedPreferences.then((value) => contact_fullname = value.getString("contact_fullname")??"");
    await sharedPreferences.then((value) => contact_phonenumber = value.getString("contact_phonenumber")??"");
    await sharedPreferences.then((value) => contact_relationship = value.getString("contact_relationship")??"");

    await sharedPreferences.then((value) => value.setString("contact_fullname", name));
    await sharedPreferences.then((value) => value.setString("contact_phonenumber", phone));
    await sharedPreferences.then((value) => value.setString("contact_relationship", relationship));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(31, 34, 50, 1),
      appBar: AppBar(title: Text("Contacts"), centerTitle: true, elevation: 0, backgroundColor: Colors.transparent, ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: ListView(children: [
          Text("Full name", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white70,),),
          SizedBox(height: 5,),
          TextFormField(
            controller: nameController,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              filled: true,
              fillColor: Color.fromRGBO(242,242,242,1),
              hintText: 'Enter full name',
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
          Text("Phone number", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white70,),),
          SizedBox(height: 5,),
          TextFormField(
            controller: phonenumberController,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              filled: true,
              fillColor: Color.fromRGBO(242,242,242,1),
              hintText: 'Enter phone number',
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
          Text("Relationship", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white70,),),
          SizedBox(height: 5,),
          TextFormField(
            controller: relationshipController,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              filled: true,
              fillColor: Color.fromRGBO(242,242,242,1),
              hintText: 'Enter relationship',
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
          SizedBox(height: 20,),
          /*
          Row(children: [
            FlutterSwitch(showOnOff: false, activeTextColor: Colors.black, inactiveTextColor: Colors.blue[50], value: status,
              onToggle: (val) {
                setState(() {
                  status = val;
                });
              },
            ),
            SizedBox(width: 10,),
            Text("Add to Emergency contact", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white70,),),

          ],),*/
          SizedBox(height: 35,),
          RaisedButton(child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: Text("Add to Contacts", style: TextStyle(fontSize: 18, color: Colors.white),),
          ),onPressed: ()async{
            await saveContacts(nameController.text, phonenumberController.text, relationshipController.text);
            Navigator.pop(context);

            /*
            Firestore.instance.collection('contacts').document()
                .setData({
              'username': '',
              'name': '',
              'phonenumber': '',
              'rela': '',
                });*/
          },
            color: Colors.blue,
          )
        ],),
      ),
    );
  }
}