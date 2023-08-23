import '../../../models/entry.dart';

abstract class EntryRepository {
  Future<Entry?> getEntries();
}