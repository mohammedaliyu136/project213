import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

class Filters extends StatefulWidget {
  Filters({Key key}) : super(key: key);

  @override
  _FiltersState createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {
  bool status = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(31, 34, 50, 1),
      appBar: AppBar(title: Text("Filters"), centerTitle: true, elevation: 0, backgroundColor: Colors.transparent,),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal:28.0),
        child: ListView(children: [
          ListTile(title: Text("Accident", style:TextStyle(color: Colors.white)),
            trailing: FlutterSwitch(showOnOff: false, activeTextColor: Colors.black, inactiveTextColor: Colors.blue[50], value: status,
              onToggle: (val) {
                setState(() {
                  status = val;
                });
              },
            ),),
          ListTile(title: Text("Criminal", style:TextStyle(color: Colors.white)),
            trailing: FlutterSwitch(showOnOff: false, activeTextColor: Colors.black, inactiveTextColor: Colors.blue[50], value: status,
              onToggle: (val) {
                setState(() {
                  status = val;
                });
              },
            ),),
          ListTile(title: Text("Fire or Smoke", style:TextStyle(color: Colors.white)),
            trailing: FlutterSwitch(showOnOff: false, activeTextColor: Colors.black, inactiveTextColor: Colors.blue[50], value: status,
              onToggle: (val) {
                setState(() {
                  status = val;
                });
              },
            ),),
          ListTile(title: Text("Hazardous Materials", style:TextStyle(color: Colors.white)),
            trailing: FlutterSwitch(showOnOff: false, activeTextColor: Colors.black, inactiveTextColor: Colors.blue[50], value: status,
              onToggle: (val) {
                setState(() {
                  status = val;
                });
              },
            ),),
          ListTile(title: Text("Lost Items", style:TextStyle(color: Colors.white)),
            trailing: FlutterSwitch(showOnOff: false, activeTextColor: Colors.black, inactiveTextColor: Colors.blue[50], value: status,
              onToggle: (val) {
                setState(() {
                  status = val;
                });
              },
            ),),
          ListTile(title: Text("Medical", style:TextStyle(color: Colors.white)),
            trailing: FlutterSwitch(showOnOff: false, activeTextColor: Colors.black, inactiveTextColor: Colors.blue[50], value: status,
              onToggle: (val) {
                setState(() {
                  status = val;
                });
              },
            ),),
          ListTile(title: Text("Suspicious Activity", style:TextStyle(color: Colors.white)),
            trailing: FlutterSwitch(showOnOff: false, activeTextColor: Colors.black, inactiveTextColor: Colors.blue[50], value: status,
              onToggle: (val) {
                setState(() {
                  status = val;
                });
              },
            ),),
          ListTile(title: Text("Vehicle", style:TextStyle(color: Colors.white)),
            trailing: FlutterSwitch(showOnOff: false, activeTextColor: Colors.black, inactiveTextColor: Colors.blue[50], value: status,
              onToggle: (val) {
                setState(() {
                  status = val;
                });
              },
            ),),
          ListTile(title: Text("Weather", style:TextStyle(color: Colors.white)),
            trailing: FlutterSwitch(showOnOff: false, activeTextColor: Colors.black, inactiveTextColor: Colors.blue[50], value: status,
              onToggle: (val) {
                setState(() {
                  status = val;
                });
              },
            ),),
        ],),
      ),
    );
  }
}