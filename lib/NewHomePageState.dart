import 'package:flutter/material.dart';
import 'NewHomePage.dart';

class NewHomePageState extends State<NewHomePage> {
  bool value = false;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: value ? Colors.black : Colors.white,
      body: Center(
        child: Switch(
            value: value,
            onChanged: (v) {
              setState(() {
                value = v;

              });
            }),
      ),
    );
  }
}
