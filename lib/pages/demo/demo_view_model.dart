import 'package:base_flutter/injection.dart';
import 'package:base_flutter/services/repository/realm/reaml_repository.dart';
import 'package:base_flutter/services/service/entry/entry_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../helpers/base/view_model/base_view_model.dart';
import '../../helpers/dialog/dialog_common.dart';
import '../../services/local/realm/realm_table.dart';
import '../../services/local/shared_preferences/shared_preferences.dart';
import '../../models/entry.dart';
import '../widgets/dropdown_widget.dart';

class DemoViewModel extends BaseViewModel {
  final EntryService _entryService = getIt<EntryService>();
  final DialogCommon _dialogCommon = getIt<DialogCommon>();
  final RealmRepository _realmRepository = getIt<RealmRepository>();
  final SharedPreference _sharedPreference = getIt<SharedPreference>();

  Rx<Entry?> entryRx = Rx(null);

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
    getEntry();

    /// REALM
    _demoInsertOrUpdateProfile();
    print('profile====${_realmRepository.getProfiles()[0].hobby?.name}');
  }

  ///
  void _demoInsertOrUpdateProfile() {
    List<Sport> sports = [];
    sports.add(Sport(1, name: 'Table tennis'));
    _realmRepository.insertOrUpdateProfile(Profile(1,
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
    _entryService.getEntries().then((it) {
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
