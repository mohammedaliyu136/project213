import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class IncidentDetail extends StatefulWidget {
  IncidentDetail(this.incident);
  var incident;

  @override
  _IncidentDetailState createState() => _IncidentDetailState(incident);
}

class _IncidentDetailState extends State<IncidentDetail> {
  _IncidentDetailState(this.incident);
  var incident;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(31, 34, 50, 1),
      appBar: AppBar(title: Text(incident["category"]), centerTitle: true, elevation: 0, backgroundColor: Colors.transparent),
      body: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("${incident["time_stamp_day"]} ${incident["time_stamp_time"]}", style: TextStyle(color: Colors.white),),
          ],
        ),
        SizedBox(height: 20,),/*
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  children: [
                    Icon(Ionicons.ios_add, color: Colors.white, size: 50,),

                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Container(
                        height: 100, width: 150,
                        decoration: BoxDecoration(
                          color: Colors.deepOrange,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Stack(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 50, width: 50,
                                      decoration: BoxDecoration(
                                        color: Colors.black54,
                                        borderRadius: BorderRadius.all(Radius.circular(10)),
                                      ),
                                      child: Icon(Ionicons.ios_play, color: Colors.white70, size: 30,),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  height: 50, width: 50,
                                  decoration: BoxDecoration(
                                    color: Colors.black54,
                                    borderRadius: BorderRadius.all(Radius.circular(10)),
                                  ),
                                  child: Icon(Ionicons.ios_trash, color: Colors.white70, size: 30,),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Container(
                        height: 100, width: 150,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Stack(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 50, width: 50,
                                      decoration: BoxDecoration(
                                        color: Colors.black54,
                                        borderRadius: BorderRadius.all(Radius.circular(10)),
                                      ),
                                      child: Icon(Ionicons.ios_play, color: Colors.white70, size: 30,),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  height: 50, width: 50,
                                  decoration: BoxDecoration(
                                    color: Colors.black54,
                                    borderRadius: BorderRadius.all(Radius.circular(10)),
                                  ),
                                  child: Icon(Ionicons.ios_trash, color: Colors.white70, size: 30,),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ],),
              ),
            ],
          ),
        ),*/
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left:8.0),
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    children: List.generate(incident["images"].length, (index) {
                      return GestureDetector(
                        onTap: (){

                        },
                        child: Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Container(
                            height: 150, width: 200,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                            ),
                            child: Stack(
                              children: [
                                CachedNetworkImage(
                                  placeholder: (context, url) => CircularProgressIndicator(),
                                  errorWidget: (context, url, error) => Icon(Icons.error),
                                  imageUrl: incident["images"][index],
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 40, width: 40,
                                      decoration: BoxDecoration(
                                        color: Colors.transparent,
                                        borderRadius: BorderRadius.all(Radius.circular(10)),
                                      ),
                                      child: Icon(Ionicons.ios_trash, color: Colors.transparent, size: 100,),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    }),),
                ),
              ),
            ],
          ),
        ),
        /*
        SizedBox(height: 20,),
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: ListView(children: [
                  ListTile(title: Text("Accident", style:TextStyle(color: Colors.white)),
                    trailing: Icon(Ionicons.ios_checkmark, color: Colors.blue, size: 60,)),
                  ListTile(title: Text("Criminal", style:TextStyle(color: Colors.white)),),
                  ListTile(title: Text("Fire or Smoke", style:TextStyle(color: Colors.white)),),
                  ListTile(title: Text("Hazardous Materials", style:TextStyle(color: Colors.white)),),
                  ListTile(title: Text("Lost Items", style:TextStyle(color: Colors.white)),),
                  ListTile(title: Text("Medical", style:TextStyle(color: Colors.white)),),
                  ListTile(title: Text("Suspicious Activity", style:TextStyle(color: Colors.white)),),
                  ListTile(title: Text("Vehicle", style:TextStyle(color: Colors.white)),),
                  ListTile(title: Text("Weather", style:TextStyle(color: Colors.white)),),
                ],),
              ),
            ],
          ),
        ),*/
      ],)
    );
  }
}