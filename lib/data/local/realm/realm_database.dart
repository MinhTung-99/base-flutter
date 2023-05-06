import 'package:base_flutter/data/local/realm/realm_table.dart';
import 'package:injectable/injectable.dart';
import 'package:realm/realm.dart';

@injectable
class RealmDatabase {

  final Realm _realm;

  RealmDatabase(this._realm);

  /// PROFILE
  void insertOrUpdateProfile(Profile profile) { // same id then update
    _realm.write(() {
      _realm.add(profile, update: true);
    });
  }

  List<Profile> getProfiles() {

    var profiles = _realm.all<Profile>();

    const name = 'name';
    final profileQueryByName = profiles.query(" name == '$name' ").toList();
    return profileQueryByName;
  }
  ///

}