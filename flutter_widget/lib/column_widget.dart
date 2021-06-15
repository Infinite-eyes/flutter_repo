import 'package:flutter/material.dart';

class ColumnWidget extends StatelessWidget {
  final bigStyle = TextStyle(color: Colors.black, fontSize: 40.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        // body:Column()
        body: column4);
  }
}

final bigStyle = TextStyle(color: Colors.black, fontSize: 40.0);

var column1 = Column(
  children: <Widget>[
    Text("Column 1", style: bigStyle),
    Text("Column 2", style: bigStyle),
    Text(
      "Column 3",
      style: bigStyle,
    )
  ],
);

var column2 =  Column(
  children: <Widget>[
    FlutterLogo(
      size: 100.0,
      // colors: Colors.red,
    ),
    Text("Column 2", style: bigStyle,),
    Container(
      color: Colors.green,
      height: 100.0,
      width: 100.0,
    )
  ],
);


var column3 = Column(
  mainAxisSize:  MainAxisSize.max,
  mainAxisAlignment: MainAxisAlignment.spaceAround,
  crossAxisAlignment: CrossAxisAlignment.end,

  children: <Widget>[
    FlutterLogo(
      size:100.0,
      // colors:Colors.red,
    ),
    Text("Child Two", style:bigStyle,),
    Container(
      color: Colors.blue,
      height: 100.0,
      width: 100.0,
    )
  ],
);


var column4 = Column(
  mainAxisSize: MainAxisSize.max,
  crossAxisAlignment: CrossAxisAlignment.center,
  mainAxisAlignment: MainAxisAlignment.spaceAround,

  children: <Widget>[
    Text("Parent Text 1"),
    Text("Parent Text 2"),
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Text("Child Row Text 1"),
        Text("Child Row Text 2")
      ],
    )
  ],
);



