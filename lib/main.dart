import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_app/LocalizationScreen.dart';
import 'package:flutter_app/SwitchScreen.dart';
import 'ListScreen.dart';
import 'HttpScreen.dart';
import 'localization/DemoLocalizationsDelegate.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'UrlScreen.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      localizationsDelegates: [
        const DemoLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', ''),
        const Locale('es', ''),
        const Locale('hi', ''),
        const Locale('pl', ''),
      ],
      title: 'Flutter Demo',
      theme: new ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or press Run > Flutter Hot Reload in IntelliJ). Notice that the
        // counter didn't reset back to zero; the application is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: new HomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void showToast(String msg) {
    // https://pub.dev/packages/fluttertoast#-readme-tab-
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return new Scaffold(
      appBar: new AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: new Text(widget.title),
      ),
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
      body: new ListView(
        scrollDirection: Axis.vertical,
        // Column is also layout widget. It takes a list of children and
        // arranges them vertically. By default, it sizes itself to fit its
        // children horizontally, and tries to be as tall as its parent.
        //
        // Invoke "debug paint" (press "p" in the console where you ran
        // "flutter run", or select "Toggle Debug Paint" from the Flutter tool
        // window in IntelliJ) to see the wireframe for each widget.
        //
        // Column has various properties to control how it sizes itself and
        // how it positions its children. Here we use mainAxisAlignment to
        // center the children vertically; the main axis here is the vertical
        // axis because Columns are vertical (the cross axis would be
        // horizontal).
        children: [
          ListTile(
            leading: Icon(Icons.flag),
            title: Text('Switch Screen'),
            onTap: () async {
              final value = await Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SwitchScreen()),
              );
              if (value != null) showToast(value.toString());
            },
          ),
          ListTile(
            leading: Icon(Icons.flag),
            title: Text('List Screen'),
            onTap: () async {
              final value = await Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ListScreen()),
              );
              if (value != null) showToast(value.toString());
            },
          ),
          ListTile(
            leading: Icon(Icons.flag),
            title: Text('HTTP Screen'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HttpScreen()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.flag),
            title: Text('Localizations Screen'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LocalizationsScreen()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.flag),
            title: Text('URL Screen'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => UrlScreen()),
              );
            },
          ),
        ]
      ),
    );
  }
}
