import '../../../models/entry_response.dart';

abstract class EntryRepository {
  Future<EntryResponse?> getEntries();
}