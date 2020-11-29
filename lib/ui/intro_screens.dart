import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IntroScreens extends StatefulWidget {
  IntroScreens({Key key}) : super(key: key);

  @override
  _IntroScreensState createState() => _IntroScreensState();
}

class _IntroScreensState extends State<IntroScreens> {
  List<String> heading = [
    "INCIDENT CREATED FOR YOUR SAFETY",
    "ARE YOU A WITNESS TO INCIDENT?",
    "EASY OF USE AND IMPORTANT FOR SAFETY",
    "BE AWARE OF WHAT HAPPENED IN YOUR CITY"
  ];
  List<String> texts = [
    "And also to protect your loved ones with alerts and transfer of valuable information to the police and emergency services.",
    "Record an incident video using the app and call emergency services.",
    "You can upload up to ten images. This is done for easy of use by the police",
    "Stay aware of incident activity with an incident map"
  ];
  List<String> img = [
    "assets/images/intro_1_1.png",
    "assets/images/intro_2_1.png",
    "assets/images/intro_4_1.png",
    "assets/images/intro_3_1.png"
  ];
  String r_heading = "";
  String r_text = "";
  String r_img = "";
  int position = 0;

  setVisited(){
    Future<SharedPreferences> sharedPreferences = SharedPreferences.getInstance();
    sharedPreferences.then((value) => value.setBool("intro_screen_visited", true));
  }

  @override
  void initState() {
    // TODO: implement initState
    setState(() {
      r_heading = heading[0];
      r_text = texts[0];
      r_img = img[0];
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Color.fromRGBO(31, 34, 60, 1),
          //backgroundColor: Colors.white,
          body: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
              Row(
                children: [
                  Expanded(child: Image.asset(r_img)),
                ],
              ),
              SizedBox(height: 10,),
              Row(children: [
                Expanded(child: Text(r_heading, style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),))
              ],),
              SizedBox(height: 10,),
              Row(children: [
                Expanded(
                    child: Text(r_text,
                    style: TextStyle(color: Colors.white70, fontSize: 16),))
              ],),
              SizedBox(height: 50,),
              Row(children: [
                Expanded(
                  flex: 1,
                    child: Text("Skip", style: TextStyle(color: Colors.white),)
                ),
                Expanded(
                  flex: 8,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      Container(height: 10, width: 10, decoration: BoxDecoration(borderRadius: BorderRadius.circular(100),color: position==0?Colors.white:Colors.white38,),),
                      SizedBox(width: 5,),
                      Container(height: 10, width: 10, decoration: BoxDecoration(borderRadius: BorderRadius.circular(100),color: position==1?Colors.white:Colors.white38,),),
                      SizedBox(width: 5,),
                      Container(height: 10, width: 10, decoration: BoxDecoration(borderRadius: BorderRadius.circular(100),color: position==2?Colors.white:Colors.white38,),),
                      SizedBox(width: 5,),
                      Container(height: 10, width: 10, decoration: BoxDecoration(borderRadius: BorderRadius.circular(100),color: position==3?Colors.white:Colors.white38,),),
                    ],)
                ),
                position<3?GestureDetector(
                    onTap: (){
                      setState(() {
                        position+=1;
                      });
                      print(position);

                      setState(() {
                        r_heading = heading[position];
                        r_text = texts[position];
                        r_img = img[position];
                      });
                    },
                    child: Container(height: 45, width: 50, color: Colors.white, child: Icon(Ionicons.ios_arrow_forward, size: 35,),)):GestureDetector(
                    onTap: (){},
                    child: Container(height: 45, width: 50, color: Colors.white, child:Icon(Ionicons.ios_arrow_forward, size: 35,))),
              ],),
              SizedBox(height: 0,),
            ],),
          ),
      ),
    );
  }
}