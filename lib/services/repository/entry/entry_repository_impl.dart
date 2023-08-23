
import 'package:base_flutter/services/repository/entry/entry_repositry.dart';

import '../../api/api_client.dart';
import '../../../models/entry.dart';

class EntryRepositoryImpl extends EntryRepository {

  final ApiClient _apiClient;

  EntryRepositoryImpl(this._apiClient);

  @override
  Future<Entry?> getEntries() async {
    return await _apiClient.getEntries();
  }

}