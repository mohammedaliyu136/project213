import 'dart:async';
import 'dart:typed_data';

import 'package:Alert/bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import 'dart:ui' as ui;

import '../main.dart';
import 'add_incident.dart';
import 'connect.dart';
import 'contact.dart';
import 'filters.dart';
import 'incident_detail.dart';
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
    var mBloc = Provider.of<Bloc>(context);
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
                            child: Icon(Ionicons.md_locate, color: Colors.white,),
                          ),
                          onTap: (){
                            mBloc.setResetCamera();
                          },
                        ),
                        /*
                        SizedBox(width: 10,),
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
                        ),*/
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

  CameraPosition _kLake;
  /*
  CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(position.latitude, position.longitude),
      //tilt: 59.440717697143555,
      zoom: 19.151926040649414);
  */

  get_current_location()async{
    Position _position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    setState((){
      position = _position;
      _kLake = CameraPosition(
          bearing: 192.8334901395799,
          target: LatLng(position.latitude, position.longitude),
          //tilt: 59.440717697143555,
          zoom: 15.4746,
          //zoom: 19.151926040649414
      );
    });
    print("---------${markers.length}");
  }

  Future load(String asset) async {
    ByteData data = await rootBundle.load(asset);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List());
    ui.FrameInfo fi = await codec.getNextFrame();
    return fi.image;
  }

  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(), targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png)).buffer.asUint8List();
  }

  Future<Uint8List> getBytesFromCanvas(int width, int height, String incident_text) async {
    final ui.PictureRecorder pictureRecorder = ui.PictureRecorder();
    final Canvas canvas = Canvas(pictureRecorder);
    final Paint paint = Paint()..color = Colors.blue;
    final Radius radius = Radius.circular(20.0);

    canvas.drawRRect(
        RRect.fromRectAndCorners(
          Rect.fromLTWH(0.0, 0.0, width.toDouble(), height.toDouble()),
          topLeft: radius,
          topRight: radius,
          bottomLeft: radius,
          bottomRight: radius,
        ),
        paint);

    //var image = await load('assets/images/accident.png');
    //canvas.drawImageRect(
      //image,
      //Rect.fromLTRB(
        //  100, 100, width.toDouble(), height.toDouble()),
      //Rect.fromCircle(center: new Offset(100, 100), radius: 100),
      //new Paint(),
    //);



    //TextPainter painter = TextPainter(textDirection: TextDirection.ltr);
    //painter.text = TextSpan(
      //text: incident_text,
      //style: TextStyle(fontSize: 25.0, color: Colors.white),
    //);

    //painter.layout();
    //painter.paint(canvas, Offset((width * 0.5) - painter.width * 0.5, (height * 0.5) - painter.height * 0.5));
    final img = await pictureRecorder.endRecording().toImage(width, height);
    final data = await img.toByteData(format: ui.ImageByteFormat.png);
    return data.buffer.asUint8List();
  }
  Future<Uint8List> getMarker_icon(String image_path) async {
    //"assets/images/lost_item.png"
    Uint8List byteData = await getBytesFromAsset(image_path, 150);
    return byteData;
  }

  @override
  initState() {
    // TODO: implement initState
    get_current_location();
    Firestore.instance.collection('incidents').getDocuments().then(
            (val)async{
              print("----${val.documents.length}");
              print("++++${val.documents[0]["latitude"]} ${val.documents[0]["longitude"]}");
              print("++++${val.documents[1]["latitude"]} ${val.documents[1]["longitude"]}");

          setState(() {
            incidents_list_2 = val.documents;
          });
              var bitmapIcon;
          for(var incident in val.documents){
            if(incident["category"]=="Fire and Smoke"){
              //bitmapIcon = await BitmapDescriptor.fromAssetImage(ImageConfiguration(size: Size(100, 100)),'assets/images/fire_and_smoke.png');
              //Uint8List markerIcon = await getBytesFromCanvas(200, 100, "fire_and_smoke");
              //bitmapIcon = BitmapDescriptor.fromBytes(markerIcon);

              Uint8List imageData = await getMarker_icon('assets/images/fire_and_smoke.png');
              bitmapIcon = BitmapDescriptor.fromBytes(imageData);
            }else if(incident["category"]=="Hazardous Material"){
              //bitmapIcon = await BitmapDescriptor.fromAssetImage(ImageConfiguration(size: Size(100, 100)),'assets/images/hazardous_materials.png');
              //Uint8List markerIcon = await getBytesFromCanvas(200, 100, "hazardous_materials");
              //bitmapIcon = BitmapDescriptor.fromBytes(markerIcon);

              Uint8List imageData = await getMarker_icon('assets/images/hazardous_materials.png');
              bitmapIcon = BitmapDescriptor.fromBytes(imageData);
            }else if(incident["category"]=="Lost Item"){
              //bitmapIcon = await BitmapDescriptor.fromAssetImage(ImageConfiguration(size: Size(100, 100)),'assets/images/lost_item.png');

              //Uint8List markerIcon = await getBytesFromCanvas(150, 150, "lost_item");
              //bitmapIcon = BitmapDescriptor.fromBytes(markerIcon);

              Uint8List imageData = await getMarker_icon('assets/images/lost_item.png');
              bitmapIcon = BitmapDescriptor.fromBytes(imageData);

              //final Uint8List markerIcon = await getBytesFromAsset('assets/images/lost_item.png', 100);
              //bitmapIcon = BitmapDescriptor.fromBytes(markerIcon);
            }else if(incident["category"]=="Suspicious Activity"){
              //bitmapIcon = await BitmapDescriptor.fromAssetImage(ImageConfiguration(devicePixelRatio: 1000), 'assets/images/suspicious_activity.png');
              //Uint8List markerIcon = await getBytesFromCanvas(200, 100, "suspicious_activity");
              //bitmapIcon = BitmapDescriptor.fromBytes(markerIcon);

              Uint8List imageData = await getMarker_icon('assets/images/suspicious_activity.png');
              bitmapIcon = BitmapDescriptor.fromBytes(imageData);
            }else if(incident["category"]=="Accident"){
              //bitmapIcon = await BitmapDescriptor.fromAssetImage(ImageConfiguration(size: Size(100, 100)),'assets/images/accident.png');
              //Uint8List markerIcon = await getBytesFromCanvas(200, 100, "accident");
              //bitmapIcon = BitmapDescriptor.fromBytes(markerIcon);

              Uint8List imageData = await getMarker_icon('assets/images/accident.png');
              bitmapIcon = BitmapDescriptor.fromBytes(imageData);
            }else if(incident["category"]=="Criminal"){
              //bitmapIcon = await BitmapDescriptor.fromAssetImage(ImageConfiguration(size: Size(100, 100)),'assets/images/criminal.png');
              //Uint8List markerIcon = await getBytesFromCanvas(200, 100, "criminal");
              //bitmapIcon = BitmapDescriptor.fromBytes(markerIcon);

              Uint8List imageData = await getMarker_icon('assets/images/criminal.png');
              bitmapIcon = BitmapDescriptor.fromBytes(imageData);
            }else if(incident["category"]=="Medical"){
              //bitmapIcon = await BitmapDescriptor.fromAssetImage(ImageConfiguration(size: Size(100, 100)),'assets/images/medical.png');
              //Uint8List markerIcon = await getBytesFromCanvas(200, 100, "medical");
              //bitmapIcon = BitmapDescriptor.fromBytes(markerIcon);

              Uint8List imageData = await getMarker_icon('assets/images/medical.png');
              bitmapIcon = BitmapDescriptor.fromBytes(imageData);
            }else if(incident["category"]=="Vehicle"){
              //bitmapIcon = await BitmapDescriptor.fromAssetImage(ImageConfiguration(size: Size(100, 100)),'assets/images/vehicle.png');
              Uint8List imageData = await getMarker_icon('assets/images/vehicle.png');
              bitmapIcon = BitmapDescriptor.fromBytes(imageData);
            }else if(incident["category"]=="Weather"){
              //bitmapIcon = await BitmapDescriptor.fromAssetImage(ImageConfiguration(size: Size(100, 100)),'assets/images/weather.png');
              Uint8List imageData = await getMarker_icon('assets/images/weather.png');
              bitmapIcon = BitmapDescriptor.fromBytes(imageData);
            }
            //bitmapIcon = await BitmapDescriptor.fromAssetImage(ImageConfiguration(size: Size(100, 100)),'assets/images/medical.png');
            //bitmapIcon = await getBytesFromAsset('assets/images/accident.png', 50);
            //final Marker marker = Marker(icon: BitmapDescriptor.fromBytes(markerIcon),position: LatLng(incident["latitude"], incident["longitude"]));

            //Uint8List imageData = await getMarker_icon();
            //bitmapIcon = BitmapDescriptor.fromBytes(imageData);
            setState(() {
              markers.add(
                  Marker(
                    markerId: MarkerId(incident.documentID),
                    position: LatLng(incident["latitude"], incident["longitude"]),
                    infoWindow: InfoWindow(
                        title: "${incident["category"]}",
                        snippet:"${incident["time_stamp_time"]} ${incident["time_stamp_day"]}",
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => IncidentDetail(incident)),
                          );
                        }
                    ),
                    icon:bitmapIcon,
                    //icon: BitmapDescriptor.fromBytes(markerIcon)
                      /*
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => IncidentDetail(incident)),
                    );
                  }*/
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
            });
          }
        }
    );
    print("----${incidents_list_2.length}");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _goToMyPosition(context);
    return new Scaffold(
      body: position!=null?GoogleMap(
        mapType: MapType.normal,
        //initialCameraPosition: _kGooglePlex,

        initialCameraPosition: CameraPosition(
          //target: LatLng(37.42796133580664, -122.085749655962),
          target: LatLng(position.latitude, position.longitude),
          zoom: 15.4746,
        ),
        myLocationEnabled: true,
        myLocationButtonEnabled: false,
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
  Future<void> _goToMyPosition(BuildContext context) async {
    var mBloc = Provider.of<Bloc>(context);
    if(mBloc.resetCamera){
      final GoogleMapController controller = await _controller.future;
      controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
      mBloc.setResetCamera();
    }
  }
}

