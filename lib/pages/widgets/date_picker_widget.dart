
import 'package:flutter/material.dart';
import '../../helpers/date_picker/date_local.dart';
import '../../helpers/date_picker/date_picker_language.dart';
import 'button_widget.dart';

class DatePickerWidget extends StatelessWidget {

  const DatePickerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ButtonWidget(
        width: 150,
        height: 50,
        radius: 0,
        colorBackground: Colors.blue,
        text: 'OPEN DATE PICKER',
        onTab: () {
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