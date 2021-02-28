import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
//import 'package:shared_preferences/shared_preferences.dart';

import 'incident_map.dart';
import 'intro_screens.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool visited = false;
  @override
  void initState() {
    // TODO: implement initState

    //Future<SharedPreferences> sharedPreferences = SharedPreferences.getInstance();
    //sharedPreferences.then((value) => setState(() {visited=value.getBool("intro_screen_visited")??false;}));

    super.initState();
  }
  gotoMainPage() async {
    await Future.delayed(const Duration(seconds: 30), (){
      print("00000000000009999999999999999");
      visited?Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => IncidentMap()),
      ):Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => IntroScreens()),
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    gotoMainPage();
    return Scaffold(
      backgroundColor: Color.fromRGBO(31, 34, 50, 1),
      body: Container(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        //crossAxisAlignment: CrossAxisAlignment.center,
        children: [Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Ionicons.ios_aperture, color: Colors.white, size: 45,),
            SizedBox(width: 10,),
            Text("Alert", style: TextStyle(fontSize: 35, fontWeight: FontWeight.w900, color: Colors.white),),
          ],
        )],
      ),)
    );
  }
}