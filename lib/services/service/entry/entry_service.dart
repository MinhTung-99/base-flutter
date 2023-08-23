import '../../../models/entry.dart';

abstract class EntryService {
  Future<Entry?> getEntries();
}