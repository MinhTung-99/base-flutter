
import 'package:base_flutter/data/network/response/entry/entry_response.dart';
import 'package:base_flutter/data/repository/entry_repositry.dart';

import '../api/api_client.dart';

class EntryRepositoryImpl extends EntryRepository {

  final ApiClient _apiClient;

  EntryRepositoryImpl(this._apiClient);

  @override
  Future<EntryResponse?> getEntries() async {
    return await _apiClient.getEntries();
  }

}