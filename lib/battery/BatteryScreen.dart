import 'package:flutter/material.dart';
import 'BatteryHomePage.dart';

class BatteryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Battery Screen"),
      ),
      body: BatteryHomePage(title: 'Flutter Platform Channel API'),
    );
  }
}
