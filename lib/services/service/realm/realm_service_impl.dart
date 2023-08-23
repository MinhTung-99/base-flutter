
import 'package:base_flutter/injection.dart';
import 'package:base_flutter/services/local/realm/realm_table.dart';
import 'package:base_flutter/services/repository/realm/reaml_repository.dart';
import 'package:base_flutter/services/service/realm/realm_service.dart';

class RealmServiceImpl extends RealmService {

  final RealmRepository _realmRepository = getIt<RealmRepository>();

  @override
  List<Profile> getProfiles() {
    return _realmRepository.getProfiles();
  }

  @override
  void insertOrUpdateProfile(Profile profile) {
    _realmRepository.insertOrUpdateProfile(profile);
  }

}