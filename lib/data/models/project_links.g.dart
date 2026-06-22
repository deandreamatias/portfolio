// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_links.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProjectLinks _$ProjectLinksFromJson(Map<String, dynamic> json) => ProjectLinks(
  appStore: const NullableUriConverter().fromJson(json['app_store'] as String?),
  googlePlay: const NullableUriConverter().fromJson(
    json['google_play'] as String?,
  ),
  web: const NullableUriConverter().fromJson(json['web'] as String?),
  repository: const NullableUriConverter().fromJson(
    json['repository'] as String?,
  ),
);

Map<String, dynamic> _$ProjectLinksToJson(ProjectLinks instance) =>
    <String, dynamic>{
      'app_store': const NullableUriConverter().toJson(instance.appStore),
      'google_play': const NullableUriConverter().toJson(instance.googlePlay),
      'web': const NullableUriConverter().toJson(instance.web),
      'repository': const NullableUriConverter().toJson(instance.repository),
    };
