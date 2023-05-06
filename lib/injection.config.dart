// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i7;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:realm/realm.dart' as _i8;

import 'application/base/view_model/base_view_model.dart' as _i5;
import 'data/local/realm/realm_database.dart' as _i9;
import 'data/local/realm/realm_module.dart' as _i13;
import 'data/local/shared_preferences/shared_preferences.dart' as _i10;
import 'data/network/api_client.dart' as _i3;
import 'data/network/api_module.dart' as _i12;
import 'data/network/api_service.dart' as _i4;
import 'resource/dialog_common.dart' as _i6;
import 'view/demo/demo_view_model.dart' as _i11;

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
    final apiModule = _$ApiModule();
    final realmModule = _$RealmModule();
    gh.singleton<_i3.ApiClient>(apiModule.providerApiClient);
    gh.factory<_i4.ApiService>(() => _i4.ApiService(gh<_i3.ApiClient>()));
    gh.factory<_i5.BaseViewModel>(() => _i5.BaseViewModel());
    gh.factory<_i6.DialogCommon>(() => _i6.DialogCommon());
    gh.singleton<_i7.Dio>(apiModule.providerDio);
    gh.singleton<_i8.LocalConfiguration>(
        realmModule.providerLocalConfiguration());
    gh.singleton<_i8.Realm>(realmModule.providerRealm());
    gh.factory<_i9.RealmDatabase>(() => _i9.RealmDatabase(gh<_i8.Realm>()));
    gh.factory<_i10.SharedPreference>(() => _i10.SharedPreference());
    gh.factory<_i11.DemoViewModel>(() => _i11.DemoViewModel(
          gh<_i4.ApiService>(),
          gh<_i6.DialogCommon>(),
          gh<_i9.RealmDatabase>(),
        ));
    return this;
  }
}

class _$ApiModule extends _i12.ApiModule {}

class _$RealmModule extends _i13.RealmModule {}
