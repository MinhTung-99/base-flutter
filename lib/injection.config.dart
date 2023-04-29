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

import 'application/base/view_model/base_view_model.dart' as _i5;
import 'data/local/shared_preferences/shared_preferences.dart' as _i8;
import 'data/network/api_client.dart' as _i3;
import 'data/network/api_module.dart' as _i9;
import 'data/network/api_service.dart' as _i4;
import 'view/entry/entry_view_model.dart' as _i7;

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
    gh.singleton<_i3.ApiClient>(apiModule.providerApiClient);
    gh.factory<_i4.ApiService>(() => _i4.ApiService(gh<_i3.ApiClient>()));
    gh.factory<_i5.BaseViewModel>(() => _i5.BaseViewModel());
    gh.singleton<_i6.Dio>(apiModule.providerDio);
    gh.factory<_i7.EntryViewModel>(
        () => _i7.EntryViewModel(gh<_i4.ApiService>()));
    gh.factory<_i8.SharedPreference>(() => _i8.SharedPreference());
    return this;
  }
}

class _$ApiModule extends _i9.ApiModule {}
