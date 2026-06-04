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
          ?.map((e) => JobDeliverable.fromJson(e as Map<String, dynamic>))
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

JobDeliverable _$JobDeliverableFromJson(Map<String, dynamic> json) =>
    JobDeliverable(
      id: json['id'] as String,
      name: json['name'] as String,
      links: JobLinks.fromJson(json['links'] as Map<String, dynamic>),
      available: json['available'] as bool,
      screenshots:
          (json['screenshots'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      summary: json['summary'] as String,
      logo: const NullableUriConverter().fromJson(json['logo_url'] as String?),
    );

Map<String, dynamic> _$JobDeliverableToJson(JobDeliverable instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'links': instance.links,
      'available': instance.available,
      'screenshots': instance.screenshots,
      'summary': instance.summary,
      'logo_url': const NullableUriConverter().toJson(instance.logo),
    };

JobLinks _$JobLinksFromJson(Map<String, dynamic> json) => JobLinks(
  ios: const NullableUriConverter().fromJson(json['app_store'] as String?),
  android: const NullableUriConverter().fromJson(
    json['google_play'] as String?,
  ),
  web: const NullableUriConverter().fromJson(json['web'] as String?),
);

Map<String, dynamic> _$JobLinksToJson(JobLinks instance) => <String, dynamic>{
  'app_store': const NullableUriConverter().toJson(instance.ios),
  'google_play': const NullableUriConverter().toJson(instance.android),
  'web': const NullableUriConverter().toJson(instance.web),
};
