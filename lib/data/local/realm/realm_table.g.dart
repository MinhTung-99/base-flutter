// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'realm_table.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

class Profile extends _Profile with RealmEntity, RealmObjectBase, RealmObject {
  Profile(
    int id, {
    String? name,
    String? password,
    Hobby? hobby,
    Iterable<Sport> sports = const [],
  }) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'name', name);
    RealmObjectBase.set(this, 'password', password);
    RealmObjectBase.set(this, 'hobby', hobby);
    RealmObjectBase.set<RealmList<Sport>>(
        this, 'sports', RealmList<Sport>(sports));
  }

  Profile._();

  @override
  int get id => RealmObjectBase.get<int>(this, 'id') as int;
  @override
  set id(int value) => RealmObjectBase.set(this, 'id', value);

  @override
  String? get name => RealmObjectBase.get<String>(this, 'name') as String?;
  @override
  set name(String? value) => RealmObjectBase.set(this, 'name', value);

  @override
  String? get password =>
      RealmObjectBase.get<String>(this, 'password') as String?;
  @override
  set password(String? value) => RealmObjectBase.set(this, 'password', value);

  @override
  Hobby? get hobby => RealmObjectBase.get<Hobby>(this, 'hobby') as Hobby?;
  @override
  set hobby(covariant Hobby? value) =>
      RealmObjectBase.set(this, 'hobby', value);

  @override
  RealmList<Sport> get sports =>
      RealmObjectBase.get<Sport>(this, 'sports') as RealmList<Sport>;
  @override
  set sports(covariant RealmList<Sport> value) =>
      throw RealmUnsupportedSetError();

  @override
  Stream<RealmObjectChanges<Profile>> get changes =>
      RealmObjectBase.getChanges<Profile>(this);

  @override
  Profile freeze() => RealmObjectBase.freezeObject<Profile>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(Profile._);
    return const SchemaObject(ObjectType.realmObject, Profile, 'Profile', [
      SchemaProperty('id', RealmPropertyType.int, primaryKey: true),
      SchemaProperty('name', RealmPropertyType.string, optional: true),
      SchemaProperty('password', RealmPropertyType.string, optional: true),
      SchemaProperty('hobby', RealmPropertyType.object,
          optional: true, linkTarget: 'Hobby'),
      SchemaProperty('sports', RealmPropertyType.object,
          linkTarget: 'Sport', collectionType: RealmCollectionType.list),
    ]);
  }
}

class Hobby extends _Hobby with RealmEntity, RealmObjectBase, RealmObject {
  Hobby(
    int id, {
    String? name,
  }) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'name', name);
  }

  Hobby._();

  @override
  int get id => RealmObjectBase.get<int>(this, 'id') as int;
  @override
  set id(int value) => RealmObjectBase.set(this, 'id', value);

  @override
  String? get name => RealmObjectBase.get<String>(this, 'name') as String?;
  @override
  set name(String? value) => RealmObjectBase.set(this, 'name', value);

  @override
  Stream<RealmObjectChanges<Hobby>> get changes =>
      RealmObjectBase.getChanges<Hobby>(this);

  @override
  Hobby freeze() => RealmObjectBase.freezeObject<Hobby>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(Hobby._);
    return const SchemaObject(ObjectType.realmObject, Hobby, 'Hobby', [
      SchemaProperty('id', RealmPropertyType.int, primaryKey: true),
      SchemaProperty('name', RealmPropertyType.string, optional: true),
    ]);
  }
}

class Sport extends _Sport with RealmEntity, RealmObjectBase, RealmObject {
  Sport(
    int id, {
    String? name,
  }) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'name', name);
  }

  Sport._();

  @override
  int get id => RealmObjectBase.get<int>(this, 'id') as int;
  @override
  set id(int value) => RealmObjectBase.set(this, 'id', value);

  @override
  String? get name => RealmObjectBase.get<String>(this, 'name') as String?;
  @override
  set name(String? value) => RealmObjectBase.set(this, 'name', value);

  @override
  Stream<RealmObjectChanges<Sport>> get changes =>
      RealmObjectBase.getChanges<Sport>(this);

  @override
  Sport freeze() => RealmObjectBase.freezeObject<Sport>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(Sport._);
    return const SchemaObject(ObjectType.realmObject, Sport, 'Sport', [
      SchemaProperty('id', RealmPropertyType.int, primaryKey: true),
      SchemaProperty('name', RealmPropertyType.string, optional: true),
    ]);
  }
}
