
import '../local/realm/realm_table.dart';

abstract class RealmRepository {
  void insertOrUpdateProfile(Profile profile);
  List<Profile> getProfiles();
}