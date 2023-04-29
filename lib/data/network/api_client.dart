
import 'package:base_flutter/data/network/response/entry/entry_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'api_client.g.dart';

@RestApi()
abstract class ApiClient {

  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @GET("/entries") Future<EntryResponse> getEntries();
}