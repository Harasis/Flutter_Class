import 'package:flutter/material.dart';

myapp() {
  var mytext = Text(
    '....My Beach App....',
    textDirection: TextDirection.ltr,
  );

  mypress() {
    print("Something Clicked...");
  }

  mypress2() {
    print('Something Clicked 2...');
  }

  var MyIcon1 = Icon(
    Icons.beach_access,
    color: Colors.amber,
  );

  var MyIcon2 = Icon(
    Icons.favorite,
    color: Colors.red,
  );

  var MyIcon1Button = IconButton(icon: MyIcon1, onPressed: mypress());
  var MyIcon2Button = IconButton(icon: MyIcon2, onPressed: mypress2());

  var UrlB =
      'https://raw.githubusercontent.com/Harasis/Flutter_Class/master/d1/img-1542352325-9133-8358-C13F9158-C303-C093-A4B2820BAB179ABA__aWxvdmVrZWxseQo_FocalPointCropWzQyNyw2NDAsNDksNTQsODUsImpwZyIsNjUsMi41XQ.jpg';

  var UrlI =
      'https://raw.githubusercontent.com/Harasis/Flutter_Class/master/d1/beach-logo-vectors_56473-5.jpg';

  var MyImage1 = Image.network(
    UrlB,
    width: double.infinity,
    height: double.infinity,
  );

  var MyImage2 = Image.network(
    UrlI,
    width: double.infinity,
    height: double.infinity,
  );

  var myappbar = AppBar(
    title: mytext,
    backgroundColor: Colors.deepPurple,
    leading: MyImage2,
    actions: <Widget>[MyIcon1Button, MyIcon2Button],
  );

  var myhome = Scaffold(
    appBar: myappbar,
    body: MyImage1,
    backgroundColor: Colors.black87,
  );

  var design = MaterialApp(
    home: myhome,
    debugShowCheckedModeBanner: false,
  );

  return design;
}
