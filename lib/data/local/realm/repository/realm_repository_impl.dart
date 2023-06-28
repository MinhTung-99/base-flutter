
import 'package:realm/realm.dart';

import '../../../repository/reaml_repository.dart';
import '../realm_table.dart';

class RealmRepositoryImpl extends RealmRepository {
  final Realm _realm;

  RealmRepositoryImpl(this._realm);

  /// PROFILE
  @override
  void insertOrUpdateProfile(Profile profile) { // same id then update
    _realm.write(() {
      _realm.add(profile, update: true);
    });
  }

  @override
  List<Profile> getProfiles() {

    var profiles = _realm.all<Profile>();

    const name = 'name';
    final profileQueryByName = profiles.query(" name == '$name' ").toList();
    return profileQueryByName;
  }
///
}