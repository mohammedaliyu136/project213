import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

class Settings extends StatefulWidget {
  Settings({Key key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool status = false;
  double slider_val = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(31, 34, 50, 1),
      appBar: AppBar(title: Text("Notification Settings"), centerTitle: true, elevation: 0, backgroundColor: Colors.transparent),
      body: ListView(children: [
        ListTile(
          title: Text("Notification", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white70,),),
          trailing: FlutterSwitch(showOnOff: false, activeTextColor: Colors.black, inactiveTextColor: Colors.blue[50], value: status,
            onToggle: (val) {
              setState(() {
                status = val;
              });
            },
          ),
        ),
        ListTile(title: Text("Notify me when an incident occurs within: ${slider_val.round()}km", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300, color: Colors.white70,),),
          //subtitle: Slider(value: slider_val, onChanged: (val){setState(() {slider_val=val;});},min: 0,max: 100,),
          subtitle: SliderTheme(
            data: SliderTheme.of(context).copyWith(
              //activeTrackColor: Colors.red[700],
              //inactiveTrackColor: Colors.red[100],
              trackShape: RoundedRectSliderTrackShape(),
              trackHeight: 4.0,
              thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12.0),
              //thumbColor: Colors.redAccent,
              //overlayColor: Colors.red.withAlpha(32),
              overlayShape: RoundSliderOverlayShape(overlayRadius: 28.0),
              tickMarkShape: RoundSliderTickMarkShape(),
              //activeTickMarkColor: Colors.red[700],
              //inactiveTickMarkColor: Colors.red[100],
              valueIndicatorShape: PaddleSliderValueIndicatorShape(),
              //valueIndicatorColor: Colors.redAccent,
              valueIndicatorTextStyle: TextStyle(
                color: Colors.white,
              ),
            ),
            child: Slider(
              value: slider_val,
              min: 1,
              max: 20,
              divisions: 20,
              label: '${slider_val.round()}km',
              onChanged: (value) {
                setState(
                      () {
                        slider_val = value;
                  },
                );
              },
            ),
          ),
        ),

        ListTile(title: Text("Select the categories you would like to be notified about", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300, color: Colors.white70,),),),
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
    );
  }
}