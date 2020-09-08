import 'package:flutter/material.dart';
import 'package:flutter_app/firestore/FirestoreHomePage.dart';

class FirestoreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Firestore Screen"),
      ),
      body: FirestoreHomePage()
    );
  }
}