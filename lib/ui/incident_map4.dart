import 'dart:async';
import 'dart:typed_data';

import 'package:Alert/bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:geolocator/geolocator.dart';
//import 'package:geolocator/geolocator.dart';
//import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
import 'package:latlong/latlong.dart';

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
  final PopupController _popupController = PopupController();

  List<DocumentSnapshot> incidents_list_2 = [];
  List<Marker> markers = [];
  Position position;
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
      /*
      _kLake = CameraPosition(
          bearing: 192.8334901395799,
          target: LatLng(position.latitude, position.longitude),
          //tilt: 59.440717697143555,
          zoom: 15.4746,
          //zoom: 19.151926040649414
      );*/
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
    Firestore.instance.collection('usershj').getDocuments().then(
            (val)async{
              print("----${val.documents.length}");
              print("++++${val.documents[0]["latitude"]} ${val.documents[0]["longitude"]}");
              print("++++${val.documents[1]["latitude"]} ${val.documents[1]["longitude"]}");

          setState(() {
            incidents_list_2 = val.documents;
          });
              var bitmapIcon;
          for(var incident in val.documents){

            setState(() {
              markers.add(
                  Marker(
                    anchorPos: AnchorPos.align(AnchorAlign.center),
                    height: 30,
                    width: 30,
                    point: LatLng(incident["latitude"], incident["longitude"]),
                    builder: (ctx) => Icon(Icons.pin_drop),
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
    //_goToMyPosition(context);
    return new Scaffold(
      body: position!=null?FlutterMap(
        options: MapOptions(
          center: LatLng(position.latitude, position.longitude),
          zoom: 5,
          plugins: [
            MarkerClusterPlugin(),
          ],
          onTap: (_) => _popupController
              .hidePopup(), // Hide popup when the map is tapped.
        ),
        layers: [
          TileLayerOptions(
            urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
            subdomains: ['a', 'b', 'c', 'd', 'e', 'f', 'g'],
          ),
          MarkerClusterLayerOptions(
            maxClusterRadius: 1,
            disableClusteringAtZoom: 2,
            size: Size(40, 40),
            anchor: AnchorPos.align(AnchorAlign.center),
            fitBoundsOptions: FitBoundsOptions(
              padding: EdgeInsets.all(50),
            ),
            markers: markers,
            polygonOptions: PolygonOptions(
                borderColor: Colors.blueAccent,
                color: Colors.black12,
                borderStrokeWidth: 3),
            popupOptions: PopupOptions(
                popupSnap: PopupSnap.markerTop,
                popupController: _popupController,
                popupBuilder: (_, marker) => Container(
                  width: 200,
                  height: 100,
                  color: Colors.white,
                  child: GestureDetector(
                    onTap: () => debugPrint("Popup tap!"),
                    child: Text(
                      "Container popup for marker at ${marker}",
                    ),
                  ),
                )),
            builder: (context, markers) {
              return FloatingActionButton(
                child: Text(markers.length.toString()),
                onPressed: null,
              );
            },
          ),
        ],
      ):Container(),
      /*
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToTheLake,
        label: Text('To the lake!'),
        icon: Icon(Icons.directions_boat),
      ),*/
    );
  }

  /*
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
  */
}

