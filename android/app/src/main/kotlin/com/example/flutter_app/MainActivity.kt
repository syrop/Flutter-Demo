package com.example.flutter_app

import android.content.ContextWrapper
import android.content.Intent
import android.content.IntentFilter
import android.os.BatteryManager
import android.os.Build.VERSION
import android.os.Build.VERSION_CODES
import android.os.Bundle
import io.flutter.app.FlutterActivity
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        MethodChannel(flutterView, CHANNEL).setMethodCallHandler { call, result ->
            if (call.method == "getBatteryLevel") {
                val batteryLevel = batteryLevel
                if (batteryLevel != -1) {
                    result.success(batteryLevel)
                } else {
                    result.error(
                        "Currently unavailable", "Battery level not available currently.",
                        null
                    )
                }
            } else {
                result.notImplemented()
            }
        }
    }

    private val batteryLevel: Int
        @androidx.annotation.RequiresApi(VERSION_CODES.ECLAIR)
        get() {
            var phoneBatteryLevel = -1
            phoneBatteryLevel = if (VERSION.SDK_INT >= VERSION_CODES.LOLLIPOP) {
                val batteryManager = getSystemService(BATTERY_SERVICE) as BatteryManager
                batteryManager.getIntProperty(BatteryManager.BATTERY_PROPERTY_CAPACITY)
            } else {
                val intent = ContextWrapper(applicationContext).registerReceiver(
                    null, IntentFilter(Intent.ACTION_BATTERY_CHANGED)
                )
                intent.getIntExtra(BatteryManager.EXTRA_LEVEL, -1) * 100 /
                    intent.getIntExtra(BatteryManager.EXTRA_SCALE, -1)
            }
            return phoneBatteryLevel
        }

    companion object {
        private const val CHANNEL = "call.flutter.io/battery"
    }
}
