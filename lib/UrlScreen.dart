import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("URL Screen"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () async {
            const url = 'https://flutter.dev';
            if (await canLaunch(url)) {
              await launch(url);
            } else {
              throw 'Sorry, We could not launch the URL $url';
            }
          },
          textColor: Colors.black,
          padding: const EdgeInsets.all(0.0),
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: <Color>[
                  Colors.green, Colors.yellow, Colors.yellowAccent],
              ),
            ),
            padding: const EdgeInsets.all(10.0),
            child: Text('Open Flutter Website'),
          ),
        ),
      ),
    );
  }
}
