import 'package:flutter/material.dart';

class DisplayPage extends StatelessWidget {
  final userName;
  final passWord;
  DisplayPage({Key? key, this.userName, this.passWord}) : super (key: key);
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(color: Colors.white),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("user name : $userName", style: TextStyle(fontSize: 18 ,fontWeight: FontWeight.bold), textAlign: TextAlign.center, textDirection: TextDirection.ltr),
              SizedBox(height: 30),
              Text("password : $passWord", style: TextStyle(fontSize: 18 ,fontWeight: FontWeight.bold), textAlign: TextAlign.center, textDirection: TextDirection.ltr),
            ],
          ),
        ),
      ),
    );
  }
}
