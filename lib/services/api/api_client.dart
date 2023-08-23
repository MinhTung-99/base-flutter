
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../../models/entry_response.dart';

part 'api_client.g.dart';

@RestApi()
abstract class ApiClient {

  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @GET("/entries") Future<EntryResponse?> getEntries();
}