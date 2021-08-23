

import 'package:ui_kit/services/restclient.dart';

abstract class NetworkService{
  RestClient rest;
  NetworkService(this.rest);
}