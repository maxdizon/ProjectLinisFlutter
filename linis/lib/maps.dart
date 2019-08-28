import 'package:flutter/material.dart';
import 'calendar.dart';
import 'maps.dart';
import 'main.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Maps extends StatefulWidget {
  @override
  _MapsState createState() => _MapsState();
}

class _MapsState extends State<Maps> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: new MyApp()
    );
  }
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}
String dropdownValue = 'One';
GoogleMapController mapController;

final LatLng _center = const LatLng(45.521563, -122.677433);
void _onMapCreated(GoogleMapController controller) {
  mapController = controller;
}

var index =3;
class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Project LINIS"),
        backgroundColor:Color.fromRGBO(92, 210, 173, 1),
      ),
      body: GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 11.0,)),
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(bottom: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            index==1?selectedWidget(Icon(Icons.home), "Sensors"):IconButton(icon:Icon(Icons.home), onPressed:(){
              Navigator.of(context).pushAndRemoveUntil(
                  new MaterialPageRoute(builder: (BuildContext context) => Home()),
                  ModalRoute.withName("/Home") );



            }),
            index==2?selectedWidget(Icon(Icons.calendar_today), "Calendar"):IconButton(icon:Icon(Icons.calendar_today),onPressed: (){
              Navigator.of(context).pushAndRemoveUntil(
                  new MaterialPageRoute(builder: (BuildContext context) => Calendar()),
                  ModalRoute.withName("/Home") );

            },),
            index==3?selectedWidget(Icon(Icons.map), "Maps"):IconButton(icon: Icon(Icons.map), onPressed: () {

            }),
          ],
        ),
      ),
    );
  }
  Widget selectedWidget(Icon icon, String str){
    return Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30
                )
            ),
            color: Colors.greenAccent.withOpacity(0.4)
        ),
        child: Row(
          children: <Widget>[
            icon,
            Text (str)
          ],
        )

    );

  }
}
