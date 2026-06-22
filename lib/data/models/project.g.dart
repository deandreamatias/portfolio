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
  jobId: json['job_id'] as String? ?? '',
  enterprise: json['enterprise'] as String? ?? '',
  description: json['description'] as String,
  summary: json['summary'] as String,
  type: json['type'] as String,
  role: json['role'] as String,
  technologies: (json['technologies'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  featured: json['featured'] as bool,
  screenshots: (json['screenshots'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  links: ProjectLinks.fromJson(json['links'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ProjectToJson(Project instance) => <String, dynamic>{
  'id': instance.id,
  'job_id': instance.jobId,
  'name': instance.name,
  'enterprise': instance.enterprise,
  'logo_url': instance.logo?.toString(),
  'start_date': instance.startDate.toIso8601String(),
  'end_date': instance.endDate?.toIso8601String(),
  'description': instance.description,
  'summary': instance.summary,
  'type': instance.type,
  'role': instance.role,
  'technologies': instance.technologies,
  'featured': instance.featured,
  'screenshots': instance.screenshots,
  'links': instance.links,
};
