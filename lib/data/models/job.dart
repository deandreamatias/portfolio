import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'job.g.dart';

@JsonSerializable()
class Job extends Equatable {
  const Job({
    required this.id,
    required this.enterprise,
    required this.jobTitle,
    required this.employmentType,
    required this.location,
    this.remote = false,
    required this.startDate,
    this.endDate = '',
    required this.description,
    this.achievements = const [],
    this.deliverables = const [],
    this.technologies = const [],
    this.skills = const [],
    this.logo = '',
  });

  final String id;
  final String enterprise;
  @JsonKey(name: 'job_title')
  final String jobTitle;
  @JsonKey(name: 'employment_type')
  final String employmentType;
  final String location;
  final bool remote;
  @JsonKey(name: 'start_date')
  final String startDate;
  @JsonKey(name: 'end_date')
  final String endDate;
  final String description;
  final List<String> achievements;
  final List<JobDeliverable> deliverables;
  final List<String> technologies;
  final List<String> skills;
  final String logo;

  bool get hasLogo => logo.isNotEmpty;
  bool get hasEndDate => endDate.isNotEmpty;

  factory Job.fromJson(Map<String, dynamic> json) => _$JobFromJson(json);

  Map<String, dynamic> toJson() => _$JobToJson(this);

  @override
  List<Object?> get props => [
    id,
    enterprise,
    jobTitle,
    employmentType,
    location,
    remote,
    startDate,
    endDate,
    description,
    achievements,
    deliverables,
    technologies,
    skills,
    logo,
  ];
}

@JsonSerializable()
class JobDeliverable extends Equatable {
  const JobDeliverable({
    required this.id,
    required this.name,
    required this.links,
    required this.available,
    this.screenshots = const [],
    required this.summary,
    this.logoUrl = '',
  });

  final String id;
  final String name;
  final JobLinks links;
  final bool available;
  final List<String> screenshots;
  final String summary;
  @JsonKey(name: 'logo_url')
  final String logoUrl;

  bool get hasLogo => logoUrl.isNotEmpty;

  factory JobDeliverable.fromJson(Map<String, dynamic> json) =>
      _$JobDeliverableFromJson(json);

  Map<String, dynamic> toJson() => _$JobDeliverableToJson(this);

  @override
  List<Object?> get props => [
    id,
    name,
    links,
    available,
    screenshots,
    summary,
    logoUrl,
  ];
}

@JsonSerializable()
class JobLinks extends Equatable {
  const JobLinks({this.ios, this.android, this.web});

  final String? ios;
  final String? android;
  final String? web;

  factory JobLinks.fromJson(Map<String, dynamic> json) =>
      _$JobLinksFromJson(json);

  Map<String, dynamic> toJson() => _$JobLinksToJson(this);

  @override
  List<Object?> get props => [ios, android, web];
}
