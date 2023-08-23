
import 'package:base_flutter/services/repository/entry/entry_repositry.dart';

import '../../api/api_client.dart';
import '../../../models/entry_response.dart';

class EntryRepositoryImpl extends EntryRepository {

  final ApiClient _apiClient;

  EntryRepositoryImpl(this._apiClient);

  @override
  Future<EntryResponse?> getEntries() async {
    return await _apiClient.getEntries();
  }

}