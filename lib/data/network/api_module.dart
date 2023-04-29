import 'package:base_flutter/data/network/api_client.dart';
import 'package:base_flutter/application/base/dio/base_dio.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../injection.dart';

@module
abstract class ApiModule {

  @singleton
  Dio get providerDio => BaseDio().getDio();

  @singleton
  ApiClient get providerApiClient => ApiClient(providerDio, baseUrl: baseUrl);
}
