


import 'package:flutter/cupertino.dart';
import 'package:ui_kit/di/dependency_injection.dart';
import 'package:ui_kit/model/login.dart';
import 'package:ui_kit/model/otp.dart';
import 'package:ui_kit/services/abstract/i_otp_service.dart';
import 'package:ui_kit/services/network_service.dart';
import 'package:ui_kit/services/network_service_response.dart';

class UserLoginViewModel{
  String phonenumber;
  String otp;
  bool otpResult = false;
  NetworkServiceResponse apiResult;
  IOTPService otpRepo = new Injector().otpService;

  UserLoginViewModel({@required this.phonenumber});

  UserLoginViewModel.withOTP({@required this.phonenumber,@required this.otp});

  Future<Null> getOtp(String phoneNumber) async{
    NetworkServiceResponse<CreateOTPResponse> result =
        await otpRepo.createOTP(phoneNumber);

    this.otpResult = result.success;
    this.apiResult = result;
  }


  Future<Null> performLogin(UserLoginViewModel userLogin) async{
    NetworkServiceResponse<OTPResponse> result =
        await otpRepo.fetchOTPLoginResponse(Login(phonenumber: userLogin.phonenumber,otp: userLogin.otp));

    this.apiResult = result;
  }






}