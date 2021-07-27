

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget{

  final _scaffoldState = GlobalKey<ScaffoldState>();





  Size deviceSize;
  BuildContext _context;

  @override
  Widget build(BuildContext context) {
    _context = context;
    deviceSize = MediaQuery.of(context).size;

    // return defaultTargetPlatform == TargetPlatform.iOS
        // ? homeIOS(context)
        // : homeScaffold(context);
  }



}