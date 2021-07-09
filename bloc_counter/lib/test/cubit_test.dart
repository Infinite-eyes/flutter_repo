import 'package:bloc/bloc.dart';
// https://bloclibrary.dev/#/coreconcepts

class CounterCubit extends Cubit<int>{

  CounterCubit() : super(0);

  void increment() {
    addError(Exception('increment error!'),StackTrace.current);
    emit(state + 1);
  }

  @override
  void onChange(Change<int> change) {
    print(change);
    super.onChange(change);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    print('$error,$stackTrace');
    super.onError(error, stackTrace);
  }

}

// void main(){
//   final cubit = CounterCubit();
//   print(cubit.state);
//   cubit.increment();
//   print(cubit.state);
//   cubit.close();
// }

// Future<void> main() async{
//
//   final cubit = CounterCubit();
//   final subscription = cubit.stream.listen(print);
//   cubit.increment();
//
//   await Future.delayed(Duration.zero);
//   await subscription.cancel();
//   await cubit.close();
//
// }
// void main(){
//   CounterCubit()
//       ..increment()
//       ..close();
// }



class SimpleBlocObserver extends BlocObserver{
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    print('${bloc.runtimeType} $change');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    print('${bloc.runtimeType} $error $stackTrace');
    super.onError(bloc, error, stackTrace);
  }
}

// void main(){
//   Bloc.observer = SimpleBlocObserver();
//   CounterCubit()
//   ..increment()
//   ..close()
// }



//状态变化
enum CounterEvent{ increment }

class CounterBloc extends Bloc<CounterEvent,int>{
  
  CounterBloc() : super(0);

  @override
  Stream<int> mapEventToState(CounterEvent event) async* {}


}


