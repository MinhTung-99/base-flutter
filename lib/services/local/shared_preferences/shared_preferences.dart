import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../config/constants.dart';

@injectable
class SharedPreference {
  Future<void> save({required String key, required dynamic value}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (value is String) {
      prefs.setString(key, value);
    }
  }

  Future<dynamic> get({required String key, required dynamic type}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (prefs.containsKey(key)) {
      if (type is String) {
        return prefs.getString(key);
      }
    }

    return '';
  }

  Future<void> saveToken({required dynamic value}) async {
    await save(key: TOKEN , value: value);
  }

  Future<String> getToken() async {
    return await get(key: TOKEN, type: '');
  }
}
