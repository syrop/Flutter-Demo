import 'package:flutter/material.dart';
import 'package:flutter_app/SwitchHomePage.dart';
import 'SwitchHomePageState.dart';

class SwitchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final key = new GlobalKey<SwitchHomePageState>();

    var page = new SwitchHomePage(key: key,);

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
