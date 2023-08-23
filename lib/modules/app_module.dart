import 'package:base_flutter/services/repository/realm/reaml_repository.dart';
import 'package:base_flutter/services/service/realm/realm_service.dart';
import 'package:base_flutter/services/service/realm/realm_service_impl.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:realm/realm.dart';
import '../services/repository/entry/entry_repository.dart';
import '../helpers/base/dio/base_dio.dart';
import '../injection.dart';
import '../services/api/api_client.dart';
import '../services/local/realm/realm_table.dart';
import '../services/repository/realm/realm_repository_impl.dart';
import '../services/repository/entry/entry_repository_impl.dart';
import '../services/service/entry/entry_service.dart';
import '../services/service/entry/entry_service_impl.dart';

@module
abstract class AppModule {

  ///REALM
  @singleton
  LocalConfiguration providerLocalConfiguration() =>
      Configuration.local([Profile.schema, Hobby.schema, Sport.schema], schemaVersion: 3);

  @singleton
  Realm get providerRealm => Realm(providerLocalConfiguration());
  ///

  ///DIO
  @singleton
  Dio get providerDio => BaseDio().getDio();
  ///

  ///CLIENT
  @singleton
  ApiClient get providerApiClient => ApiClient(providerDio, baseUrl: baseUrl);
  ///

  /// REPOSITORY
  @singleton
  EntryRepository providerEntryRepository() => EntryRepositoryImpl(providerApiClient);

  @singleton
  RealmRepository providerReamRepository() => RealmRepositoryImpl(providerRealm);
  ///

  /// SERVICES
  @singleton
  EntryService providerEntryService() => EntryServiceImpl();

  RealmService providerRealmService() => RealmServiceImpl();
  ///
}