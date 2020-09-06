import 'package:flutter/material.dart';
import 'localization/DemoLocalizations.dart';

class LocalizationsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(DemoLocalizations.of(context).title),
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
