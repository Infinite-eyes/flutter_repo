import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: floatingActionButton2,
      ),
    );
  }
}

var raiseButton0 = RaisedButton(
  onPressed: () {},
  color: Colors.yellow,
  disabledTextColor: Colors.grey,
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
  elevation: 20.0,
  splashColor: Colors.green,
  highlightColor: Colors.red,
  highlightElevation: 1.0,
  child: Text("Raised Button"),
);

var materialButton = MaterialButton(
    minWidth: 250.0,
    onPressed: () {},
    colorBrightness: Brightness.dark,
    color: Colors.deepPurpleAccent,
    elevation: 20.0,
    splashColor: Colors.green,
    highlightElevation: 1.0,
    child: Text("materialButton"));

var flatButton = FlatButton(
    onPressed: () {},
    colorBrightness: Brightness.dark,
    color: Colors.deepPurpleAccent,
    splashColor: Colors.green,
    highlightColor: Colors.red,
    child: Text("flat Button"),
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.horizontal(
            left: Radius.circular(20.0), right: Radius.circular(1.0))));

var outlineButton = OutlineButton(
    onPressed: () {},
    borderSide: BorderSide(width: 5.0, color: Colors.deepPurpleAccent),
    color: Colors.deepPurpleAccent,
    highlightedBorderColor: Colors.purple,
    splashColor: Colors.red,
    child: Text("Raised Button"),
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
            top: Radius.circular(20.0), bottom: Radius.circular(1.0))));

var iconButton = IconButton(
  color: Colors.purple,
  splashColor: Colors.yellow,
  icon: Icon(
    Icons.build,
    size: 40.0,
  ),
  onPressed: () {},
);

var floatingActionButton1 = FloatingActionButton(
    backgroundColor: Colors.orange,
    child: Icon(
      Icons.mic,
      size: 30.0,
      color: Colors.white,
    ),
    onPressed: () {});


var floatingActionButton2 = FloatingActionButton(
    mini:true,
    backgroundColor: Colors.green,
    child:Icon(Icons.mic,size:30.0,color:Colors.white),
    onPressed: (){},
);


