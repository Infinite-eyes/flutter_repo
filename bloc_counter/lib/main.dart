import 'package:bloc_counter/test/flutter_bloc_test.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'test/cubit_bloc_test.dart';
import 'test/steam_test.dart';

// https://bloclibrary.dev/#/fluttercountertutorial
void main() {
  // stream();//dart stream test
  // cubitTest1();
  // cubitTest2();
  // cubitTest3();
  // cubitTest4();
  // cubitTest5();
  // cubitTest6();
  // blocTest1();
  // blocTest2();
  // blocTest3(); //Observing a Bloc
  // blocTest4();//onTransition
  // blocTest5();
  // blocTest6();
  // blocTest7();

  runApp(new App());

  // runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: 'Flutter Bloc Demo',
        debugShowCheckedModeBanner: false,
        theme: new ThemeData(
          primarySwatch: Colors.orange,
        ),
        home: CounterPage());
  }
}
