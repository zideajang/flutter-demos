import 'package:flutter/material.dart';
import './tut_manager.dart';

void main() => runApp(ZiApp());

class ZiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.deepOrange,
          accentColor: Colors.deepPurple),
      home: Scaffold(
          appBar: AppBar(
            title: Text('ZiApp'),
          ),
          body: TutManager(startingTut: "flutter")),
    );
  }
}
