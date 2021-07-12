
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// https://www.jianshu.com/p/eed980e5790b
//v1
// class CountBloc {
//   int _count = 0;
//   StreamController<int> _controller;
//
//   Stream<int> get count => _controller.stream;
//
//   CountBloc() {
//     _count = 0;
//     _controller = StreamController.broadcast();
//   }
//
//   void increment() {
//     _controller.sink.add(++_count);
//   }
//
//   void dispose() {
//     _controller.close();
//   }
// }
// //全局单例模式
// CountBloc bloc = CountBloc();
//
//
// class BlocPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return _body(context);
//   }
//
//   Widget _body(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("BlocPage"),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text('You have pushed the button this many times:'),
//             StreamBuilder(
//                 stream: bloc.count,
//                 initialData: 0,
//                 builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
//                   return Text("${snapshot.data}");
//                 }),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {
//             return BlocPageTwo();
//           }));
//         },
//         tooltip: 'Increment',
//         child: Icon(Icons.add),
//       ),
//     );
//   }
// }
//
//
// class BlocPageTwo extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return _body(context);
//   }
//
//   Widget _body(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("BlocPageTwo"),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text('You have pushed the button this many times:'),
//             StreamBuilder(
//                 stream: bloc.count,
//                 initialData: 0,
//                 builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
//                   return Text("${snapshot.data}");
//                 }),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           bloc.increment();
//         },
//         tooltip: 'Increment',
//         child: Icon(Icons.add),
//       ),
//     );
//   }
// }
//
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter状态管理',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       home: BlocPage(),
//     );
//   }
// }



//v2
// class CountBloc {
//   int _count = 0;
//   StreamController<int> _controller;
//
//   Stream<int> get count => _controller.stream;
//
//   CountBloc() {
//     _count = 0;
//     _controller = StreamController.broadcast();
//   }
//
//   void increment() {
//     _controller.sink.add(++_count);
//   }
//
//   void dispose() {
//     _controller.close();
//   }
// }
//
//
// class BlocPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return _body(context);
//   }
//
//   Widget _body(BuildContext context) {
//     final _bloc = CountProvider.of(context);
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("BlocPage"),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text('You have pushed the button this many times:'),
//             StreamBuilder(
//                 stream: _bloc.count,
//                 initialData: 0,
//                 builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
//                   return Text("${snapshot.data}");
//                 }),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {
//             return BlocPageTwo();
//           }));
//         },
//         tooltip: 'Increment',
//         child: Icon(Icons.add),
//       ),
//     );
//   }
// }
//
// class BlocPageTwo extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return _body(context);
//   }
//
//   Widget _body(BuildContext context) {
//     final _bloc = CountProvider.of(context);
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("BlocPageTwo"),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text('You have pushed the button this many times:'),
//             StreamBuilder(
//                 stream: _bloc.count,
//                 initialData: 0,
//                 builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
//                   return Text("${snapshot.data}");
//                 }),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           _bloc.increment();
//         },
//         tooltip: 'Increment',
//         child: Icon(Icons.add),
//       ),
//     );
//   }
// }
//
// void main() {
//   runApp(CountProvider(child: MyApp()));
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter状态管理',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       home: BlocPage(),
//     );
//   }
// }
//
//
//















