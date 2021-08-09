import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ui_kit/ui/page/home_page.dart';
import 'package:ui_kit/ui/page/notfound/notfound_page.dart';
import 'package:ui_kit/ui/page/timeline/timeline_one_page.dart';
import 'package:ui_kit/ui/profile/profile_one_page.dart';
import 'package:ui_kit/ui/profile/profile_two_page.dart';
import 'package:ui_kit/utils/tanslations.dart';
import 'package:ui_kit/utils/uidata.dart';

import 'di/dependency_injection.dart';
// https://github.com/iampawan/Flutter-UI-Kit

void main() {
  Injector.configure(Flavor.MOCK); //环境切换
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: UIData.appName,
      theme: ThemeData(
          primaryColor: Colors.black,
          fontFamily: UIData.quickFont,
          primarySwatch: Colors.amber),
      debugShowCheckedModeBanner: false,
      showPerformanceOverlay: false,
      home: HomePage(),
      localizationsDelegates: [
        const TranslationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      routes: <String, WidgetBuilder>{
        UIData.homeRoute: (BuildContext context) => HomePage(),
        UIData.profileOneRoute :  (BuildContext context) => ProfileOnePage(),
        UIData.profileTwoRoute: (BuildContext context) => ProfileTwoPage(),
        UIData.timelineOneRoute: (BuildContext context) => TimelineOnePage(),

      },
      onUnknownRoute: (RouteSettings rs) => new MaterialPageRoute(
          builder: (context) => new NotFoundPage(
                appTitle: UIData.coming_soon,
                icon: FontAwesomeIcons.solidSmile,
                title: UIData.coming_soon,
                message: "Under Development",
                iconColor: Colors.green,
              )),
    );
  }
}
