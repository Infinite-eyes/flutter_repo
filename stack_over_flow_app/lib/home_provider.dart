import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:stack_over_flow_app/home_model.dart';

class HomeProvider {

  HomeProvider();

  Future<QuestionData> getData() async {
    var res = await http.get("http://192.168.0.141:8000/stack/questions/?format=json");
    var decodedJson = jsonDecode(res.body);

    QuestionData qd  = QuestionData();
    qd.questions = [];
    for(var json in decodedJson){
      qd.questions.add(Questions.fromJson(json));
    }
    return qd;
  }
}
