import 'package:flutter/material.dart';

import './tuts.dart';

class TutManager extends StatefulWidget {
  final String startingTut;

  TutManager({this.startingTut = 'default tut'});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _TutManagerState();
  }
}

class _TutManagerState extends State<TutManager> {
  List<String> _tuts = [];

  @override
  void initState() {
    // TODO: implement initState
    _tuts.add(widget.startingTut);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(10.0),
          child: RaisedButton(
            color: Theme.of(context).primaryColor,
            onPressed: () {
              setState(() {
                _tuts.add("Dart");
              });
            },
            child: Text('Add Tut'),
          ),
        ),
        Tuts(_tuts),
      ],
    );
  }
}
