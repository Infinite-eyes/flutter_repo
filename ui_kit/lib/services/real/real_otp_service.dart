import 'package:ui_kit/model/login.dart';
import 'package:ui_kit/model/otp.dart';
import 'package:ui_kit/services/abstract/i_otp_service.dart';
import 'package:ui_kit/services/network_service_response.dart';
import 'package:ui_kit/services/restclient.dart';
import 'package:ui_kit/utils/uidata.dart';

import '../network_service.dart';

class OTPService extends NetworkService implements IOTPService {

  static const _kCreateOtpUrl = "/createOtpForUser/{1}";
  static const _kUserOtpLogin = "/userotplogin";

  OTPService(RestClient rest) : super(rest);

  @override
  Future<NetworkServiceResponse<CreateOTPResponse>> createOTP(
      String phoneNumber) async {
    var result = await rest.getAsync<CreateOTPResponse>(Uri.parse(_kCreateOtpUrl.replaceFirst("{1}", phoneNumber)).toString());

    if(result.mappedResult != null){
      var res = CreateOTPResponse.fromJson(result.mappedResult);
      return new NetworkServiceResponse(
        content: res,
        success: result.networkServiceResponse.success
      );
    }

    return new NetworkServiceResponse(
      success: result.networkServiceResponse.success,
      message: result.networkServiceResponse.message
    );
  }

  @override
  Future<NetworkServiceResponse<OTPResponse>> fetchOTPLoginResponse(
      Login userLogin) async{

    var result = await rest.postAsync<OTPResponse>(_kUserOtpLogin,userLogin);


   if(result.mappedResult != null){
     var res = OTPResponse.fromJson(result.mappedResult);
      return new NetworkServiceResponse(
        content: res,
        success: result.networkServiceResponse.success,
      );
   }
   return new NetworkServiceResponse(
     success: result.networkServiceResponse.success,
     message: result.networkServiceResponse.message
   );


  }


}