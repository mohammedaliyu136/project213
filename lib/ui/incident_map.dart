import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../main.dart';
import 'add_incident.dart';
import 'connect.dart';
import 'contact.dart';
import 'filters.dart';
import 'my_report.dart';
import 'settings.dart';

class IncidentMap extends StatefulWidget {
  IncidentMap({Key key}) : super(key: key);

  @override
  _IncidentMapState createState() => _IncidentMapState();
}

class _IncidentMapState extends State<IncidentMap> {
  List<DocumentSnapshot> incidents_list = [];
  void initState() {
    // TODO: implement initState .where('restaurant_id', isEqualTo: document.documentID)

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Row(
            children: [
              Container(
                color:Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(height: 50, width: 50, color: Color.fromRGBO(31, 34, 50, 0.30),child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset("assets/images/i_map.png", width: 20,),
                    ),),
                    SizedBox(height: 10,),
                    GestureDetector(
                      child: Container(height: 50, width: 50, color: Colors.white70,child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset("assets/images/i_contact.png", width: 20,),
                      )),
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Contact()),
                        );
                      },
                    ),
                    SizedBox(height: 10,),
                    GestureDetector(
                      child: Container(height: 50, width: 50, color: Colors.white,child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset("assets/images/i_settings.png", width: 20,),
                      )),
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Settings()),
                        );
                      },
                    ),
                    SizedBox(height: 10,),
                    GestureDetector(
                      child: Container(height: 50, width: 50, color: Colors.white,child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset("assets/images/i_wanning.png", width: 20,),
                      )),
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MyReport()),
                        );
                      },
                    ),
                    SizedBox(height: 10,),
                    GestureDetector(
                      child: Container(height: 50, width: 50, color: Colors.white,child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset("assets/images/i_comment.png", width: 20,),
                      )),
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Connect()),
                        );
                      },
                    ),
                    SizedBox(height: 15,)
                  ],),
              ),
              Expanded(child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      image: new DecorationImage(
                        image: new ExactAssetImage('assets/images/map.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    height: MediaQuery.of(context).size.height,
                    child: MapSample(incidents_list),
                  ),
                  SafeArea(
                    child: Container(color:Color.fromRGBO(31, 34, 50, .30), height: 30, width: MediaQuery.of(context).size.width, child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                          Text("Incident Map", style: TextStyle(fontSize: 20, color: Colors.white))
                        ],),
                        /*
                        Row(
                          children: [
                            ListView(
                              scrollDirection: Axis.horizontal,
                              children: [Text("Last 2 hours"),Text("Last 2 hours"),Text("Last 2 hours"),Text("Last 2 hours"),],),
                          ],
                        ),*/
                      ],
                    ),),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom:8.0),
                      child: Container(height: 60, width: MediaQuery. of(context).size.width, child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                        GestureDetector(
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(31, 34, 50, 1),
                              borderRadius: BorderRadius.circular(10)
                            ),
                            child: Icon(Ionicons.ios_options, color: Colors.white,),
                          ),
                          onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Filters()),
                            );
                          },
                        ),
                        //Image.asset("assets/images/filter.png", width: 100,),
                        //Image.asset("assets/images/send.png", width: 100,),
                        //Icon(Ionicons.ios_options),
                        //Icon(Ionicons.ios_paper_plane),
                        SizedBox(width: 12,),
                        GestureDetector(
                          onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => AddIncident()),
                            );
                          },
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(31, 34, 50, 1),
                                borderRadius: BorderRadius.circular(10)
                            ),
                            child: Icon(Ionicons.ios_add, color: Colors.white),
                          ),
                        ),
                      ],),),
                    ),)
                ],
              ))
            ],
          ),
        ],
      ),
    );
  }
}

class MapSample extends StatefulWidget {
  MapSample(this.incidents_list);
  List<DocumentSnapshot> incidents_list;
  //Set<Marker> markers;

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  //MapSampleState(this.incidents_list);
  List<DocumentSnapshot> incidents_list_2 = [];
  Set<Marker> markers = {};
  Position position;
  double lat;
  double lon;
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    //target: LatLng(lat, lon),
    zoom: 14.4746,
  );

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  get_current_location()async{
    Position _position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    setState((){
      position = _position;
    });
    print("---------${markers.length}");
  }

  @override
  initState() {
    // TODO: implement initState
    get_current_location();
    Firestore.instance.collection('incidents').getDocuments().then(
            (val)async{
              print("++++${val.documents[0]["latitude"]} ${val.documents[0]["longitude"]}");
              print("++++${val.documents[1]["latitude"]} ${val.documents[1]["longitude"]}");

          setState(() {
            incidents_list_2 = val.documents;
          });
          for(var incident in val.documents){
            var bitmapIcon = await BitmapDescriptor.fromAssetImage(ImageConfiguration(size: Size(1000, 1000)),'assets/images/send.PNG');
            markers.add(
                Marker(
                  markerId: MarkerId('constainMarker'),
                  position: LatLng(incident["latitude"], incident["longitude"]),
                  infoWindow: InfoWindow(title: 'Ade Gbenro'),
                  icon:bitmapIcon
                  /*
                  icon: BitmapDescriptor.fromAssetImage(
                      ImageConfiguration(size: Size(48, 48)), 'assets/my_icon.png')
                      .then((onValue) {
                    myIcon = onValue;
                  })*/
                  /*
                  icon: BitmapDescriptor.defaultMarkerWithHue(
                    BitmapDescriptor.hueBlue,
                  ),*/
                )
            );
          }
        }
    );
    print("----${incidents_list_2.length}");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: position!=null?GoogleMap(
        mapType: MapType.normal,
        //initialCameraPosition: _kGooglePlex,

        initialCameraPosition: CameraPosition(
          //target: LatLng(37.42796133580664, -122.085749655962),
          target: LatLng(position.latitude, position.longitude),
          zoom: 14.4746,
        ),
        myLocationEnabled: true,
        compassEnabled: true,
        onMapCreated: (GoogleMapController controller) {
          //controller.setMapStyle('[{"featureType": "all","stylers": [{ "color": "#C0C0C0" }]},{"featureType": "road.arterial","elementType": "geometry","stylers": [{ "color": "#CCFFFF" }]},{"featureType": "landscape","elementType": "labels","stylers": [{ "visibility": "on" }]}]');
          //controller.setMapStyle('[{"elementType": "geometry","stylers": [{"color": "#f5f5f5"}]},{"featureType": "road","elementType": "geometry","stylers": [{"color": "#ffffff"}]},{"featureType": "water","elementType": "geometry","stylers": [{"color": "#c9c9c9"}]},{"featureType": "water","elementType": "labels.text.fill","stylers": [{"color": "#9e9e9e"}]}]');
          _controller.complete(controller);
        },
        markers: markers,
      ):Container(),
      /*
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToTheLake,
        label: Text('To the lake!'),
        icon: Icon(Icons.directions_boat),
      ),*/
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}
