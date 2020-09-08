import 'package:flutter/material.dart';
import 'package:flutter_app/staticmap/StaticMapHomePage.dart';

class StaticMapScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Static Map Screen"),
      ),
      body: StaticMapHomePage()
    );
  }
}
