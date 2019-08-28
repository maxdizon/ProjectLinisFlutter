import 'package:flutter/material.dart';
import 'calendar.dart';
import 'maps.dart';

void main() => runApp(Home());
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}
var index =1;
class _HomeState extends State<Home> {
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
                child: Text("Sensor Data",
                textDirection: TextDirection.ltr,
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold
                ),),
              ),

              Container(
                height: 130,
                width: 315,
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(92, 227, 173, 1),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  boxShadow: [new BoxShadow(
                    color: Colors.grey,
                    blurRadius: 10.0,
                  )
                  ],),
                child: Padding(
                  padding: EdgeInsets.only(top:5),
                  child: Column(
                    children: <Widget>[
                      Text("Level",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            decoration: TextDecoration.none,
                            color: Colors.black,
                            fontSize: 25
                        ),
                        textDirection: TextDirection.ltr,),
                      Container(
                        margin: EdgeInsets.only(top:10),
                        child: Text("15 cm",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              decoration: TextDecoration.none,
                              color: Colors.black,
                              fontSize: 50,
                            fontWeight: FontWeight.bold
                          ),
                          textDirection: TextDirection.ltr,),
                      ),
                    ],

                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                      height: 130,
                      width: 150,
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(92, 227, 173, 1),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        boxShadow: [new BoxShadow(
                          color: Colors.grey,
                          blurRadius: 10.0,
                        )
                        ],),
                    child: Padding(
                      padding: EdgeInsets.only(top:5),
                      child: Column(
                    children: <Widget>[
                    Text("Moisture",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          decoration: TextDecoration.none,
                          color: Colors.black,
                          fontSize: 25
                      ),
                      textDirection: TextDirection.ltr,),
                Container(
                  margin: EdgeInsets.only(top:10),
                  child: Text("20%",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        decoration: TextDecoration.none,
                        color: Colors.black,
                        fontSize: 50,
                        fontWeight: FontWeight.bold
                    ),
                    textDirection: TextDirection.ltr,),
                ),
                ],

              ),
                    ),
                  ),
                  Container(
                    height: 130,
                    width: 150,
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(92, 227, 173, 1),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      boxShadow: [new BoxShadow(
                        color: Colors.grey,
                        blurRadius: 10.0,
                      )
                      ],),
                    child: Padding(
                      padding: EdgeInsets.only(top:5),
                      child: Column(
                        children: <Widget>[
                          Text("Methane",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                decoration: TextDecoration.none,
                                color: Colors.black,
                                fontSize: 25
                            ),
                            textDirection: TextDirection.ltr,),
                          Container(
                            margin: EdgeInsets.only(top:10),
                            child: Text("200",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  decoration: TextDecoration.none,
                                  color: Colors.black,
                                  fontSize: 50,
                                  fontWeight: FontWeight.bold
                              ),
                              textDirection: TextDirection.ltr,),
                          ),
                        ],

                      ),
                    ),
                  ),
                ],
              ),

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


            }),
            index==2?selectedWidget(Icon(Icons.calendar_today), "Calendar"):IconButton(icon:Icon(Icons.calendar_today),onPressed: (){
              Navigator.of(context).pushAndRemoveUntil(
                  new MaterialPageRoute(builder: (BuildContext context) => Calendar()),
                  ModalRoute.withName("/Home") );

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
