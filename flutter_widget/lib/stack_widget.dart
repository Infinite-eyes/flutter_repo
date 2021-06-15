import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StackWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(),
      body: stack4,
    );
  }
}

var stack1  = Stack(
  alignment: Alignment.center,
  children: <Widget>[
    Container(
      height: 300.0,
      width: 300.0,
      color:Colors.red
    ),
    Container(
      height: 250.0,
      width: 250.0,
      color: Colors.green,
    ),
    Container(
      height: 200.0,
      width: 200.0,
      color:Colors.yellow,
    )
  ],
);


var stack2 = Stack(
  alignment: Alignment.center,
  children: <Widget>[
    Container(
      height: 300.0,
      width: 300.0,
      color: Colors.red,
    ),
    Container(
      height: 250.0,
      width: 250.0,
      color: Colors.green,
    ),
    Container(
      height: 200.0,
      width: 200.0,
      color: Colors.yellow,
    )
  ],
);


var stack3 = Container(
  height: 400.0,
  child:Padding(
    padding: const EdgeInsets.all(8.0),
    child: Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Container(
          height: 300.0,
          width: 300.0,
          color: Colors.red,
        ),
        Positioned(
          top: 0.0,
          child: Container(
            height: 250.0,
            width: 250.0,
            color: Colors.green,
          ),
        )
      ],
    ),
  )
);


var stack4 = Container(
  height: 400.0,
  width: 350.0,
  child: Padding(
    padding: const EdgeInsets.all(8.0),
    child: Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Container(
          height: 300.0,
          width: 200.0,
          color: Colors.red,
        ),
        Positioned(
          right: 0.0,
          child: Container(
            height: 250.0,
            width: 150.0,
            color: Colors.green,
          ),
        )
      ],
    ),
  ),
);



