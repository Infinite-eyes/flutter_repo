// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.


import 'package:bloc_counter/test/counter_bloc_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {

  group('CounterBloc',(){
     CounterBloc counterBloc;

     setUp((){
       counterBloc = CounterBloc();
     });

     test('ínitial state is 0',(){
       expect(counterBloc.state,0);
     });

    blocTest(
      'emits [1] when CounterEvent.increment is added',
      build: ()=> counterBloc,
      act: (bloc) => bloc.add(CounterEvent.increment),
      expect:()=>[1],
    );

    blocTest(
      'emits [-1] when COunterEvent.decrement is added',
      build: ()=> counterBloc,
      act: (bloc) => bloc.add(CounterEvent.decrement),
      expect: ()=>[-1],
    );

  });


}
