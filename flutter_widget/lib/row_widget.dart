import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget/column_widget.dart';

class RowWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Container(
          // color.Color
            child: row3));
  }
}

var row0 = Row(
  mainAxisSize: MainAxisSize.min,
  children: <Widget>[
    FlutterLogo(
      size: 100.0,
      textColor: Colors.red,
    ),
    Text(
      "Column 2",
      style: bigStyle,
    ),
    Container(
      color: Colors.green,
      height: 100.0,
      width: 100.0,
    )
  ],
);


var row1 = Row(
  mainAxisSize: MainAxisSize.min,
  children: <Widget>[
    Text("Column 1", style: bigStyle,),
    Text("Column 2", style: bigStyle,),
    Text("Column 3", style: bigStyle,),
  ],
);


var row2 = Row(
    mainAxisSize: MainAxisSize.max,
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      FlutterLogo(
        size:100.0,
      ),
      Text("Child Two", style: bigStyle,),
      Container(
        color: Colors.blue,
        height: 100.0,
        width: 100.0,
      )
    ],
);


var row3 = Row(
  mainAxisSize: MainAxisSize.min,
  crossAxisAlignment: CrossAxisAlignment.center,
  mainAxisAlignment: MainAxisAlignment.spaceAround,
  children: <Widget>[
    Text("Parent Text 1"),
    Text("Parent Text 2"),
    Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Text("Child Row Text 1"),
        Text("Child Row Text 2")
      ],
    )
  ],
);