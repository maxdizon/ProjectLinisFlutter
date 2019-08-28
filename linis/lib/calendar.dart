import 'package:flutter/material.dart';
import 'calendar.dart';
import 'maps.dart';
import 'main.dart';
import 'package:flutter_calendar/flutter_calendar.dart';
import 'table_calendar.dart';
class Calendar extends StatefulWidget {
  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: new MyApp()
    );
  }
}
var index =2;
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}
String dropdownValue = 'One';
class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Project LINIS"),
        backgroundColor:Color.fromRGBO(92, 210, 173, 1),
      ),
      body: Container(
          color: Colors.white,
          child: Container(
            margin: EdgeInsets.only(top:50),
            child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(bottom: 20),
                    child: Text("Schedule",
                      textDirection: TextDirection.ltr,
                      style: TextStyle(
                          fontSize: 40,
                        fontWeight: FontWeight.bold
                      ),),
                  ),
                  Container(
                    height: 50,
                    width: 340,
                    margin: EdgeInsets.only(bottom:20),
                    child: Align(
                      alignment: Alignment(0,0 ),
                      child: Text("Collect Binlod, Argao",
                      textDirection: TextDirection.ltr,
                      style: TextStyle(
                        fontSize: 20
                      ),),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      boxShadow: [new BoxShadow(
                        color: Colors.grey,
                        blurRadius: 10.0,
                      )
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment(0, 0),
                    child: Container(
                      height: 280,
                      width: 340,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(92, 210, 173, 1),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        boxShadow: [new BoxShadow(
                          color: Colors.grey,
                          blurRadius: 10.0,
                        )
                        ],
                      ),
                      child: TableCalendarExample(),
                    ),
                  )
               ]
            ),
          )
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(bottom: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            index==1?selectedWidget(Icon(Icons.home), "Sensors"):IconButton(icon:Icon(Icons.home), onPressed:(){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Home()),
              );

            }),
            index==2?selectedWidget(Icon(Icons.calendar_today), "Calendar"):IconButton(icon:Icon(Icons.calendar_today),onPressed: (){

            },),
            index==3?selectedWidget(Icon(Icons.map), "Maps"):IconButton(icon: Icon(Icons.map), onPressed: () {
              Navigator.of(context).pushAndRemoveUntil(
                  new MaterialPageRoute(builder: (BuildContext context) => Maps()),
                  ModalRoute.withName("/Home") );

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
