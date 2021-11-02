import 'package:flutter/material.dart';
import 'package:comic/app/guide_scene.dart';
import 'package:comic/public.dart';

class AppScene extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'tianyue',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
        dividerColor: Color(0xffeeeeee),
        scaffoldBackgroundColor: TYColor.paper,
        textTheme: TextTheme(bodyText1: TextStyle(color: TYColor.darkGray)),
      ),
      home: GuideScene(),
    );
  }
}
