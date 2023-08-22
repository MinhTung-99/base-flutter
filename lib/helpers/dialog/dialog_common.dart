import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';
import 'dialog_component.dart';
import '../../pages/widgets/button_widget.dart';

@injectable
class DialogCommon {

  Future<void> showAlertDialog({
    required BuildContext context,
    required String title,
    Color textColor = const Color(0xFF333333),
    Function()? close,
    String closeText = '閉じる',
    double marginBottom = 0,
  }) async {
    await showDialog(
      context: context,
      barrierColor: const Color(0xFF000000).withOpacity(0.5),
      builder: (context) => Container(
        margin: EdgeInsets.only(bottom: marginBottom),
        child: DialogComponent(
          marginToCloseButton: 20,
          marginToBottomMobile: 20,
          marginToBottomTablet: 32,
          child: Column(
            children: [
              _titleWidget(title),
              _marginWidget(context),
              _closeWidget(context: context, text: closeText, close: close)
            ],
          ),
        ),
      ),
    );
  }

  ///
  Widget _closeWidget({required BuildContext context, required String text, required Function()? close}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: _buttonWidget(context: context, text: text, onTab: close),
        ),
      ],
    );
  }

  ///
  Widget _marginWidget(BuildContext context) {
    return const SizedBox(
      height: 28,
    );
  }

  ///
  Widget _titleWidget(String title) {
    return Text(
      title,
      textAlign: TextAlign.center,
    );
  }

  ///
  double _getWith(BuildContext context) {
    return double.infinity;
  }

  ///
  Widget _buttonWidget({required BuildContext context, required String text, required Function()? onTab}) {
    return ButtonWidget(
        width: _getWith(context),
        height: 52,
        radius: 26,
        colorBackground:Colors.white,
        colorBorder: const Color(0xFF007AFF),
        text: text,
        widthBorder: 0.7,
        onTab: () {
          Get.back();
          onTab?.call();
        });
  }
}