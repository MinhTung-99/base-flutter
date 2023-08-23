
import 'package:base_flutter/injection.dart';
import 'package:base_flutter/models/entry.dart';
import 'package:base_flutter/services/repository/entry/entry_repository.dart';
import 'package:base_flutter/services/service/entry/entry_service.dart';

class EntryServiceImpl extends EntryService {

  final EntryRepository _entryRepository = getIt<EntryRepository>();

  @override
  Future<Entry?> getEntries() async {
    return _entryRepository.getEntries();
  }

}