import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _nameController = TextEditingController();
  var result;

  predictGender(String name) async {
    var res = await http.get(Uri.parse("https://api.genderize.io/?name=$name"));
    var body = jsonDecode(res.body);

    result = "Gender: ${body['gender']},Probability: ${body['probability']}";
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gender Predictor"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              "Enter a name to predict it‘s gender",
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: TextField(
                controller: _nameController,
                decoration: InputDecoration(hintText: "Name"),
              ),
            ),
            RaisedButton(
              onPressed: () => predictGender(_nameController.text),
              child: Text("Predict"),
            ),
            if (result != null) Text(result)
          ],
        ),
      ),
    );
  }
}
