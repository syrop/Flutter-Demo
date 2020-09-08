import 'package:flutter/material.dart';
import 'localization/WiktorLocalizations.dart';

class LocalizedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(WiktorLocalizations.of(context).title),
      ),
      body: Center(
        child: Text(
          WiktorLocalizations.of(context).title,
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
    );
  }
}
