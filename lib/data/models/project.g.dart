// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Project _$ProjectFromJson(Map<String, dynamic> json) => Project(
  id: json['id'] as String,
  name: json['name'] as String,
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
  url: json['url'] as String?,
  repo: json['repo'] as String?,
  logoUrl: json['logo_url'] as String?,
  startDate: json['start_date'] as String?,
  endDate: json['end_date'] as String?,
);

Map<String, dynamic> _$ProjectToJson(Project instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'description': instance.description,
  'summary': instance.summary,
  'type': instance.type,
  'role': instance.role,
  'platforms': instance.platforms,
  'technologies': instance.technologies,
  'featured': instance.featured,
  'available_in_stores': instance.availableInStores,
  'screenshots': instance.screenshots,
  'url': instance.url,
  'repo': instance.repo,
  'logo_url': instance.logoUrl,
  'start_date': instance.startDate,
  'end_date': instance.endDate,
};
