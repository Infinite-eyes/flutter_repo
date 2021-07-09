

import 'package:flutter/cupertino.dart';
import 'package:stack_over_flow_app/home_bloc.dart';

import 'home_screen.dart';

class HomePage extends StatelessWidget{

  static const String routeName = "/home";

  @override
  Widget build(BuildContext context) {
    var _homeBloc = new HomeBloc();
    return HomeScreen(homeBloc: _homeBloc);
  }
}