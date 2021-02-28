import 'package:flutter/material.dart';

class Bloc with ChangeNotifier {
  String level = "";
  String incident_type = "";
  String get mLevel => level;
  bool resetCamera = false;
  setLevel(val){level=val;notifyListeners();print("000");}

  String get mIncidentType => incident_type;
  setIncidentType(val){incident_type=val;notifyListeners();}

  setResetCamera(){
    resetCamera=!resetCamera;
    notifyListeners();
  }
}