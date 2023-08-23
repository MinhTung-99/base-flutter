
import '../../local/realm/realm_table.dart';

abstract class RealmService {
  void insertOrUpdateProfile(Profile profile);
  List<Profile> getProfiles();
}