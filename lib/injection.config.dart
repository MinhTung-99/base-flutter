// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:realm/realm.dart' as _i9;

import 'helpers/base/view_model/base_view_model.dart' as _i4;
import 'helpers/dialog/dialog_common.dart' as _i5;
import 'modules/app_module.dart' as _i12;
import 'services/api/api_client.dart' as _i3;
import 'services/local/shared_preferences/shared_preferences.dart' as _i11;
import 'services/repository/entry/entry_repository.dart' as _i7;
import 'services/repository/realm/reaml_repository.dart' as _i10;
import 'services/service/entry/entry_service.dart' as _i8;

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appModule = _$AppModule();
    gh.singleton<_i3.ApiClient>(appModule.providerApiClient);
    gh.factory<_i4.BaseViewModel>(() => _i4.BaseViewModel());
    gh.factory<_i5.DialogCommon>(() => _i5.DialogCommon());
    gh.singleton<_i6.Dio>(appModule.providerDio);
    gh.singleton<_i7.EntryRepository>(appModule.providerEntryRepository());
    gh.singleton<_i8.EntryService>(appModule.providerEntryService());
    gh.singleton<_i9.LocalConfiguration>(
        appModule.providerLocalConfiguration());
    gh.singleton<_i9.Realm>(appModule.providerRealm);
    gh.singleton<_i10.RealmRepository>(appModule.providerReamRepository());
    gh.factory<_i11.SharedPreference>(() => _i11.SharedPreference());
    return this;
  }
}

class _$AppModule extends _i12.AppModule {}
