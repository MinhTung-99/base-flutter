
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

class DialogLoading {
  
  DialogLoading._privateConstructor();

  static final DialogLoading _instance = DialogLoading._privateConstructor();

  static DialogLoading get instance => _instance;

  static bool isLoading = false;

  static void showLoading() {
    if (!isLoading) {
      isLoading = true;
      SmartDialog.show(
          clickMaskDismiss: false,
          builder: (_) {
            return const CupertinoActivityIndicator(
              radius: 16,
            );
          },
          maskColor: Colors.black26);
    }
  }

  static void hideLoading() {
    isLoading = false;
    SmartDialog.dismiss();
  }
}