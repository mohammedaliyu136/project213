import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_sms/flutter_sms.dart';

import 'incident_map.dart';


class CameraPage extends StatefulWidget {
  String incident;
  String incident_rating;
  CameraPage(this.incident, this.incident_rating);

  @override
  _CameraPageState createState() => _CameraPageState(incident, incident_rating);
}

class _CameraPageState extends State<CameraPage> {
  _CameraPageState(this.incident, this.incident_rating);
  String incident;
  String incident_rating;
  String username;
  String contact_phonenumber;
  List<File> imageFiles = [];
  List<String> imageFilesURLS = [];
  int selected;
  bool isLoading = false;

  /// Select an image via gallery or camera
  Future<void> _pickImage(ImageSource source) async {
    File selected = await ImagePicker.pickImage(source: source);
    //imageFile = selected;
    //imageFiles.add(selected);
    setState(() {
      imageFiles.add(selected);
    });
  }

  String message;
  FirebaseStorage _storage;
  Future<String> uploadImage(var imageFile ) async {
    String filePath = 'images/${DateTime.now()}.png';

    StorageUploadTask _uploadTask = _storage.ref().child(filePath).putFile(imageFile);

    _uploadTask.events.forEach(
            (event){
          var progressPercent = event != null
              ? event.snapshot.bytesTransferred / event.snapshot.totalByteCount
              : 0;
          progressPercent=(progressPercent*100).round();
          message = "Uploading "+progressPercent.toString()+"% done.";
        }
    );

    var dowurl = await (await _uploadTask.onComplete).ref.getDownloadURL();
    var url = dowurl.toString();

    return url;
  }

  removeImageDialog(BuildContext context, index) {

    //imageFile!=null?print(imageFile.path.toString()):print("is null");

    // set up the buttons
    Widget cancelButton = FlatButton(
      child: Text("Delete"),
      onPressed:  () {
        setState(() {
          selected=null;
          imageFiles.removeAt(index);
        });
        Navigator.of(context).pop();
      },
    );
    Widget continueButton = FlatButton(
      child: Text("Cancel"),
      onPressed:  () {
        Navigator.of(context).pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      //title: Text("Pre-Orders Only"),
      content: Text("Are sure you want to remove the image"),
      actions: [
        cancelButton,
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
  getCredential()async{
    Future<SharedPreferences> sharedPreferences = SharedPreferences.getInstance();
    await sharedPreferences.then((value) => setState(() {username = value.getString("username");}));
    await sharedPreferences.then((value) => setState(() {contact_phonenumber = value.getString("contact_phonenumber")??"";}));
  }

  @override
  void initState() {
    // TODO: implement initState
    print(incident_rating);
    print(incident);
    _storage = FirebaseStorage(storageBucket: 'gs://incident-reporting-296516.appspot.com');
    getCredential();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: imageFiles.isNotEmpty?BoxDecoration(
            image: DecorationImage(
              image: FileImage(imageFiles[selected!=null?selected:0]),
              fit: BoxFit.cover,
            ),
          ):BoxDecoration(color: Color.fromRGBO(31, 34, 50, 1),),
          child: Scaffold(
              //backgroundColor: Color.fromRGBO(31, 34, 50, 1),
              backgroundColor: Colors.transparent,
              appBar: AppBar(title: Text("Images"), centerTitle: true, elevation: 0, backgroundColor: Colors.transparent),
              body:Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                  Row(children: List.generate(imageFiles.length,(index){
                    return Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: GestureDetector(
                        onTap: (){
                          setState(() {
                            selected=index;
                          });
                        },
                        onLongPress: (){
                          removeImageDialog(context, index);
                        },
                        child: Container(
                          height: 45, width: 35,
                          decoration: BoxDecoration(
                            border: selected==index?Border.all(width: 3.0, color: Color.fromRGBO(31, 34, 50, 0.5)):Border.all(width: 2.0, color: Colors.white),
                            image: DecorationImage(
                              image: FileImage(imageFiles[index]),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    );
                  }),),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    GestureDetector(
                      onTap: (){
                        _pickImage(ImageSource.camera);
                      },
                      child: Container(
                        height: 60, width: 60,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.all(Radius.circular(100)),
                        ),
                        child: Icon(Ionicons.ios_camera, size: 30, color: Colors.white,),
                      ),
                    ),
                    SizedBox(width: 20,),
                      imageFiles.length>0?GestureDetector(
                      onTap: () async {

                        /*
                        DateTime now = DateTime.now();
                        print(now);
                        print(now.hour);
                        String am_pm = "";
                        String time = "";
                        if(now.hour>12){
                          am_pm="PM";
                          time="${now.hour-12}:${now.minute} ${am_pm}";
                        }else{
                          am_pm="AM";
                          time="${now.hour}:${now.minute} ${am_pm}";
                        }
                        String day = "${now.day}/${now.month}/${now.year}";

                        print(day+" "+time);

                        setState(() {
                          isLoading=true;
                        });
                        for(var img in imageFiles){
                          String url = await uploadImage(img);
                          imageFilesURLS.add(url);
                        }

                        Position _position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
                        Firestore.instance.collection('incidents').document()
                            .setData({
                          'username': username,
                          'category': incident,
                          'incident_level': incident_rating,
                          'images': imageFilesURLS,
                          'time_stamp_time': time,
                          'time_stamp_day': day,
                          'latitude': _position.latitude,
                          'longitude': _position.longitude,
                        }).then((value){
                          setState(() {
                            isLoading=false;
                          });
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => IncidentMap()),
                          );
                        });
                        */
                        final coordinates = new Coordinates(1.10, 45.50);
                        var addresses = await Geocoder.local.findAddressesFromCoordinates(coordinates);
                        var first = addresses.first;
                        print("${first.featureName} : ${first.addressLine}");
                        await sendSMS(message: "Hello", recipients: [contact_phonenumber])
                            .catchError((onError) {
                          print(onError);
                        });
                      },
                      child: Container(
                        height: 60, width: 60,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.all(Radius.circular(100)),
                        ),
                        child: Icon(Ionicons.ios_cloud_upload, size: 30, color: Colors.white,),
                      ),
                    ):Container(),
                  ],),
                  SizedBox(height: 20,),
                ],),
              )
          ),
        ),
        isLoading?Scaffold(
          //height: MediaQuery. of(context).size.height,
          //width: MediaQuery. of(context).size.width,
          backgroundColor: Colors.white70,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.red),),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top:18.0, left: 8, right: 8),
                    child: Text("Sending your incident report, please wait...",),
                  ),
                ],
              )
            ],
          ),
        ):Container(height: 0, width: 0, color: Colors.white,)
      ],
    );
  }
}