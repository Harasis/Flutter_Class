import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

mydata() async {
  var urla = "http://192.168.1.61/home.html";

  var r = await http.get(urla);

  var data = r.body;
  print(data);
}

mydata2() async {
  var urlb = "http://192.168.1.61/cgi-bin/date.py";
  var s = await http.get(urlb);
  var data = s.body;
  print(data);
}

mydata3() async {
  var urlc = "http://192.168.1.61/cgi-bin/cal.py";
  var t = await http.get(urlc);
  var data = t.body;
  print(data);
}

mybody() {
  return Column(
    children: <Widget>[
      RaisedButton(
        onPressed: mydata,
        child: Text("Message"),
      ),
      RaisedButton(
        onPressed: mydata2,
        child: Text("Click for date cmd"),
      ),
      RaisedButton(
        onPressed: mydata3,
        child: Text("Click for Cal cmd"),
      ),
    ],
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text("Linux Web App"),
      ),
      body: mybody(),
    ));
  }
}
