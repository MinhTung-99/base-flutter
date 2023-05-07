package com.develop.base_flutter

import android.os.Bundle
import android.os.PersistableBundle
import androidx.annotation.NonNull
import com.browser.BrowserSDK
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {

    private val CHANNEL = "NATIVE_CODE"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler {
                call, result ->
            when(call.method) {
                "openBrowser" -> {
                    BrowserSDK.Builder().openBrowser("https://www.google.com/", this)
                }
            }
        }
    }
}
