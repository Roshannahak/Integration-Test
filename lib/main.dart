import 'package:flutter/material.dart';
import 'package:test_app/loginPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Integration test app",
      debugShowCheckedModeBanner: false,  
      home: LogInPage(),
    );
  }
}
