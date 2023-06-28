import '../network/response/entry/entry_response.dart';

abstract class EntryRepository {
  Future<EntryResponse?> getEntries();
}