import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../helpers/base/dio/base_dio.dart';
import '../../injection.dart';
import '../api/api_client.dart';
import '../repository/entry/entry_repository.dart';
import '../repository/entry/entry_repository_impl.dart';
import '../service/entry/entry_service.dart';
import '../service/entry/entry_service_impl.dart';

@module
abstract class AppModule {

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

  /// SERVICES
  @singleton
  EntryService providerEntryService() => EntryServiceImpl();
}