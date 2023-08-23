import 'package:json_annotation/json_annotation.dart';

import '../../helpers/base/response/base_response.dart';

part 'entry.g.dart';

@JsonSerializable()
class Entry extends BaseResponse {
  int? count;

  Entry({this.count});

  factory Entry.fromJson(Map<String, dynamic> json) => _$EntryFromJson(json);
  Map<String, dynamic> toJson() => _$EntryToJson(this);
}