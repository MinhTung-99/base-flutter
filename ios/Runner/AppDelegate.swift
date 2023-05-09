import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
//  override func application(
//    _ application: UIApplication,
//    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
//  ) -> Bool {
//    GeneratedPluginRegistrant.register(with: self)
//    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
//  }
    
    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
        let batteryChannel = FlutterMethodChannel(name: "NATIVE_CODE",
                                                  binaryMessenger: controller.binaryMessenger)
        batteryChannel.setMethodCallHandler({
          (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
          // This method is invoked on the UI thread.
          // Handle battery messages.
            switch call.method {
                case "openBrowser":
                    Browser().openBrowser()
                break
                default:
                    result(FlutterMethodNotImplemented)
                break
            }
        })

        GeneratedPluginRegistrant.register(with: self)
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
      }
}
