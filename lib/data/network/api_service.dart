
import 'package:base_flutter/data/network/api_client.dart';
import 'package:base_flutter/data/network/response/entry/entry_response.dart';
import 'package:injectable/injectable.dart';

@injectable
class ApiService  {
   final ApiClient _apiClient;

  ApiService(this._apiClient);

  Future<EntryResponse> getEntries() => _apiClient.getEntries();
}