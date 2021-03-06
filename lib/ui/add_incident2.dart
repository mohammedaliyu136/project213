import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:bottom_drawer/bottom_drawer.dart';

import 'camera_page.dart';
import 'where_to_call.dart';

class AddIncident2 extends StatefulWidget {
  AddIncident2({Key key}) : super(key: key);

  @override
  _AddIncidentState createState() => _AddIncidentState();
}

class _AddIncidentState extends State<AddIncident2> {
  String incident;
  String incident_rating;
  bool accident = false;
  bool criminal = false;
  bool fire_and_smoke = false;
  bool hazadous_material = false;
  bool lost_item = false;
  bool medical = false;
  bool suspicious_activity = false;
  bool vehicle = false;
  bool weather = false;

  BottomDrawerController controller = BottomDrawerController();

  check_box(checked){
    if(checked=="accident"){
      setState(() {
        accident = true;
        criminal = false;
        fire_and_smoke = false;
        hazadous_material = false;
        lost_item = false;
        medical = false;
        suspicious_activity = false;
        vehicle = false;
        weather = false;
        incident="Accident";
      });
    }else if(checked=="criminal"){
      setState(() {
        accident = false;
        criminal = true;
        fire_and_smoke = false;
        hazadous_material = false;
        lost_item = false;
        medical = false;
        suspicious_activity = false;
        vehicle = false;
        weather = false;
        incident="Criminal";
      });
    }else if(checked=="fire_and_smoke"){
      setState(() {
        accident = false;
        criminal = false;
        fire_and_smoke = true;
        hazadous_material = false;
        lost_item = false;
        medical = false;
        suspicious_activity = false;
        vehicle = false;
        weather = false;
        incident="Fire and Smoke";
      });
    }else if(checked=="hazardous_material"){
      setState(() {
        accident = false;
        criminal = false;
        fire_and_smoke = false;
        hazadous_material = true;
        lost_item = false;
        medical = false;
        suspicious_activity = false;
        vehicle = false;
        weather = false;
        incident="Hazardous Material";
      });
    }else if(checked=="lost_item"){
      setState(() {
        accident = false;
        criminal = false;
        fire_and_smoke = false;
        hazadous_material = false;
        lost_item = true;
        medical = false;
        suspicious_activity = false;
        vehicle = false;
        weather = false;
        incident="Lost Item";
      });
    }else if(checked=="medical"){
      setState(() {
        accident = false;
        criminal = false;
        fire_and_smoke = false;
        hazadous_material = false;
        lost_item = false;
        medical = true;
        suspicious_activity = false;
        vehicle = false;
        weather = false;
        incident="Medical";
      });
    }else if(checked=="suspicious_activity"){
      setState(() {
        accident = false;
        criminal = false;
        fire_and_smoke = false;
        hazadous_material = false;
        lost_item = false;
        medical = false;
        suspicious_activity = true;
        vehicle = false;
        weather = false;
        incident="Suspicious Activity";
      });
    }else if(checked=="vehicle"){
      setState(() {
        accident = false;
        criminal = false;
        fire_and_smoke = false;
        hazadous_material = false;
        lost_item = false;
        medical = false;
        suspicious_activity = false;
        vehicle = true;
        weather = false;
        incident="Vehicle";
      });
    }else if(checked=="weather"){
      setState(() {
        accident = false;
        criminal = false;
        fire_and_smoke = false;
        hazadous_material = false;
        lost_item = false;
        medical = false;
        suspicious_activity = false;
        vehicle = false;
        weather = true;
        incident="Weather";
      });
    }
  }
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
                              child: Icon(Ionicons.ios_call, color: Colors.grey, size: 30,),
                            )),
                            onTap: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => WhereToCall()),
                              );
                            },
                          ),
                          SizedBox(height: 10,),
                          GestureDetector(
                            child: Container(height: 50, width: 50, color: Colors.white,child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(Ionicons.ios_home, color: Colors.blue, size: 30,),
                            )),
                            onTap: (){
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
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Alert", style: TextStyle(fontSize: 24, color: Colors.white))
                          ],),
                        Row(children: [
                          Expanded(child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Notify other people in the area about the incident. Select category", style: TextStyle(fontSize: 17, color: Color.fromRGBO(147, 154, 194, 100))),
                          )),
                        ],),
                        SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                          GestureDetector(
                            onTap: (){
                              check_box("accident");
                            },
                            child: Column(
                              children: [
                                Container(
                                  height: 80, width: 80,
                                  decoration: BoxDecoration(
                                    border: Border.all(width: 3.0, color: Colors.blue),
                                    color: accident?Colors.blue:Colors.transparent,
                                    borderRadius: BorderRadius.all(Radius.circular(15)),
                                  ),
                                ),
                                SizedBox(height: 13,),
                                Text("Accident", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),)
                              ],
                            ),
                          ),
                          SizedBox(width: 8,),
                          GestureDetector(
                            onTap: (){
                              check_box("criminal");
                            },
                            child: Column(
                              children: [
                                Container(
                                  height: 80, width: 80,
                                  decoration: BoxDecoration(
                                    border: Border.all(width: 3.0, color: Colors.deepOrange),
                                    color: criminal?Colors.deepOrange:Colors.transparent,
                                    borderRadius: BorderRadius.all(Radius.circular(15)),
                                  ),
                                ),

                                SizedBox(height: 13,),
                                Text("Criminal", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),)
                              ],
                            ),
                          ),
                          SizedBox(width: 8,),
                          GestureDetector(
                            onTap: (){
                              check_box("fire_and_smoke");
                            },
                            child: Column(
                              children: [
                                Container(
                                  height: 80, width: 80,
                                  decoration: BoxDecoration(
                                    border: Border.all(width: 3.0, color: Colors.amberAccent),
                                    color: fire_and_smoke?Colors.amberAccent:Colors.transparent,
                                    borderRadius: BorderRadius.all(Radius.circular(15)),
                                  ),
                                ),
                                SizedBox(height: 5,),
                                Text("Fire or\nSmoke", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),)
                              ],
                            ),
                          ),
                        ],),
                        SizedBox(height: 18,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                          GestureDetector(
                            onTap: (){
                              check_box("hazardous_material");
                            },
                            child: Column(
                              children: [
                                Container(
                                  height: 80, width: 80,
                                  decoration: BoxDecoration(
                                    border: Border.all(width: 3.0, color: Colors.green),
                                    color: hazadous_material?Colors.green:Colors.transparent,
                                    borderRadius: BorderRadius.all(Radius.circular(15)),
                                  ),
                                ),
                                SizedBox(height: 5,),
                                Text("Hazardous\nMaterials", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),)
                              ],
                            ),
                          ),
                          SizedBox(width: 8,),
                          GestureDetector(
                            onTap: (){
                              check_box("lost_item");
                            },
                            child: Column(
                              children: [
                                Container(
                                  height: 80, width: 80,
                                  decoration: BoxDecoration(
                                    border: Border.all(width: 3.0, color: Colors.deepPurple),
                                    color: lost_item?Colors.deepPurple:Colors.transparent,
                                    borderRadius: BorderRadius.all(Radius.circular(15)),
                                  ),
                                ),
                                SizedBox(height: 13,),
                                Text("Lost items", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),)
                              ],
                            ),
                          ),
                          SizedBox(width: 8,),
                          GestureDetector(
                            onTap: (){
                              check_box("medical");
                            },
                            child: Column(
                              children: [
                                Container(
                                  height: 80, width: 80,
                                  decoration: BoxDecoration(
                                    border: Border.all(width: 3.0, color: Colors.cyanAccent),
                                    color: medical?Colors.cyanAccent:Colors.transparent,
                                    borderRadius: BorderRadius.all(Radius.circular(15)),
                                  ),
                                ),
                                SizedBox(height: 13,),
                                Text("Medical", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),)
                              ],
                            ),
                          ),
                        ],),
                        SizedBox(height: 18,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                          GestureDetector(
                            onTap: (){
                              check_box("suspicious_activity");
                            },
                            child: Column(
                              children: [
                                Container(
                                  height: 80, width: 80,
                                  decoration: BoxDecoration(
                                    border: Border.all(width: 3.0, color: Colors.purple),
                                    color: suspicious_activity?Colors.purple:Colors.transparent,
                                    borderRadius: BorderRadius.all(Radius.circular(15)),
                                  ),
                                ),
                                SizedBox(height: 5,),
                                Text("Suspicious\nActivity", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),)
                              ],
                            ),
                          ),
                          SizedBox(width: 8,),
                          GestureDetector(
                            onTap: (){
                              check_box("vehicle");
                            },
                            child: Column(
                              children: [
                                Container(
                                  height: 80, width: 80,
                                  decoration: BoxDecoration(
                                    border: Border.all(width: 3.0, color: Colors.orange),
                                    color: vehicle?Colors.orange:Colors.transparent,
                                    borderRadius: BorderRadius.all(Radius.circular(15)),
                                  ),
                                ),
                                SizedBox(height: 13,),
                                Text("Vehicle", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),)
                              ],
                            ),
                          ),
                          SizedBox(width: 8,),
                          GestureDetector(
                            onTap: (){
                              check_box("weather");
                            },
                            child: Column(
                              children: [
                                Container(
                                  height: 80, width: 80,
                                  decoration: BoxDecoration(
                                    border: Border.all(width: 3.0, color: Colors.pinkAccent),
                                    color: weather?Colors.pinkAccent:Colors.transparent,
                                    borderRadius: BorderRadius.all(Radius.circular(15)),
                                  ),
                                ),
                                SizedBox(height: 13,),
                                Text("Weather", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),)
                              ],
                            ),
                          ),
                        ],),
                        /*
                        Row(
                          children: [
                            ListView(
                              scrollDirection: Axis.horizontal,
                              children: [Text("Last 2 hours"),Text("Last 2 hours"),Text("Last 2 hours"),Text("Last 2 hours"),],),
                          ],
                        ),*/
                        //_buildBottomDrawer(context),
                      ],
                    ),),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom:2.0),
                      child: GestureDetector(
                        onTap: (){
                          if(incident!=null && incident_rating!=null){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => CameraPage(incident, "")),
                            );
                          }else{
                            if(incident_rating!=null){
                              //controller.open();
                            }
                          }

                        },
                        child: Container(height: 70, width: MediaQuery. of(context).size.width, child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("Alert", style: TextStyle(color: Colors.white, fontSize: 20),),
                              ),
                            ],
                          ), color: Colors.purple,),
                        )),
                      ),
                    ),)
                ],
              ))
            ],
          ),
        ],
      ),
    );
  }
}