import 'package:base_flutter/application/base/view_model/base_view_model.dart';
import 'package:base_flutter/data/local/shared_preferences/shared_preferences.dart';
import 'package:base_flutter/data/network/api_service.dart';
import 'package:base_flutter/data/network/response/entry/entry_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';

import '../../application/widgets/drawer_widget.dart';
import '../../application/widgets/dropdown_widget.dart';
import '../../data/local/realm/realm_database.dart';
import '../../data/local/realm/realm_table.dart';
import '../../resource/dialog/dialog_common.dart';

@injectable
class DemoViewModel extends BaseViewModel {
  final ApiService _apiService;
  final DialogCommon _dialogCommon;
  final RealmDatabase _realmDatabase;
  final SharedPreference _sharedPreference;

  DemoViewModel(this._apiService, this._dialogCommon, this._realmDatabase, this._sharedPreference);

  Rx<EntryResponse?> entryRx = Rx(null);

  List<DropDownValueModel> items = [];

  @override
  void onInit() async {
    super.onInit();

    items.add(DropDownValueModel(name: 'ABCCCC', value: 'ABCCBCC'));
    items.add(DropDownValueModel(name: 'ABCCCC1', value: 'ABCCBCC1'));
    items.add(DropDownValueModel(name: 'ABCCCC2', value: 'ABCCBCC2'));
    items.add(DropDownValueModel(name: 'ABCCCC3', value: 'ABCCBCC3'));
    items.add(DropDownValueModel(name: 'ABCCCC4', value: 'ABCCBCC4'));
    items.add(DropDownValueModel(name: 'ABCCCC5', value: 'ABCCBCC5'));
    items.add(DropDownValueModel(name: 'ABCCCC6', value: 'ABCCBCC6'));
    items.add(DropDownValueModel(name: 'ABCCCC7', value: 'ABCCBCC7'));
    items.add(DropDownValueModel(name: 'ABCCCC8', value: 'ABCCBCC8'));
    items.add(DropDownValueModel(name: 'ABCCCC9', value: 'ABCCBCC9'));

    /// SHARED_PREFERENCE
    await _sharedPreference.save(key: 'test', value: 'SAVE LOCAL');
    print('sharedPreference====${await _sharedPreference.get(key: 'test', type: '')}');

    /// API
    //getEntry();

    /// REALM
    //_demoInsertOrUpdateProfile();
    //print('profile====${_realmDatabase.getProfiles()[0].hobby?.name}');
  }

  ///
  void _demoInsertOrUpdateProfile() {
    List<Sport> sports = [];
    sports.add(Sport(1, name: 'Table tennis'));
    _realmDatabase.insertOrUpdateProfile(Profile(1,
        name: 'name',
        password: '1234',
        hobby: Hobby(1, name: 'Sports'),
        sports: sports));
  }

  ///
  void showAlertDialog(BuildContext context) {
    _dialogCommon.showAlertDialog(context: context, title: 'ABCCC');
  }

  void getEntry() async {
    showLoading();
    _apiService.getEntries().then((it) {
      hideLoading();
      entryRx.value = it;
    }).catchError((Object onError) {
      hideLoading();
      switch (onError.runtimeType) {
        case DioError:
          // Here's the sample to get the failed response error code and message
          final res = (onError as DioError).response;
          print("Got error : ${res}");
          break;
        default:
          break;
      }
    });
  }
}
