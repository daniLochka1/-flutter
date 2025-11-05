import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Комогорцев Даниил Александрович'),
          backgroundColor: Colors.blue,
        ),
        body: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Stack(
            children: [
              Container(color: Colors.red, width: 160, height: 160),
              Container(color: Colors.green, width: 120, height: 120),
              Container(color: Colors.blue, width: 80, height: 80),
              Container(color: Colors.yellow, width: 40, height: 40),
            ],
          ),
        ),

        Align(
          alignment: Alignment.topRight,
          child: Stack(
            children: [
              Container(color: Colors.red, width: 160, height: 160),
              Container(color: Colors.green, width: 120, height: 120),
              Container(color: Colors.blue, width: 80, height: 80),
              Container(color: Colors.yellow, width: 40, height: 40),
            ],
          ),
        ),

        Align(
          alignment: Alignment.bottomLeft,
          child: Stack(
            children: [
              Container(color: Colors.red, width: 160, height: 160),
              Container(color: Colors.green, width: 120, height: 120),
              Container(color: Colors.blue, width: 80, height: 80),
              Container(color: Colors.yellow, width: 40, height: 40),
            ],
          ),
        ),

        Align(
          alignment: Alignment.bottomRight,
          child: Stack(
            children: [
              Container(color: Colors.red, width: 160, height: 160),
              Container(color: Colors.green, width: 120, height: 120),
              Container(color: Colors.blue, width: 80, height: 80),
              Container(color: Colors.yellow, width: 40, height: 40),
            ],
          ),
        ),
      ],
    );
  }
}