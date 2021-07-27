import 'package:flutter/material.dart';
import 'package:ui_kit/utils/uidata.dart';

import 'di/dependency_injection.dart';
// https://github.com/iampawan/Flutter-UI-Kit

void main() {
  Injector.configure(Flavor.MOCK); //环境切换
  runApp(MyApp());
}


class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: UIData.appName,
      theme: ThemeData(
          primaryColor: Colors.black,
          fontFamily: UIData.quickFont,
          primarySwatch: Colors.amber),

      debugShowCheckedModeBanner: false,
      showPerformanceOverlay: false,
      // home:



    );;
  }


}