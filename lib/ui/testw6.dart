import 'package:flutter/material.dart';

class Testw6 extends StatefulWidget {
  Testw6({Key key}) : super(key: key);

  @override
  _Testw6State createState() => _Testw6State();
}

class _Testw6State extends State<Testw6> {
  bool show_incident_level=false;
  double container_size = 80;
  bool one = false;
  bool two = false;
  bool three = false;

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
      backgroundColor: Color.fromRGBO(31, 34, 50, 1),
      body: Column(children: [
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
                          height: container_size, width: container_size,
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
                          height: container_size, width: container_size,
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
                          height: container_size, width: container_size,
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
                          height: container_size, width: container_size,
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
                          height: container_size, width: container_size,
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
                          height: container_size, width: container_size,
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
                          height: container_size, width: container_size,
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
                          height: container_size, width: container_size,
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
                          height: container_size, width: container_size,
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
        SizedBox(height: 8,),
        show_incident_level==false?Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(bottom:2.0),
            child: GestureDetector(
              onTap: (){
                setState(() {
                  container_size=60;
                  show_incident_level=true;
                });
                /*
                  if(incident!=null && incident_rating!=null){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CameraPage(incident)),
                    );
                  }else{
                    if(incident_rating!=null){
                      //controller.open();
                    }
                  }*/

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
          ),):Container(
            color: Colors.white,
            child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 5,),
                Row(mainAxisAlignment: MainAxisAlignment.center,children: [Text("Please Rate the incident", style: TextStyle(fontSize: 18),)],),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap:(){
                              //set_incident_level(1);
                              setState(() {
                                one = true;
                                two = false;
                                three = false;
                              });
                            },
                            child: Container(
                              height: 30,
                              width: 30,
                              child: one?Image.asset("assets/images/emoji/e3.png"):Image.asset("assets/images/emoji/e3_2.png"),
                            ),
                          ),
                          one?Text("Mild",  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),):Text("Mild", style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal)),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap:(){
                              //set_incident_level(2);
                              setState(() {
                                one = false;
                                two = true;
                                three = false;
                              });
                            },
                            child: Container(
                              height: 30,
                              width: 30,
                              child: two?Image.asset("assets/images/emoji/e1.png"):Image.asset("assets/images/emoji/e1_2.png"),
                            ),
                          ),
                          two?Text("Severe", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),):Text("Severe", style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal))
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap:(){
                              //set_incident_level(3);
                              setState(() {
                                one = false;
                                two = false;
                                three = true;
                              });
                            },
                            child: Container(
                              height: 30,
                              width: 30,
                              child: three?Image.asset("assets/images/emoji/e2.png"):Image.asset("assets/images/emoji/e2_2.png"),
                            ),
                          ),
                          three?Text("Must Severe", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),):Text("Must Severe", style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal),)
                        ],
                      ),
                    ),
                  ],),
                GestureDetector(
                  onTap: (){},
                  child: Container(child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Continue", style: TextStyle(color: Colors.white, fontSize: 20),),
                      ),
                    ],
                  ), color: Colors.purple,),
                )
              ],),
        ),
          ),
      ],),
    );
  }
}