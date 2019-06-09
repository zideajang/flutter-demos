import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() => runApp(ZiApp());

class ZiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'List Demo',
      theme: ThemeData(primaryColor: Colors.blue),
      home: ZiHomePage(
        title: 'Users',
      ),
    );
  }
}

class ZiHomePage extends StatefulWidget {
  final String title;
  ZiHomePage({Key key, this.title}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ZiHomePageState();
  }
}

class _ZiHomePageState extends State<ZiHomePage> {
  Future<List<User>> _getUsers() async {
    var data = await http.get('https://jsonplaceholder.typicode.com/users');
    var jsonData = json.decode(data.body);

    List<User> users = [];

    for (var u in jsonData) {
      User user = User(u["id"], u["username"], u["email"]);
      users.add(user);
    }

    print(users.length);
    return users;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        title: Text("List Demo"),
      ),
      body: Container(
        child: FutureBuilder(
          future: _getUsers(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return Container(
                child: Center(
                  child: Text("loading..."),
                ),
              );
            }
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(snapshot.data[index].username),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class User {
  final int id;
  final String username;
  final String email;

  User(this.id, this.username, this.email);
}
