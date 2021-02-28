import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';

import 'bloc/bloc.dart';
import 'ui/incident_map.dart';
import 'ui/permission_page.dart';
import 'ui/splash_screen.dart';
import 'ui/testw.dart';
import 'ui/add_incident.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Bloc>(
      builder: (context) => Bloc(),
      child: MaterialApp(
        title: 'Alert App',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
          //primaryColor: Colors.black,
        ),
        home: IncidentMap()//Testw4()// SplashScreen(),//MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}
class MapSample extends StatefulWidget {
  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
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
      }

      @override
  void initState() {
    // TODO: implement initState
    get_current_location();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: GoogleMap(
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
      ),
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
