import 'package:flutter/material.dart';
import 'package:flutter_app/NewHomePage.dart';
import 'NewHomePageState.dart';

class SwitchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final key = new GlobalKey<NewHomePageState>();

    var page = new NewHomePage(key: key,);

    return Scaffold(
        appBar: AppBar(
          title: Text("Switch Screen"),
        ),
        body: new Center(
          child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 200.0,
                  width: 200.0,
                  child: page,
                ),
                new RaisedButton(
                    child: new Text('Return'),
                    onPressed: () {
                      Navigator.pop(context, key.currentState.value);
                    }
                ),
              ]),
        )
    );
  }
}
