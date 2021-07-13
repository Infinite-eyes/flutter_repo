// https://juejin.cn/post/6844904176234070024

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//v1 Provider
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: MyHomePage(),
//     );
//   }
// }
//
// class MyModel {
//   MyModel({this.counter = 0});
//
//   int counter = 0;
//
//   Future<void> incrementCounter() async {
//     await Future.delayed(Duration(seconds: 2));
//     counter++;
//     print(counter);
//   }
// }
//
// class MyHomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Provider(
//       create: (_) => MyModel(),
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text('provider'),
//         ),
//         body: Column(
//           children: <Widget>[
//             Builder(
//               builder: (context) {
//                 // 获取到provider提供出来的值
//                 MyModel _model = Provider.of<MyModel>(context);
//                 return Container(
//                     margin: const EdgeInsets.only(top: 20),
//                     width: MediaQuery.of(context).size.width,
//                     padding: const EdgeInsets.all(20),
//                     alignment: Alignment.center,
//                     color: Colors.lightBlueAccent,
//                     child: Text('当前是：${_model.counter}'));
//               },
//             ),
//             Consumer<MyModel>(
//               // 获取到provider提供出来的值
//               builder: (context, model, child) {
//                 return Container(
//                   margin: const EdgeInsets.only(top: 20),
//                   width: MediaQuery.of(context).size.width,
//                   padding: const EdgeInsets.all(20),
//                   alignment: Alignment.center,
//                   color: Colors.lightGreen,
//                   child: Text(
//                     '${model.counter}',
//                   ),
//                 );
//               },
//             ),
//             Consumer<MyModel>(
//               // 获取到provider提供出来的值
//               builder: (context, model, child) {
//                 return FlatButton(
//                     color: Colors.tealAccent,
//                     onPressed: model.incrementCounter,
//                     child: Icon(Icons.add));
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

//v2 ChangeNotifierProvider
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: MyHomePage(),
//     );
//   }
// }
//
// class MyModel with ChangeNotifier{
//   MyModel({this.counter = 0});
//
//   int counter = 0;
//
//   Future<void> incrementCounter() async {
//     await Future.delayed(Duration(seconds: 2));
//     counter++;
//     print(counter);
//     notifyListeners();
//   }
// }
//
// class MyHomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (_) => MyModel(),
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text('provider'),
//         ),
//         body: Column(
//           children: <Widget>[
//             Builder(
//               builder: (context) {
//                 // 获取到provider提供出来的值
//                 MyModel _model = Provider.of<MyModel>(context);
//                 return Container(
//                     margin: const EdgeInsets.only(top: 20),
//                     width: MediaQuery.of(context).size.width,
//                     padding: const EdgeInsets.all(20),
//                     alignment: Alignment.center,
//                     color: Colors.lightBlueAccent,
//                     child: Text('当前是：${_model.counter}'));
//               },
//             ),
//             Consumer<MyModel>(
//               // 获取到provider提供出来的值
//               builder: (context, model, child) {
//                 return Container(
//                   margin: const EdgeInsets.only(top: 20),
//                   width: MediaQuery.of(context).size.width,
//                   padding: const EdgeInsets.all(20),
//                   alignment: Alignment.center,
//                   color: Colors.lightGreen,
//                   child: Text(
//                     '${model.counter}',
//                   ),
//                 );
//               },
//             ),
//             Consumer<MyModel>(
//               // 获取到provider提供出来的值
//               builder: (context, model, child) {
//                 return FlatButton(
//                     color: Colors.tealAccent,
//                     onPressed: model.incrementCounter,
//                     child: Icon(Icons.add));
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

//v3 FutureProvider
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: MyHomePage(),
//     );
//   }
// }
//
// class MyHomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return FutureProvider(
//       initialData: MyModel(counter: 0),
//       create: (context) => someAsyncFunctionToGetMyModel(),
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text('provider'),
//         ),
//         body: Column(
//           children: <Widget>[
//             Builder(
//               builder: (context) {
//                 MyModel _model = Provider.of<MyModel>(context, listen: false);
//                 return Container(
//                     margin: const EdgeInsets.only(top: 20),
//                     width: MediaQuery.of(context).size.width,
//                     padding: const EdgeInsets.all(20),
//                     alignment: Alignment.center,
//                     color: Colors.lightBlueAccent,
//                     child: Text('当前是：${_model.counter}'));
//               },
//             ),
//             Consumer<MyModel>(
//               builder: (context, model, child) {
//                 return Container(
//                   margin: const EdgeInsets.only(top: 20),
//                   width: MediaQuery.of(context).size.width,
//                   padding: const EdgeInsets.all(20),
//                   alignment: Alignment.center,
//                   color: Colors.lightGreen,
//                   child: Text(
//                     '${model.counter}',
//                   ),
//                 );
//               },
//             ),
//             Consumer<MyModel>(
//               builder: (context, model, child) {
//                 return FlatButton(
//                     color: Colors.tealAccent,
//                     onPressed: model.incrementCounter,
//                     child: Icon(Icons.add));
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Future<MyModel> someAsyncFunctionToGetMyModel() async {
//     //  <--- async function
//     await Future.delayed(Duration(seconds: 3));
//     return MyModel(counter: 1);
//   }
// }
//
// class MyModel with ChangeNotifier {
//   MyModel({this.counter = 0});
//
//   int counter = 0;
//
//   Future<void> incrementCounter() async {
//     await Future.delayed(Duration(seconds: 2));
//     counter++;
//     print(counter);
//     notifyListeners();
//   }
// }

//v4 StreamProvider
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: MyHomePage(),
//     );
//   }
// }
//
// class MyHomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return StreamProvider(
//       initialData: MyModel(counter: 0),
//       create: (context) => getStreamOfMyModel(),
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text('provider'),
//         ),
//         body: Column(
//           children: <Widget>[
//             Builder(
//               builder: (context) {
//                 MyModel _model = Provider.of<MyModel>(context, listen: false);
//                 return Container(
//                     margin: const EdgeInsets.only(top: 20),
//                     width: MediaQuery.of(context).size.width,
//                     padding: const EdgeInsets.all(20),
//                     alignment: Alignment.center,
//                     color: Colors.lightBlueAccent,
//                     child: Text('当前是：${_model.counter}'));
//               },
//             ),
//             Consumer<MyModel>(
//               builder: (context, model, child) {
//                 return Container(
//                   margin: const EdgeInsets.only(top: 20),
//                   width: MediaQuery.of(context).size.width,
//                   padding: const EdgeInsets.all(20),
//                   alignment: Alignment.center,
//                   color: Colors.lightGreen,
//                   child: Text(
//                     '${model.counter}',
//                   ),
//                 );
//               },
//             ),
//             Consumer<MyModel>(
//               builder: (context, model, child) {
//                 return FlatButton(
//                     color: Colors.tealAccent,
//                     onPressed: model.incrementCounter,
//                     child: Icon(Icons.add));
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Stream<MyModel> getStreamOfMyModel() {
//     return Stream<MyModel>.periodic(Duration(seconds: 1),(x) => MyModel(counter: x)).take(10);
//   }
// }
//
// class MyModel with ChangeNotifier {
//   MyModel({this.counter = 0});
//
//   int counter = 0;
//
//   Future<void> incrementCounter() async {
//     await Future.delayed(Duration(seconds: 2));
//     counter++;
//     print(counter);
//     notifyListeners();
//   }
// }

//v5  ValueListenableProvider
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: MyHomePage(),
//     );
//   }
// }
//
// class MyHomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Provider<MyModel>(
//         create: (context) => MyModel(),
//         child: Consumer<MyModel>(
//           builder: (context, myModel, child) {
//             return ValueListenableProvider<int>.value(
//               value: myModel.counter,
//               child: Scaffold(
//                 appBar: AppBar(
//                   title: Text('provider'),
//                 ),
//                 body: Column(
//                   children: <Widget>[
//                     Builder(
//                       builder: (context) {
//                         var count = Provider.of<int>(context);
//                         return Container(
//                             margin: const EdgeInsets.only(top: 20),
//                             width: MediaQuery
//                                 .of(context)
//                                 .size
//                                 .width,
//                             padding: const EdgeInsets.all(20),
//                             alignment: Alignment.center,
//                             color: Colors.lightBlueAccent,
//                             child: Text('当前是：${count}'));
//                       },
//                     ),
//                     Consumer<int>(
//                       builder: (context, value, child) {
//                         return Container(
//                           margin: const EdgeInsets.only(top: 20),
//                           width: MediaQuery
//                               .of(context)
//                               .size
//                               .width,
//                           padding: const EdgeInsets.all(20),
//                           alignment: Alignment.center,
//                           color: Colors.lightGreen,
//                           child: Text('$value',),
//                         );
//                       },
//                     ),
//                     Consumer<MyModel>(
//                       builder: (context, model, child) {
//                         return FlatButton(
//                             color: Colors.tealAccent,
//                             onPressed: model.incrementCounter,
//                             child: Icon(Icons.add));
//                       },
//                     ),
//                   ],
//                 ),
//               ),
//             );
//           },
//         ));
//   }
//
// }
//
// class MyModel {
//
//   ValueNotifier<int> counter = ValueNotifier(0);
//
//   Future<void> incrementCounter() async {
//     await Future.delayed(Duration(seconds: 2));
//     print(counter.value++);
//     counter.value = counter.value;
//   }
// }

// v6 ListenableProvider
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: MyHomePage(),
//     );
//   }
// }
//
// class MyHomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ListenableProvider<MyModel>(
//         create: (context) => MyModel(),
//         child: Scaffold(
//           appBar: AppBar(
//             title: Text('provider'),
//           ),
//           body: Column(
//             children: <Widget>[
//               Builder(
//                 builder: (context) {
//                   MyModel model = Provider.of<MyModel>(context);
//                   return Container(
//                       margin: const EdgeInsets.only(top: 20),
//                       width: MediaQuery.of(context).size.width,
//                       padding: const EdgeInsets.all(20),
//                       alignment: Alignment.center,
//                       color: Colors.lightBlueAccent,
//                       child: Text('当前是：${model.counter}'));
//                 },
//               ),
//               Consumer<MyModel>(
//                 builder: (context, model, child) {
//                   return Container(
//                     margin: const EdgeInsets.only(top: 20),
//                     width: MediaQuery.of(context).size.width,
//                     padding: const EdgeInsets.all(20),
//                     alignment: Alignment.center,
//                     color: Colors.lightGreen,
//                     child: Text(
//                       '${model.counter}',
//                     ),
//                   );
//                 },
//               ),
//               Consumer<MyModel>(
//                 builder: (context, model, child) {
//                   return FlatButton(
//                       color: Colors.tealAccent,
//                       onPressed: model.incrementCounter,
//                       child: Icon(Icons.add));
//                 },
//               ),
//             ],
//           ),
//         ));
//   }
// }
//
// class MyModel with ChangeNotifier {
//   int counter = 0;
//
//   Future<void> incrementCounter() async {
//     await Future.delayed(Duration(seconds: 2));
//     counter++;
//     notifyListeners();
//     print(counter);
//   }
// }

// v7 MultiProvider
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: MyHomePage(),
//     );
//   }
// }
//
// class MyHomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MultiProvider(
//       providers: [
//         ChangeNotifierProvider<BannerModel>(create: (context) => BannerModel()),
//         ChangeNotifierProvider<ListModel>(create: (context) => ListModel()),
//       ],
//       child: Scaffold(
//           appBar: AppBar(
//             title: Text('provider'),
//           ),
//           body: Column(
//             children: <Widget>[
//               Builder(
//                 builder: (context) {
//                   BannerModel model = Provider.of<BannerModel>(context);
//                   return Container(
//                       margin: const EdgeInsets.only(top: 20),
//                       width: MediaQuery.of(context).size.width,
//                       padding: const EdgeInsets.all(20),
//                       alignment: Alignment.center,
//                       color: Colors.lightBlueAccent,
//                       child: Text('当前Banner有几个：${model.counter}'));
//                 },
//               ),
//               Consumer<ListModel>(
//                 builder: (context, model, child) {
//                   return Container(
//                       margin: const EdgeInsets.only(top: 20),
//                       width: MediaQuery.of(context).size.width,
//                       padding: const EdgeInsets.all(20),
//                       alignment: Alignment.center,
//                       color: Colors.lightGreen,
//                       child: Text(
//                         '当前Banner有几个：${model.counter}',
//                       ));
//                 },
//               ),
//               Consumer<BannerModel>(
//                 builder: (context, model, child) {
//                   return FlatButton(
//                       color: Colors.tealAccent,
//                       onPressed: model.getBanner,
//                       child: Text("获取banner"));
//                 },
//               ),
//               Consumer<ListModel>(
//                 builder: (context, model, child) {
//                   return FlatButton(
//                       color: Colors.tealAccent,
//                       onPressed: model.getList,
//                       child: Text("获取列表"));
//                 },
//               )
//             ],
//           )),
//     );
//   }
// }
//
// class BannerModel with ChangeNotifier {
//   int counter = 0;
//
//   Future<void> getBanner() async {
//     await Future.delayed(Duration(seconds: 2));
//     counter++;
//     notifyListeners();
//     print(counter);
//   }
// }
//
// class ListModel with ChangeNotifier {
//   int counter = 0;
//
//   Future<void> getList() async {
//     await Future.delayed(Duration(seconds: 2));
//     counter++;
//     notifyListeners();
//     print(counter);
//   }
// }

//v8 ProxyProvider

// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: MyHomePage(),
//     );
//   }
// }
//
// class MyHomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MultiProvider(
//       providers: [
//         ChangeNotifierProvider<PicModel>(create: (context) => PicModel()),
//         ProxyProvider<PicModel, SubmitModel>(
//           update: (context, myModel, anotherModel) => SubmitModel(myModel),
//         )
//       ],
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text('provider'),
//         ),
//         body: Column(
//           children: <Widget>[
//             Builder(
//               builder: (context) {
//                 PicModel model = Provider.of<PicModel>(context);
//                 return Container(
//                     margin: const EdgeInsets.only(top: 20),
//                     width: MediaQuery
//                         .of(context)
//                         .size
//                         .width,
//                     padding: const EdgeInsets.all(20),
//                     alignment: Alignment.center,
//                     color: Colors.lightBlueAccent,
//                     child: Text('提交图片：${model.counter}'));
//               },
//             ),
//             Consumer<PicModel>(
//               builder: (context, model, child) {
//                 return FlatButton(
//                     color: Colors.tealAccent,
//                     onPressed: model.upLoadPic,
//                     child: Text("提交图片"));
//               },
//             ),
//             Consumer<SubmitModel>(
//               builder: (context, model, child) {
//                 return FlatButton(
//                   color:Colors.tealAccent,
//                     onPressed: model.subMit,
//                     child: Text("提交"));
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class PicModel with ChangeNotifier {
//   int counter = 0;
//
//   Future<void> upLoadPic() async {
//     await Future.delayed(Duration(seconds: 2));
//     counter++;
//     notifyListeners();
//     print(counter);
//   }
// }
//
// class SubmitModel {
//   PicModel _model;
//
//   SubmitModel(this._model);
//
//   Future<void> subMit() async {
//     await _model.upLoadPic();
//   }
// }

// v9

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseWidget<LoginViewModel>(
      model: LoginViewModel(loginService: LoginService()),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text('provider'),
        ),
        body: Column(
          children: <Widget>[
            model.state == ViewState.Loading
                ? Center(child: CircularProgressIndicator())
                : Text(model.info),
            FlatButton(
                color: Colors.tealAccent,
                onPressed: () => model.login("pwd"),
                child: Text("登录"))
          ],
        ),
      ),
    );
  }
}

class LoginViewModel extends BaseModel {
  LoginService _loginService;
  String info = '请登录';

  LoginViewModel({LoginService loginService}) : _loginService = loginService;

  Future<String> login(String pwd) async {
    setState(ViewState.Loading);
    info = await _loginService.login(pwd);
    setState(ViewState.Success);
  }
}

class LoginService {
  static const String Login_path = 'xxxxxx';

  Future<String> login(String pwd) async {
    return new Future.delayed(const Duration(seconds: 1), () => "登录成功");
  }
}

class BaseWidget<T extends ChangeNotifier> extends StatefulWidget {
  final Widget Function(BuildContext context, T value, Widget child) builder;

  final T model;
  final Widget child;
  final Function(T) onModelReady;

  BaseWidget({Key key, this.model, this.builder, this.child, this.onModelReady})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _BaseWidgetState<T>();
}

class _BaseWidgetState<T extends ChangeNotifier> extends State<BaseWidget<T>> {
  T model;

  @override
  void initState() {
    model = widget.model;

    if (widget.onModelReady != null) {
      widget.onModelReady(model);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
      create: (BuildContext context) => model,
      child: Consumer<T>(
        builder: widget.builder,
        child: widget.child,
      ),
    );
  }
}

enum ViewState { Loading, Success, Failure, None }

class BaseModel extends ChangeNotifier {
  ViewState _state = ViewState.None;

  ViewState get state => _state;

  void setState(ViewState viewState) {
    _state = viewState;
    notifyListeners();
  }
}
