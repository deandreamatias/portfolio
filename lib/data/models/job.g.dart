// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Job _$JobFromJson(Map<String, dynamic> json) => Job(
  id: json['id'] as String,
  enterprise: json['enterprise'] as String,
  jobTitle: json['job_title'] as String,
  employmentType: json['employment_type'] as String,
  location: json['location'] as String,
  remote: json['remote'] as bool? ?? false,
  startDate: const DateTimeConverter().fromJson(json['start_date'] as String),
  endDate: const NullableDateTimeConverter().fromJson(
    json['end_date'] as String?,
  ),
  description: json['description'] as String,
  achievements:
      (json['achievements'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  deliverables:
      (json['deliverables'] as List<dynamic>?)
          ?.map((e) => JobDeliverableRef.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  technologies:
      (json['technologies'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  skills:
      (json['skills'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  logo: const NullableUriConverter().fromJson(json['logo'] as String?),
);

Map<String, dynamic> _$JobToJson(Job instance) => <String, dynamic>{
  'id': instance.id,
  'enterprise': instance.enterprise,
  'job_title': instance.jobTitle,
  'employment_type': instance.employmentType,
  'location': instance.location,
  'remote': instance.remote,
  'description': instance.description,
  'achievements': instance.achievements,
  'deliverables': instance.deliverables,
  'technologies': instance.technologies,
  'skills': instance.skills,
  'logo': const NullableUriConverter().toJson(instance.logo),
  'start_date': const DateTimeConverter().toJson(instance.startDate),
  'end_date': const NullableDateTimeConverter().toJson(instance.endDate),
};

JobDeliverableRef _$JobDeliverableRefFromJson(Map<String, dynamic> json) =>
    JobDeliverableRef(projectId: json['project_id'] as String);

Map<String, dynamic> _$JobDeliverableRefToJson(JobDeliverableRef instance) =>
    <String, dynamic>{'project_id': instance.projectId};
