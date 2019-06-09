import 'package:flutter/material.dart';

class Tuts extends StatelessWidget {
  final List<String> tuts;

  Tuts([this.tuts = const []]);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: tuts
          .map(
            (tut) => Card(
                  child: Column(
                    children: <Widget>[
                      Image.asset('assets/flutter.jpg'),
                      Text(tut)
                    ],
                  ),
                ),
          )
          .toList(),
    );
  }
}
