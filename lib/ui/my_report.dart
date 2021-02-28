import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'incident_detail.dart';

class MyReport extends StatefulWidget {
  MyReport({Key key}) : super(key: key);

  @override
  _MyReportState createState() => _MyReportState();
}

class _MyReportState extends State<MyReport> {
  List<DocumentSnapshot> incidents_list = [];
  String username;
  getCredential()async{
    Future<SharedPreferences> sharedPreferences = SharedPreferences.getInstance();
    await sharedPreferences.then((value) => setState(() {username = value.getString("username");}));
    Firestore.instance.collection('incidents').where("username", isEqualTo: username).getDocuments().then(
            (val)async{
          setState(() {
            incidents_list = val.documents;
          });
        }
    );
  }
  @override
  void initState() {
    // TODO: implement initState .where('restaurant_id', isEqualTo: document.documentID)
    getCredential();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(31, 34, 50, 1),
        appBar: AppBar(title: Text("My reports"), centerTitle: true, elevation: 0, backgroundColor: Colors.transparent,),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal:38.0),
          child: Column(
            children: [
              incidents_list.isNotEmpty?Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Videos are kept for 24 hours", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white70,),),
                ],
              ):Container(),

              SizedBox(height: 30,),
              incidents_list.isNotEmpty?Expanded(
                child: ListView(children: List.generate(incidents_list.length,(index){
                  return Padding(
                    padding: const EdgeInsets.only(bottom:18.0),
                    child: GestureDetector(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => IncidentDetail(incidents_list[index])),
                        );
                      },
                      child: Stack(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 70, height: 90,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color:Colors.deepPurple,
                                ),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top:15.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(6),
                                          image: new DecorationImage(
                                            image: new ExactAssetImage('assets/images/accident_img_thumb.png'),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        height: 35, width: 35,
                                        child: Icon(Icons.play_arrow_outlined, color: Colors.white,),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(incidents_list[index]["category"], style:TextStyle(color: Colors.white, fontSize: 16)),
                                    SizedBox(height: 4,),
                                    Text("${incidents_list[index]["time_stamp_day"]} ${incidents_list[index]["time_stamp_time"]}", style:TextStyle(color: Colors.white38)),
                                  ],
                                ),
                              ),
                              Spacer(),
                              Padding(
                                padding: const EdgeInsets.only(top:20.0),
                                child: Icon(Ionicons.ios_trash, color: Colors.white70,),
                              ),
                            ],),
                          Padding(
                              padding: const EdgeInsets.only(top:55.0, left: 20, right: 20),
                              child: Container(
                                width: MediaQuery.of(context).size.width, height: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: new DecorationImage(
                                    image: new ExactAssetImage('assets/images/map.png'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              )),
                        ],
                      ),
                    ),
                  );
                }),),
              ):Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("You have not created incident reports yet.", style: TextStyle(color: Colors.white, fontSize: 15,),),
                    SizedBox(height: 10,),
                    Text("Your incident reports will be stored here.", style: TextStyle(color: Colors.white38, fontSize: 15),),
                    SizedBox(height: 70,),
                ],),
              ),
            ],
          ),
        ),
    );
  }
}