import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    
    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

       _methodChannel()
        
       _eventChannel()
       _secondEventChannel()

        GeneratedPluginRegistrant.register(with: self)
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
      }
    
    func _methodChannel() {
        let METHOD_CHANNEL = "METHOD_CHANNEL"
        let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
        let methodChannel = FlutterMethodChannel(name: METHOD_CHANNEL, binaryMessenger: controller.binaryMessenger)
        methodChannel.setMethodCallHandler({
          (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
            switch call.method {
                case "openBrowser":
                    Browser().openBrowser()
                break
                default:
                    result(FlutterMethodNotImplemented)
                break
            }
        })
    }
    
    func _eventChannel() {
        let EVENT_CHANNEL = "EVENT_CHANNEL"
        let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
        let eventChannel = FlutterEventChannel(name: EVENT_CHANNEL, binaryMessenger: controller.binaryMessenger)
        eventChannel.setStreamHandler(MyEventChannel())
    }
    
    func _secondEventChannel() {
        let SECOND_EVENT_CHANNEL = "SECOND_EVENT_CHANNEL"
        let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
        let eventChannel = FlutterEventChannel(name: SECOND_EVENT_CHANNEL, binaryMessenger: controller.binaryMessenger)
        eventChannel.setStreamHandler(MySecondEventChannel())
    }
}
