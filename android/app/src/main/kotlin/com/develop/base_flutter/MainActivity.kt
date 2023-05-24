package com.develop.base_flutter

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        methodChannel(flutterEngine)

        eventChannel(flutterEngine)
        secondEventChannel(flutterEngine)
    }

    private fun methodChannel(flutterEngine: FlutterEngine) {
        val METHOD_CHANNEL = "METHOD_CHANNEL"
        val methodChannel = MethodChannel(flutterEngine.dartExecutor.binaryMessenger, METHOD_CHANNEL)

        methodChannel.setMethodCallHandler {
                call, result ->
            when(call.method) {
                "openBrowser" -> {
                    Browser().openBrowser("https://www.google.com/", this)
                }
            }
        }
    }

    private fun eventChannel(flutterEngine: FlutterEngine) {
        val EVENT_CHANNEL = "EVENT_CHANNEL"
        val eventChannel = EventChannel(flutterEngine.dartExecutor.binaryMessenger, EVENT_CHANNEL)
        eventChannel.setStreamHandler(MyEventChannel())
    }

    private fun secondEventChannel(flutterEngine: FlutterEngine) {
        val SECOND_EVENT_CHANNEL = "SECOND_EVENT_CHANNEL"
        val secondEventChannel = EventChannel(flutterEngine.dartExecutor.binaryMessenger, SECOND_EVENT_CHANNEL)
        secondEventChannel.setStreamHandler(MySecondEventChannel())
    }
}
