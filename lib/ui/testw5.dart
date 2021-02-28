import 'package:flutter/material.dart';

class Testw5 extends StatefulWidget {
  Testw5({Key key}) : super(key: key);

  @override
  _Testw5State createState() => _Testw5State();
}

class _Testw5State extends State<Testw5> {
  bool show_incident_level=false;
  bool one = false;
  bool two = false;
  bool three = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(children: [

        Expanded(child: Container(color: Colors.deepPurple,)),
        !show_incident_level?Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(bottom:2.0),
            child: GestureDetector(
              onTap: (){
                setState(() {show_incident_level=true;});
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
          ),):Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
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
              Container(child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Continue", style: TextStyle(color: Colors.white, fontSize: 20),),
                  ),
                ],
              ), color: Colors.purple,)
            ],),
        ),
      ],),
    );
  }
}