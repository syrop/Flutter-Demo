import 'package:flutter/material.dart';

class ListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final items = List<ListTile>.generate(100, (i) => ListTile(
      leading: Icon(Icons.map),
      title: Text('Bookmarked Favorite Locations $i'),
    ),);

    return Scaffold(
      appBar: AppBar(
        title: Text("List Screen"),
      ),
      body: ListView(
          children: items,
      ),
    );
  }
}
