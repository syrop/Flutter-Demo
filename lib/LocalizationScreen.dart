import 'package:flutter/material.dart';
import 'localization/DemoLocalizations.dart';

class LocalizationsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    var items = List<ListTile>.generate(100, (i) => ListTile(
      leading: Icon(Icons.map),
      title: Text('Bookmarked Favorite Locations $i'),
    ),);
    return Scaffold(
      appBar: AppBar(
        title: Text("Localizations Screen"),
      ),
      body: Center(
        child: Text(
          DemoLocalizations.of(context).title,
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
    );
  }
}
