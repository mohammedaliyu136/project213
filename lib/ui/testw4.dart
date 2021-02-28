import 'package:Alert/bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Testw4 extends StatefulWidget {
  Testw4({Key key}) : super(key: key);

  @override
  _Testw4State createState() => _Testw4State();
}

class _Testw4State extends State<Testw4> {
  @override
  Widget build(BuildContext context) {
    Bloc mBloc = Provider.of<Bloc>(context);
    return Center(
        child: RaisedButton(
          child: Text('Rate Dialog'),
          onPressed: () {
            showDialog(
                context: context,
                builder: (_) {
                  mBloc.setLevel("99999");
                  print(mBloc.level);
                  return RateDialog(mBloc);
                });
          },
        ));
  }
}

class RateDialog extends StatefulWidget {
  Bloc mBloc;
  RateDialog(this.mBloc);
  @override
  _RateDialogState createState() => new _RateDialogState(mBloc);
}

class _RateDialogState extends State<RateDialog> {
  Bloc mBloc;
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
            child: Text('Continue', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
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
                Navigator.pop(context, "Severe");
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