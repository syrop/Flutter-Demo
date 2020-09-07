package com.example.flutter_app

import android.os.BatteryManager
import android.os.Build.VERSION_CODES
import android.os.Bundle
import androidx.annotation.RequiresApi
import io.flutter.app.FlutterActivity
import io.flutter.plugin.common.MethodChannel

@RequiresApi(VERSION_CODES.LOLLIPOP)
class MainActivity : FlutterActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        MethodChannel(flutterView, CHANNEL).setMethodCallHandler { call, result ->
            if (call.method == "getBatteryLevel") {
                val batteryLevel = getBatteryLevel()
                if (batteryLevel != -1) {
                    result.success(batteryLevel)
                }
                else {
                    result.error(
                        "Currently unavailable", "Battery level not available currently.",
                        null,
                    )
                }
            }
            else {
                result.notImplemented()
            }
        }
    }

    private fun getBatteryLevel(): Int {
        val batteryManager = getSystemService(BATTERY_SERVICE) as BatteryManager
        return batteryManager.getIntProperty(BatteryManager.BATTERY_PROPERTY_CAPACITY)
    }

    companion object {
        private const val CHANNEL = "call.flutter.io/battery"
    }
}
