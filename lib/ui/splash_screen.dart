import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'incident_map.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    Future<SharedPreferences> sharedPreferences = SharedPreferences.getInstance();
    sharedPreferences.then((value) => value.getBool("intro_screen_visited"));
    setState(() {
      r_heading = heading[0];
      r_text = texts[0];
      r_img = img[0];
    });
    super.initState();
  }
  gotoMainPage() async {
    await Future.delayed(const Duration(seconds: 3), (){
      print("00000000000009999999999999999");
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => IncidentMap()),
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    gotoMainPage();
    return Scaffold(
      body: Container(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        //crossAxisAlignment: CrossAxisAlignment.center,
        children: [Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Ionicons.ios_aperture, color: Colors.blue, size: 40,),
            Text("Alert", style: TextStyle(fontSize: 25),),
          ],
        )],
      ),)
    );
  }
}