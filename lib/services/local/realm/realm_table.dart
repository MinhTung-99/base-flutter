
import 'package:realm/realm.dart';
part 'realm_table.g.dart';

@RealmModel()
class _Profile {
  @PrimaryKey()
  late int id;

  String? name;
  String? password;
  _Hobby? hobby;
  List<_Sport> sports = [];
}

@RealmModel()
class _Hobby {
  @PrimaryKey()
  late int id;

  String? name;
}

@RealmModel()
class _Sport {
  @PrimaryKey()
  late int id;

  String? name;
}