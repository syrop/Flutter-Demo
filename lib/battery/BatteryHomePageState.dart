import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'BatteryHomePage.dart';

class BatteryHomePageState extends State<BatteryHomePage> {

  static const platform = const MethodChannel('call.flutter.io/battery');
  String batteryLevel = 'Battery Levels are Unknown';

  Future<void> getPhoneBatteryLevel() async {
    String localBatteryLevel;
    try {
      final int result = await platform.invokeMethod('getBatteryLevel');
      localBatteryLevel = 'Battery level at $result % .';
    } on PlatformException catch (e) {
      localBatteryLevel = "Failed to get battery level: '${e.message}'.";
    }

    setState(() {
      batteryLevel = localBatteryLevel;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Text ("Click the button to know your phone battery levels"),
            RaisedButton(
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: <Color>[Colors.red, Colors.green, Colors.brown],
                  ),
                ),
                padding: const EdgeInsets.all(10.0),
                child: Text('Get Phone Battery Level'),
              ),
              onPressed: getPhoneBatteryLevel,
              textColor: Colors.white,
              padding: const EdgeInsets.all(0.0),

            ),
            Text(batteryLevel),

          ],
        ),
      ),
    );
  }
}