import 'package:json_annotation/json_annotation.dart';

/// Parses ISO date strings from JSON (e.g. `2019-08-01`).
class DateTimeConverter implements JsonConverter<DateTime, String> {
  const DateTimeConverter();

  @override
  DateTime fromJson(String json) => DateTime.tryParse(json) ?? DateTime.now();

  @override
  String toJson(DateTime object) => object.toIso8601String().split('T').first;
}

class NullableDateTimeConverter implements JsonConverter<DateTime?, String?> {
  const NullableDateTimeConverter();

  @override
  DateTime? fromJson(String? json) {
    if (json == null || json.isEmpty) {
      return null;
    }
    return DateTime.tryParse(json);
  }

  @override
  String? toJson(DateTime? object) =>
      object?.toIso8601String().split('T').first;
}

class UriConverter implements JsonConverter<Uri, String> {
  const UriConverter();

  @override
  Uri fromJson(String json) => Uri.parse(json);

  @override
  String toJson(Uri object) => object.toString();
}

class NullableUriConverter implements JsonConverter<Uri?, String?> {
  const NullableUriConverter();

  @override
  Uri? fromJson(String? json) {
    if (json == null || json.isEmpty) {
      return null;
    }
    return Uri.tryParse(json);
  }

  @override
  String? toJson(Uri? object) => object?.toString();
}
