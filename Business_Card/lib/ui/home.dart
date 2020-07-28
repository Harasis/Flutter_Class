import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:fluttertoast/fluttertoast.dart';

myapp1() {
  myprint() {
    print("Harasis Singh !!!!");
  }

  FlutterStatusbarcolor.setStatusBarColor(Colors.blue.shade500);

  myt() {
    print("Click Click");
    Fluttertoast.showToast(
        msg: "Hey Brother",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  var mybody = Container(
    alignment: Alignment.center,
    width: double.infinity,
    height: double.infinity,
    color: Colors.blueGrey.shade50,
    margin: EdgeInsets.all(20),
    child: Stack(
      alignment: Alignment.topCenter,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
              color: Colors.red.shade900,
              borderRadius: BorderRadius.circular(30),
              border: Border.all(
                color: Colors.green,
                width: 3,
              )),
          margin: EdgeInsets.all(50),
          //padding: EdgeInsets.all(20),
          //padding: EdgeInsets.only(left: 30),
          alignment: Alignment.center,
          width: 300,
          height: 200,
          //color: Colors.purple,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Harasis Singh',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.email,
                    //color: Color.white,
                  ),
                  Text("  harasis123@gmail.com")
                ],
              )
            ],
          ),
        ),
        GestureDetector(
          onTap: myprint(),
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    "https://raw.githubusercontent.com/Harasis/Flutter_Class/master/Business_Card/download.png"),
                fit: BoxFit.cover,
              ),
              color: Colors.black,
              borderRadius: BorderRadius.circular(50),
              border: Border.all(
                color: Colors.amber,
                width: 3,
              ),
            ),
            //margin: EdgeInsets.all(50),
            width: 100,
            height: 100,
            //color: Colors.amber,
            //child: Text("Second"),
          ),
        ),
        /*Container(
          margin: EdgeInsets.all(75),
          width: 50,
          height: 50,
          color: Colors.green,
          child: Text("Third"),
        ),*/
      ],
    ),
  );

  return MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      appBar: AppBar(
        title: Text("My Business Card"),
        backgroundColor: Colors.blue.shade600,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add_a_photo),
            onPressed: myt(),
            color: Colors.white,
          ),
          IconButton(icon: Icon(Icons.account_circle), onPressed: myt()),
        ],
      ),
      body: mybody,
    ),
  );
}
