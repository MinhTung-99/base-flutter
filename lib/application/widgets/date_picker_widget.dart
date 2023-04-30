
import 'package:flutter/cupertino.dart';

import '../../resource/date_picker/date_local.dart';
import '../../resource/date_picker/date_picker_language.dart';

class DatePickerWidget extends StatelessWidget {

  const DatePickerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _showDatePicker(context);
      },
      child: Text('datePicker'),
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