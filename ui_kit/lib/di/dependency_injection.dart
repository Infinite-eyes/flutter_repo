

import 'package:ui_kit/services/abstract/IOTPService.dart';
import 'package:ui_kit/services/mock/mock_otp_service.dart';

enum Flavor { MOCK, PRO }

class Injector{

  static final Injector _singleton = new Injector._internal();
  static Flavor _flavor;

  static void configure(Flavor flavor) async{
    _flavor = flavor;
  }

  factory Injector() => _singleton;

  Injector._internal();

  IOTPService get otpService{
    switch(_flavor){
      case Flavor.MOCK:
        return MockOTPService();
      default:
        // return OTPS

    }
  }



}
