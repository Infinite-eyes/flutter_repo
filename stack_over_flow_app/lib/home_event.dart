import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:stack_over_flow_app/home_bloc.dart';
import 'package:stack_over_flow_app/home_model.dart';
import 'package:stack_over_flow_app/home_page.dart';
import 'package:stack_over_flow_app/home_provider.dart';
import 'package:stack_over_flow_app/home_state.dart';

@immutable
abstract class HomeEvent{
  Future<HomeState> applyAsync({HomeState currentState,HomeBloc bloc});
  final HomeProvider _homeProvider = new HomeProvider();
}

class LoadHomeEvent extends HomeEvent{

  @override
  String toString() => 'LoadHomeEvent';

  @override
  Future<HomeState> applyAsync({HomeState currentState, HomeBloc bloc}) async{
    try{
      QuestionData res = await _homeProvider.getData();
      return new InHomeState(res);
    }catch(_){
      print('LoadHomeEvent ' + _?.toString());
      return new ErrorHomeState(_?.toString());
    }
  }

}