
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:logger/logger.dart';

/// Status
enum Status {
  ///
  normal,

  ///
  loading,

  ///
  success,

  ///
  error
}

/// ViewModelBase
abstract class ViewModelBase extends GetxController {
  /// subscription
  // late StreamSubscription<ConnectivityResult> subscription;

  /// logger
  final logger = Logger();

  /// status
  final status = Status.normal.obs;

  /// listenConnectivityStatus
  void listenConnectivityStatus() {
    // subscription =
    //     Connectivity().onConnectivityChanged.listen(_updateConnectionStatus);
  }

  /// cancelConnectivitySubscription
  void cancelConnectivitySubscription() {
    // subscription.cancel();
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    switch (result) {
      case ConnectivityResult.wifi:
        onConnected();
        logger.d('ConnectivityResult.wifi');
        break;

      case ConnectivityResult.mobile:
        logger.d('ConnectivityResult.mobile');
        onConnected();
        break;

      case ConnectivityResult.none:
        logger.d('ConnectivityResult.none');
        onDisconnect();
        break;
      case ConnectivityResult.bluetooth:
      // TODO: Handle this case.
        break;
      case ConnectivityResult.ethernet:
      // TODO: Handle this case.
        break;
      case ConnectivityResult.vpn:
      // TODO: Handle this case.
        break;
    }
  }

  /// onInitView
  void onInitView() {}

  /// onDisposeView
  void onDisposeView() {}

  /// onConnected
  void onConnected() {}

  /// onDisconnect
  void onDisconnect() {}
}

/// Connection status check result.
enum ConnectivityResult {
  /// Bluetooth: Device connected via bluetooth
  bluetooth,

  /// WiFi: Device connected via Wi-Fi
  wifi,

  /// Ethernet: Device connected to ethernet network
  ethernet,

  /// Mobile: Device connected to cellular network
  mobile,

  /// None: Device not connected to any network
  none,

  /// VPN: Device connected to a VPN
  vpn
}
