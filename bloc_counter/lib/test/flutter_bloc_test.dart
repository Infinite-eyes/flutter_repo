import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// https://pub.flutter-io.cn/packages/flutter_bloc

enum CounterEvent { increment, decrement }

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0);

  @override
  Stream<int> mapEventToState(CounterEvent event) async* {
    switch (event) {
      case CounterEvent.decrement:
        yield state - 1;
        break;
      case CounterEvent.increment:
        yield state + 1;
        break;
    }
  }
}

class CounterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Counter')),
      body: BlocBuilder<CounterBloc, int>(
        builder: (context, count) {
          return Center(
            child: Text(
              '$count',
              style: TextStyle(fontSize: 24.0),
            ),
          );
        },
      ),
      floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.0),
            child: FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () {
                context.read<CounterBloc>().add(CounterEvent.increment);
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.0),
            child: FloatingActionButton(
              child: Icon(Icons.remove),
              onPressed: () {
                context.read<CounterBloc>().add(CounterEvent.decrement);
              },
            ),
          )
        ],
      ),
    );
  }
}

class App1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: 'Flutter Bloc Demo',
        debugShowCheckedModeBanner: false,
        theme: new ThemeData(
          primarySwatch: Colors.orange,
        ),
        // home:
        home: BlocProvider(
          create: (_) => CounterBloc(),
          child: CounterPage(),
        ));
  }
}

// v2 https://pub.flutter-io.cn/packages/flutter_bloc/example
//
// class SimpleBlocObserver extends BlocObserver {
//
//   @override
//   void onEvent(Bloc bloc, Object event) {
//     super.onEvent(bloc, event);
//     print(event);
//   }
//
//
//   @override
//   void onTransition(Bloc bloc, Transition transition) {
//     super.onTransition(bloc, transition);
//     print(transition);
//   }
//
//
//   @override
//   void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
//     print(error);
//     super.onError(bloc, error, stackTrace);
//   }
//
//
// }
//
//
// class App extends StatelessWidget {
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//         create: (_) => ThemeCubit(),
//         child: BlocBuilder<ThemeCubit, ThemeData>(
//           builder: (_, theme) {
//             return MaterialApp(
//               theme: theme,
//               home: BlocProvider(
//                 create: (_) => CounterBloc(),
//                 child: CounterPage(),
//               ),
//             );
//           },
//         )
//     );
//   }
// }
//
// class CounterPage extends StatelessWidget {
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Counter')),
//       body: BlocBuilder<CounterBloc, int>(
//         builder: (_, count) {
//           return Center(
//             child: Text('$count', style: Theme
//                 .of(context)
//                 .textTheme
//                 .headline1),
//           );
//         },
//       ),
//
//       floatingActionButton: Column(
//         crossAxisAlignment: CrossAxisAlignment.end,
//         mainAxisAlignment: MainAxisAlignment.end,
//         children: <Widget>[
//           Padding(
//             padding: const EdgeInsets.symmetric(vertical: 5.0),
//             child: FloatingActionButton(
//               child: const Icon(Icons.add),
//               onPressed: () =>
//                   context.read<CounterBloc>().add(CounterEvent.increment),
//             ),
//           ),
//           Padding(
//               padding: const EdgeInsets.symmetric(vertical: 5.0),
//               child: FloatingActionButton(
//                 child: const Icon(Icons.add),
//                 onPressed: () =>
//                     context.read<CounterBloc>().add(CounterEvent.decrement),
//               )
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(vertical: 5.0),
//             child: FloatingActionButton(
//               child: const Icon(Icons.brightness_6),
//               onPressed: () => context.read<ThemeCubit>().toggleTheme(),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(vertical: 5.0),
//             child: FloatingActionButton(
//               backgroundColor: Colors.red,
//               child: const Icon(Icons.error),
//               onPressed: ()=> context.read<CounterBloc>().add(CounterEvent.error),
//             )
//           )
//         ],
//       ),
//     );
//   }
// }
//
//
//
//
// enum CounterEvent {
//   increment,
//   decrement,
//   error,
// }
//
// class CounterBloc extends Bloc<CounterEvent, int> {
//
//   CounterBloc() : super(0);
//
//   @override
//   Stream<int> mapEventToState(event) async* {
//     switch (event) {
//       case CounterEvent.decrement:
//         yield state - 1;
//         break;
//       case CounterEvent.increment:
//         yield state + 1;
//         break;
//       case CounterEvent.error:
//         addError(Exception('unsupported event'));
//     }
//   }
// }
//
//
// class ThemeCubit extends Cubit<ThemeData> {
//
//   ThemeCubit() : super(_lightTheme);
//
//   static final _lightTheme = ThemeData(
//     floatingActionButtonTheme: const FloatingActionButtonThemeData(
//         foregroundColor: Colors.white),
//     brightness: Brightness.light,
//   );
//
//   static final _darkTheme = ThemeData(
//     floatingActionButtonTheme: const FloatingActionButtonThemeData(
//       foregroundColor: Colors.black,
//     ),
//     brightness: Brightness.dark,
//   );
//
//   void toggleTheme() {
//     emit(state.brightness == Brightness.dark ? _lightTheme : _darkTheme);
//   }
//
// }
