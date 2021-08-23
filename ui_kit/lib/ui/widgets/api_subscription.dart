

import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ui_kit/model/fetch_process.dart';
import 'package:ui_kit/utils/uidata.dart';

import 'common_dialogs.dart';

apiSubscription(Stream<FetchProcess> apiResult,BuildContext context){

  apiResult.listen((FetchProcess p){
    if(p.loading){
      showProgress(context);
    }else{
      hideProgress(context);
      if(p.response.success == false){
        fetchApiResult(context, p.response);
      }else{
        switch(p.type){
          case ApiType.performLogin:
            showSuccess(context, UIData.success, FontAwesomeIcons.check);
            break;
          case ApiType.getProductInfo:
            break;

          case ApiType.performOTP:
            break;
        }
      }
    }
  });
}