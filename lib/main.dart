import 'package:flutter/material.dart';
import 'package:flutter_app_newsapi/ui/homepage.dart';

import 'ui/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter API ',
        home: MyHomePage());
  }
}
