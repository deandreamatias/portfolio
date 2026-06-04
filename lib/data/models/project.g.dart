// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Project _$ProjectFromJson(Map<String, dynamic> json) => Project(
  id: json['id'] as String,
  name: json['name'] as String,
  logo: json['logo_url'] == null ? null : Uri.parse(json['logo_url'] as String),
  startDate: DateTime.parse(json['start_date'] as String),
  endDate: json['end_date'] == null
      ? null
      : DateTime.parse(json['end_date'] as String),
  description: json['description'] as String,
  summary: json['summary'] as String,
  type: json['type'] as String,
  role: json['role'] as String,
  platforms: (json['platforms'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  technologies: (json['technologies'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  featured: json['featured'] as bool,
  availableInStores: json['available_in_stores'] as bool,
  screenshots: (json['screenshots'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  web: const NullableUriConverter().fromJson(json['url'] as String?),
  repo: const NullableUriConverter().fromJson(json['repo'] as String?),
);

Map<String, dynamic> _$ProjectToJson(Project instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'logo_url': instance.logo?.toString(),
  'start_date': instance.startDate.toIso8601String(),
  'end_date': instance.endDate?.toIso8601String(),
  'description': instance.description,
  'summary': instance.summary,
  'type': instance.type,
  'role': instance.role,
  'platforms': instance.platforms,
  'technologies': instance.technologies,
  'featured': instance.featured,
  'available_in_stores': instance.availableInStores,
  'screenshots': instance.screenshots,
  'url': const NullableUriConverter().toJson(instance.web),
  'repo': const NullableUriConverter().toJson(instance.repo),
};
