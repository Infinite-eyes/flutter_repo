import 'package:bloc/bloc.dart';
// https://bloclibrary.dev/#/

//v1 cubit
// class CounterCubit extends Cubit<int> {
//   CounterCubit(int initialState) : super(initialState);
// }
//
// void cubitTest1(){
//   final cubitA = CounterCubit(0); // state starts at 0
//   final cubitB = CounterCubit(10); // state starts at 10
// }

//v2
// class CounterCubit extends Cubit<int> {
//   CounterCubit() : super(0);
//
//   void increment() => emit(state + 1);
// }
// void cubitTest2() {
//   final cubit = CounterCubit();
//   print(cubit.state); // 0
//   cubit.increment();
//   print(cubit.state); // 1
//   cubit.close();
// }
//
// Future<void> cubitTest3() async{
//   final cubit = CounterCubit();
//   final subscription = cubit.stream.listen(print);
//   cubit.increment();
//   await Future.delayed(Duration.zero);
//   await subscription.cancel();
//   await cubit.close();
// }

//v3
// class CounterCubit extends Cubit<int> {
//   CounterCubit() : super(0);
//
//   void increment() => emit(state + 1);
//
//   @override
//   void onChange(Change<int> change) {
//     print(change);
//     super.onChange(change);
//   }
// }
//
// void cubitTest4() {
//   CounterCubit()
//     ..increment()
//     ..close();
// }
//
// class SimpleBlocObserver extends BlocObserver {
//   void onChange(BlocBase bloc, Change change) {
//     super.onChange(bloc, change);
//     print('${bloc.runtimeType} $change');
//   }
// }
//
// void cubitTest5() {
//   Bloc.observer = SimpleBlocObserver();
//   CounterCubit()
//     ..increment()
//     ..close();
// }

// v4
// class CounterCubit extends Cubit<int> {
//   CounterCubit() : super(0);
//
//   void increment() {
//     addError(Exception('increment error!'), StackTrace.current);
//   }
//
//   @override
//   void onChange(Change<int> change) {
//       super.onChange(change);
//       print(change);
//   }
//
//   @override
//   void onError(Object error, StackTrace stackTrace) {
//     print('$error, $stackTrace');
//     super.onError(error, stackTrace);
//   }
// }
//
//
// class SimpleBlocObserver extends BlocObserver{
//
//   @override
//   void onChange(BlocBase bloc,Change change){
//     super.onChange(bloc, change);
//     print("${bloc.runtimeType} $change");
//   }
//
//   @override
//   void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
//     print('${bloc.runtimeType} $error $stackTrace');
//     super.onError(bloc, error, stackTrace);
//   }
// }
//
// void cubitTest6() {
//   Bloc.observer = SimpleBlocObserver();
//   CounterCubit()
//     ..increment()
//     ..close();
// }

//v5  bloc

// enum CounterEvent { increment }
//
//
// class CounterBloc extends Bloc<CounterEvent, int> {
//   CounterBloc() : super(0);
//
//   @override
//   Stream<int> mapEventToState(CounterEvent event) async* {
//     switch (event) {
//       case CounterEvent.increment:
//         yield state + 1;
//         break;
//     }
//   }
// }
// Future<void> blocTest1() async{
//   final bloc = CounterBloc();
//   print(bloc.state);
//
//   bloc.add(CounterEvent.increment);
//   await Future.delayed(Duration.zero);
//   print(bloc.state);
//   await bloc.close();
// }
//
// Future<void> blocTest2() async{
//   final bloc = CounterBloc();
//   final subscription = bloc.stream.listen(print);
//   bloc.add(CounterEvent.increment);
//   await Future.delayed(Duration.zero); //避免立即取消订阅。
//   await subscription.cancel();
//   await bloc.close();
// }

//v6
// enum CounterEvent { increment }
//
// class CounterBloc extends Bloc<CounterEvent, int> {
//   CounterBloc() : super(0);
//
//   @override
//   Stream<int> mapEventToState(CounterEvent event) async* {
//     switch (event) {
//       case CounterEvent.increment:
//         yield state + 1;
//         break;
//     }
//   }
//
//   @override
//   void onChange(Change<int> change) {
//     print(change);
//     super.onChange(change);
//   }
// }
//
// void blocTest3() { // Observing a Bloc
//   CounterBloc()
//     ..add(CounterEvent.increment)
//     ..close();
// }

//v7
// enum CounterEvent { increment }
//
// class CounterBloc extends Bloc<CounterEvent, int> {
//   CounterBloc() : super(0);
//
//   @override
//   Stream<int> mapEventToState(CounterEvent event) async* {
//     switch (event) {
//       case CounterEvent.increment:
//         yield state + 1;
//         break;
//     }
//   }
//
//   @override
//   void onChange(Change<int> change) {
//     print(change);
//     super.onChange(change);
//   }
//
//   @override
//   void onTransition(Transition<CounterEvent, int> transition) {
//     super.onTransition(transition);
//     print(transition);
//   }
//
// }
//
// void blocTest4() {
//   // Observing a Bloc
//   CounterBloc()
//     ..add(CounterEvent.increment)
//     ..close();
// }

//v8
// enum CounterEvent { increment }
//
// class CounterBloc extends Bloc<CounterEvent, int> {
//   CounterBloc() : super(0);
//
//   @override
//   Stream<int> mapEventToState(CounterEvent event) async* {
//     switch (event) {
//       case CounterEvent.increment:
//         yield state + 1;
//         break;
//     }
//   }
//
//   @override
//   void onChange(Change<int> change) {
//     print(change);
//     super.onChange(change);
//   }
//
//   @override
//   void onTransition(Transition<CounterEvent, int> transition) {
//     super.onTransition(transition);
//     print(transition);
//   }
// }
// class SimpleBlocObserver extends BlocObserver{
//
//   @override
//   void onChange(BlocBase bloc, Change change) {
//     super.onChange(bloc, change);
//     print('${bloc.runtimeType} $change');
//   }
//
//   @override
//   void onTransition(Bloc bloc, Transition transition) {
//     super.onTransition(bloc, transition);
//     print('${bloc.runtimeType} $transition');
//   }
//
//   @override
//   void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
//     print('${bloc.runtimeType} $error $stackTrace');
//     super.onError(bloc, error, stackTrace);
//   }
// }
//
//
// void blocTest5() {
//   Bloc.observer = SimpleBlocObserver();
//   CounterBloc()
//     ..add(CounterEvent.increment)
//     ..close();
// }

//v9
//
// enum CounterEvent { increment }
//
// class CounterBloc extends Bloc<CounterEvent, int> {
//   CounterBloc() : super(0);
//
//   @override
//   Stream<int> mapEventToState(CounterEvent event) async* {
//     switch (event) {
//       case CounterEvent.increment:
//         yield state + 1;
//         break;
//     }
//   }
//
//   @override
//   void onEvent(CounterEvent event) {
//     super.onEvent(event);
//     print(event);
//   }
//
//   @override
//   void onChange(Change<int> change) {
//     print(change);
//     super.onChange(change);
//   }
//
//   @override
//   void onTransition(Transition<CounterEvent, int> transition) {
//     super.onTransition(transition);
//     print(transition);
//   }
// }
//
// class SimpleBlocObserver extends BlocObserver {
//   @override
//   void onEvent(Bloc bloc, Object event) {
//     super.onEvent(bloc, event);
//     print('${bloc.runtimeType} $event');
//   }
//
//   @override
//   void onChange(BlocBase bloc, Change change) {
//     super.onChange(bloc, change);
//     print('${bloc.runtimeType} $change');
//   }
//
//   @override
//   void onTransition(Bloc bloc, Transition transition) {
//     super.onTransition(bloc, transition);
//     print('${bloc.runtimeType} $transition');
//   }
//
//   @override
//   void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
//     print('${bloc.runtimeType} $error $stackTrace');
//     super.onError(bloc, error, stackTrace);
//   }
// }
//
// void blocTest6() {
//   Bloc.observer = SimpleBlocObserver();
//   CounterBloc()
//     ..add(CounterEvent.increment)
//     ..close();
// }

//v10
// enum CounterEvent {increment}
// class CounterBloc extends Bloc<CounterEvent,int>{
//
//   CounterBloc():super(0);
//
//   @override
//   Stream<int> mapEventToState(CounterEvent event) async*  {
//     switch(event){
//       case CounterEvent.increment:
//         addError(Exception('increment error!'),StackTrace.current);
//         yield state + 1;
//         break;
//     }
//   }
//
//   @override
//   void onChange(Change<int> change) {
//     super.onChange(change);
//     print(change);
//   }
//
//   @override
//   void onTransition(Transition<CounterEvent, int> transition) {
//     super.onTransition(transition);
//     print(transition);
//   }
//
//   @override
//   void onError(Object error, StackTrace stackTrace) {
//     print('$error,$stackTrace');
//     super.onError(error, stackTrace);
//   }
//
//
//   @override
//   Stream<Transition<CounterEvent, int>> transformEvents(Stream<CounterEvent> events, transitionFn) {
//     return super.transformEvents(events, transitionFn);
//   }
//
// }
// void blocTest7() {
//   // Bloc.observer = SimpleBlocObserver();
//   CounterBloc()
//     ..add(CounterEvent.increment)
//     ..close();
// }
