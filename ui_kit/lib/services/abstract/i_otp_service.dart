import 'dart:async';

import 'package:ui_kit/model/login.dart';
import 'package:ui_kit/model/otp.dart';
import '../network_service_response.dart';


abstract class IOTPService {
  Future<NetworkServiceResponse<CreateOTPResponse>> createOTP(String phoneNumber);
  Future<NetworkServiceResponse<OTPResponse>> fetchOTPLoginResponse(Login userLogin);
}