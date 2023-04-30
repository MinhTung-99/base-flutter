import 'package:base_flutter/application/base/view_model/base_view_model.dart';
import 'package:base_flutter/data/local/shared_preferences/shared_preferences.dart';
import 'package:base_flutter/data/network/api_service.dart';
import 'package:base_flutter/data/network/response/entry/entry_response.dart';
import 'package:base_flutter/injection.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';

import '../../resource/dialog_common.dart';

@injectable
class EntryViewModel extends BaseViewModel {
  final ApiService _apiService;
  final DialogCommon _dialogCommon;

  EntryViewModel(this._apiService, this._dialogCommon);

  Rx<EntryResponse?> entryRx = Rx(null);

  @override
  void onInit() async {
    super.onInit();
    //await _sharedPreference.saveToken(value: 'TOKEN HERE=12333');
    getEntry();
  }

  void showAlertDialog(BuildContext context) {
    _dialogCommon.showAlertDialog(context: context, title: 'ABCCC');
  }

  void getEntry() async{
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
