package com.develop.base_flutter

import io.flutter.plugin.common.EventChannel

class MySecondEventChannel : EventChannel.StreamHandler {

    override fun onListen(arguments: Any?, events: EventChannel.EventSink?) {
        events?.success("${arguments}_1")
        events?.success("${arguments}_2")
        events?.success("${arguments}_3")
    }

    override fun onCancel(arguments: Any?) {

    }
}