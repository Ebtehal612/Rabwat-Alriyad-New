import 'package:json_annotation/json_annotation.dart';

class ToNullableNumConvertor implements JsonConverter<num?, Object?> {
  const ToNullableNumConvertor();

  @override
  num? fromJson(Object? json) {
    if (json is String) {
      return num.tryParse(json);
    }
    if (json is num) return json;
    return null;
  }

  @override
  Object? toJson(num? object) => object;
}

class ToNumConvertor implements JsonConverter<num, Object?> {
  const ToNumConvertor();

  @override
  num fromJson(Object? json) {
    if (json is String) {
      return num.tryParse(json) ?? 0;
    }
    if (json is num) return json;
    return 0;
  }

  @override
  Object? toJson(num object) => object;
}

class IntToBoolConvertor implements JsonConverter<bool, Object?> {
  const IntToBoolConvertor();

  @override
  bool fromJson(Object? json) =>
      json == 1 ||
      json == '1' ||
      json == true ||
      json.toString().toLowerCase() == 'true';

  @override
  Object? toJson(bool object) => object ? 1 : 0;
}
