import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar:AppBar()
        appBar: appBar1);
  }
}

var appBar1 = AppBar(
  backgroundColor: Colors.red,
  title: new Text(
    "Title",
  ),
  elevation: 4.0,
  centerTitle: true,
);

var appBar2 = AppBar(
  title: new Text("Title"),
  actions: <Widget>[
    new IconButton(
      icon: new Icon(Icons.search),
      onPressed: () {},
    ),
    new IconButton(
      icon: new Icon(Icons.add),
      onPressed: () {},
    ),
  ],
);

var appBar3 = AppBar(
  backgroundColor: Colors.blueAccent,
  title: new Text("Title"),
  actions: <Widget>[
    new IconButton(
      icon: new Icon(Icons.search),
      onPressed: () {},
    ),
  ],
  iconTheme: IconThemeData(
    color: Colors.white,
  ),
  textTheme: TextTheme(
    title: TextStyle(color: Colors.white, fontSize: 20.0),
  ),
);

var appBar4 = AppBar(
  automaticallyImplyLeading: false,
  title: Center(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        new Text(
          "Title",
          style: TextStyle(fontSize: 18.0),
        ),
        new Text(
          "subtitle",
          style: TextStyle(fontSize: 14.0),
        ),
      ],
    ),
  ),
);


var appBar5 = AppBar(
  automaticallyImplyLeading: false,
  backgroundColor: Colors.yellow,
  title: Row(
    mainAxisAlignment: MainAxisAlignment.start,
    mainAxisSize: MainAxisSize.max,
    children: <Widget>[
      new FlutterLogo(),
      Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: new Text(
          "Title with image",
        ),
      ),
    ],
  ),
);


var appBar6 = AppBar(
  backgroundColor: Colors.transparent,
  title: Text("Transparent AppBar"),
  actions: <Widget>[
    IconButton(
      icon: Icon(
        Icons.search,
      ),
      onPressed: () {},
    )
  ],
);

