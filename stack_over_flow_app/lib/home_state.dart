import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'home_model.dart';

@immutable
abstract class HomeState extends Equatable {
  HomeState([Iterable props]) : super(props);

  HomeState getStateCopy();
}

class UnHomeState extends HomeState{

  @override
  String toString() => 'ÚnHomeState';

  @override
  HomeState getStateCopy(){
    return UnHomeState();
  }

}


class InHomeState extends HomeState {

  final QuestionData questionData;

  InHomeState(this.questionData);

  @override
  String toString() => 'InHomeState';

  @override
  HomeState getStateCopy() {
    return InHomeState(questionData);
  }

}

class ErrorHomeState extends HomeState{

  final String errorMessage;

  ErrorHomeState(this.errorMessage);

  @override
  String toString() => 'ErrorHomeState';

  @override
  HomeState getStateCopy() {
    return ErrorHomeState(this.errorMessage);
  }

}