import Foundation

class MyEventChannel : NSObject, FlutterStreamHandler {
    public func onListen(withArguments arguments: Any?, eventSink events: @escaping FlutterEventSink) -> FlutterError? {
        events("@_1".replacingOccurrences(of: "@", with: arguments as? String ?? "nil"))
        events("@_2".replacingOccurrences(of: "@", with: arguments as? String ?? "nil"))
        events("@_3".replacingOccurrences(of: "@", with: arguments as? String ?? "nil"))
            return nil
        }

    public func onCancel(withArguments arguments: Any?) -> FlutterError? {
        return nil
    }
}
