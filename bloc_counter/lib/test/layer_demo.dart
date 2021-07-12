import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';


//data
class RawData {}

class DataProvider {
  Future<RawData> readData() async {}
}

class Repository {
  final DataProvider dataProviderA;
  final DataProvider dataProviderB;

  Repository(this.dataProviderA, this.dataProviderB);

  Future<RawData> getAllDateThatMeetsRequirements() async {
    final RawData dataSetA = await dataProviderA.readData();
    final RawData dataSetB = await dataProviderB.readData();

    // final Data filteredData = _filterData(dataSetA, dataSetB);
    // return filteredData;

    return dataSetA;
  }
}

enum MyEvent {
  AppStarted,
}

abstract class MyState extends Equatable {
  const MyState();
}
class Success extends MyState{

  final String property;

  const Success(this.property);

  @override
  List<Object> get props => [property];
}

class Failure extends MyState{

  final String property;

  const Failure(this.property);

  @override
  List<Object> get props => [property];
}


//bloc
class BusinessLogicComponent extends Bloc<MyEvent, MyState> {
  final Repository repository;

  BusinessLogicComponent(MyState initialState, this.repository)
      : super(initialState);

  @override
  Stream<MyState> mapEventToState(MyEvent event) async* {
    // if(event is MyEvent.AppStarted){
    //   final data = await repository.getAllDataThatMeetsRequirements()
    // }
    //  if (event is AppStarted) {
    //    try {
    //      final data = await repository.getAllDataThatMeetsRequirements();
    //      yield Success(data);
    //    } catch (error) {
    //      yield Failure(error);
    //    }
    //  }
  }
}

class OtherBloc extends Bloc {
  OtherBloc(initialState) : super(initialState);

  @override
  Stream mapEventToState(event) {
    // TODO: implement mapEventToState
    throw UnimplementedError();
  }
}

class MyBloc extends Bloc {
  final OtherBloc otherBloc;
  StreamSubscription otherBlocSubscription;

  MyBloc(this.otherBloc) : super(null) {
    otherBlocSubscription = otherBloc.listen((state) {
      // React to state changes here.
      // Add events here to trigger changes in MyBloc.
    });
  }

  @override
  Stream mapEventToState(event) {
    // TODO: implement mapEventToState
    throw UnimplementedError();
  }

  Future<void> close() {
    otherBlocSubscription.cancel();
    return super.close();
  }
}

class PresentationComponent{
  final Bloc bloc;

  PresentationComponent(this.bloc){
    // bloc.add(AppStarted());
  }


  build(){

  }

}
