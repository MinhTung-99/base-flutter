
import 'package:base_flutter/data/local/realm/repository/realm_repository_impl.dart';
import 'package:base_flutter/data/network/repository/entry_repository_impl.dart';
import 'package:base_flutter/data/repository/reaml_repository.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:realm/realm.dart';

import '../application/base/dio/base_dio.dart';
import '../data/local/realm/realm_table.dart';
import '../data/network/api/api_client.dart';
import '../data/repository/entry_repositry.dart';
import '../injection.dart';

@module
abstract class AppModule {

  ///REALM
  @singleton
  LocalConfiguration providerLocalConfiguration() =>
      Configuration.local([Profile.schema, Hobby.schema, Sport.schema], schemaVersion: 3);

  @singleton
  Realm get providerRealm => Realm(providerLocalConfiguration());

  ///DIO
  @singleton
  Dio get providerDio => BaseDio().getDio();

  ///CLIENT
  @singleton
  ApiClient get providerApiClient => ApiClient(providerDio, baseUrl: baseUrl);

  /// REPOSITORY
  @singleton
  EntryRepository providerEntryRepository() => EntryRepositoryImpl(providerApiClient);

  @singleton
  RealmRepository providerReamRepository() => RealmRepositoryImpl(providerRealm);
}