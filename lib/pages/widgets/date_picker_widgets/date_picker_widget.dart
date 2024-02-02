
import 'package:flutter/material.dart';
import '../button_text_widget.dart';
import 'date_local.dart';
import 'date_picker_language.dart';

class DatePickerWidget extends StatelessWidget {

  const DatePickerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ButtonTextWidget(
        title: 'OPEN DATE PICKER',
        onPressed: () {
          _showDatePicker(context);
        }
    );
  }

}

Future<void> _showDatePicker(BuildContext context) async {
  await DatePicker.showDatePicker(context, showTitleActions: true,
      onChanged: (date) {
        // pickerDate(date);
      }, onConfirm: (date) {

      }, currentTime: DateTime.now(), locale: LocaleType.jp);
}