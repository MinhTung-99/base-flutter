import 'package:json_annotation/json_annotation.dart';

import '../../helpers/base/response/base_response.dart';

part 'entry_response.g.dart';

@JsonSerializable()
class EntryResponse extends BaseResponse {
  int? count;

  EntryResponse({this.count});

  factory EntryResponse.fromJson(Map<String, dynamic> json) => _$EntryResponseFromJson(json);
  Map<String, dynamic> toJson() => _$EntryResponseToJson(this);
}