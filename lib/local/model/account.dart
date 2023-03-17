import 'package:realm/realm.dart';
part 'account.g.dart';

@RealmModel()
class _Account {

  late String userName;
  late String password;

}