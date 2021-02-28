import 'package:Alert/bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Testw3 extends StatefulWidget {
  Testw3({Key key}) : super(key: key);

  @override
  _Testw3State createState() => _Testw3State();
}

class _Testw3State extends State<Testw3> {
  bool one_ = false;
  bool two_ = false;
  bool three_ = false;

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
  showAlertDialog(BuildContext context) {
    bool one = false;
    bool two = false;
    bool three = false;
    // set up the button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {},
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      //title: Text("My title"),
      content: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
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
                          //set_incident_level(1);
                          setState(() {
                            one = true;
                            two = false;
                            three = false;
                          });
                        },
                        child: Container(
                          height: 40,
                          width: 40,
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
                          //set_incident_level(2);
                          setState(() {
                            one = false;
                            two = true;
                            three = false;
                          });
                        },
                        child: Container(
                          height: 40,
                          width: 40,
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
                          //set_incident_level(3);
                          setState(() {
                            one = false;
                            two = false;
                            three = true;
                          });
                        },
                        child: Container(
                          height: 40,
                          width: 40,
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
      actions: [
        okButton,
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    var mBloc = Provider.of<Bloc>(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            RaisedButton(child: Text("Rate"), onPressed: (){showAlertDialog(context);},),
            Center(
                child: RaisedButton(
                  child: Text('Open Dialog'),
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (_) {
                          mBloc.setIncidentType("Lost item");
                          return MyDialog(mBloc);
                        });
                  },
                )),
            Center(
                child: RaisedButton(
                  child: Text('Rate Dialog'),
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (_) {
                          //mBloc.setLevel("");
                          return RateDialog(mBloc);
                        });
                  },
                )),
          ],
        ),
      ),
    );
  }
}

/////////////////////////////////////////
class RateDialog extends StatefulWidget {
  var mBloc;
  RateDialog(this.mBloc);
  @override
  _RateDialogState createState() => new _RateDialogState(mBloc);
}

class _RateDialogState extends State<RateDialog> {
  var mBloc;
  _RateDialogState(mBloc);
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
    return AlertDialog(
      content: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
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
          ],),
      ),
      actions: <Widget>[
        FlatButton(
            child: Text('Submit', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            onPressed: () {
              if(one){
                print("one");
                mBloc.setLevel("Mild");
                Provider.of<Bloc>(context).setLevel("Mild");
                print(Provider.of<Bloc>(context).incident_type);
                print(Provider.of<Bloc>(context).level);
                Navigator.pop(context);
              }else if(two){
                Provider.of<Bloc>(context).setLevel("Severe");
                print(Provider.of<Bloc>(context).incident_type);
                print(Provider.of<Bloc>(context).level);
                Navigator.pop(context);
              }else if(three){
                print("three");
                mBloc.setLevel("Must Severe");
                print(mBloc.incident_type);
                print(mBloc.level);
                Navigator.pop(context);
              }
            })
      ],
    );
  }
}
///////////////////////////////////////////////////////

class MyDialog extends StatefulWidget {
  var mBloc;
  MyDialog(mBloc);
  @override
  _MyDialogState createState() => new _MyDialogState();
}

class _MyDialogState extends State<MyDialog> {
  Color _c = Colors.redAccent;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        color: _c,
        height: 20.0,
        width: 20.0,
      ),
      actions: <Widget>[
        FlatButton(
            child: Text('Switch'),
            onPressed: () => setState(() {
              _c == Colors.redAccent
                  ? _c = Colors.blueAccent
                  : _c = Colors.redAccent;
            }))
      ],
    );
  }
}