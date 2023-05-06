import 'package:base_flutter/data/local/realm/realm_table.dart';
import 'package:injectable/injectable.dart';
import 'package:realm/realm.dart';

@module
abstract class RealmModule {
  @singleton
  LocalConfiguration providerLocalConfiguration() =>
      Configuration.local([Profile.schema, Hobby.schema, Sport.schema], schemaVersion: 3);

  @singleton
  Realm providerRealm() => Realm(providerLocalConfiguration());
}
