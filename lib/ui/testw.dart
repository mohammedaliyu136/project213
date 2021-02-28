import 'package:flutter/material.dart';

class Testw extends StatefulWidget {
  Testw({Key key}) : super(key: key);

  @override
  _TestwState createState() => _TestwState();
}

class _TestwState extends State<Testw> {
  bool one = false;
  bool two = false;
  bool three = false;
  void set_incident_level(num){
    //incident_level
    if(num==1){
      setState(() {
        one = true;
        two = false;
        three = false;
      });
    }else if(num==2){
      setState(() {
        one = false;
        two = true;
        three = false;
      });
    }else if(num==3){
      setState(() {
        one = false;
        two = false;
        three = true;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(28.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.center,children: [Text("Please Rate the incident", style: TextStyle(fontSize: 18),)],),
              SizedBox(height: 5,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap:(){
                            set_incident_level(1);
                          },
                          child: Container(
                            height: 50,
                            width: 50,
                            child: one?Image.asset("assets/images/emoji/e3.png"):Image.asset("assets/images/emoji/e3_2.png"),
                          ),
                        ),
                        one?Text("Mild",  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),):Text("Mild"),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap:(){
                            set_incident_level(2);
                          },
                          child: Container(
                            height: 50,
                            width: 50,
                            child: two?Image.asset("assets/images/emoji/e1.png"):Image.asset("assets/images/emoji/e1_2.png"),
                          ),
                        ),
                        two?Text("Severe", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),):Text("Severe")
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap:(){
                            set_incident_level(3);
                          },
                          child: Container(
                            height: 50,
                            width: 50,
                            child: three?Image.asset("assets/images/emoji/e2.png"):Image.asset("assets/images/emoji/e2_2.png"),
                          ),
                        ),
                        three?Text("Must Severe", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),):Text("Must Severe")
                      ],
                    ),
                  ),
                ],),
              RaisedButton(
                child: Text("Buttom sheet"),
                onPressed: (){

                },
              )
            ],),
        ),
      ),
    );
  }
}