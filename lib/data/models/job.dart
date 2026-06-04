import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:portfolio/data/models/json_converters.dart';
import 'package:portfolio/data/models/showcase.dart';

part 'job.g.dart';

@JsonSerializable()
class Job extends Equatable {
  const Job({
    required this.id,
    required this.enterprise,
    @JsonKey(name: 'job_title') required this.jobTitle,
    @JsonKey(name: 'employment_type') required this.employmentType,
    required this.location,
    this.remote = false,
    @JsonKey(name: 'start_date') required this.startDate,
    @JsonKey(name: 'end_date') this.endDate,
    required this.description,
    this.achievements = const [],
    this.deliverables = const [],
    this.technologies = const [],
    this.skills = const [],
    this.logo,
  });

  final String id;
  final String enterprise;
  @JsonKey(name: 'job_title')
  final String jobTitle;
  @JsonKey(name: 'employment_type')
  final String employmentType;
  final String location;
  final bool remote;
  final String description;
  final List<String> achievements;
  final List<JobDeliverable> deliverables;
  final List<String> technologies;
  final List<String> skills;
  @NullableUriConverter()
  final Uri? logo;
  @DateTimeConverter()
  @JsonKey(name: 'start_date')
  final DateTime startDate;
  @NullableDateTimeConverter()
  @JsonKey(name: 'end_date')
  final DateTime? endDate;

  bool get hasLogo => logo != null;
  bool get hasEndDate => endDate != null;

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
    description,
    achievements,
    deliverables,
    technologies,
    skills,
    logo,
    startDate,
    endDate,
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
    this.logo,
  });

  final String id;
  final String name;
  final JobLinks links;
  final bool available;
  final List<String> screenshots;
  final String summary;
  @NullableUriConverter()
  @JsonKey(name: 'logo_url')
  final Uri? logo;

  bool get hasLogo => logo != null;

  Showcase toShowcase({required Job job}) => Showcase(
    id: id,
    jobId: job.id,
    name: name,
    enterprise: job.enterprise,
    logo: logo,
    startDate: job.startDate,
    endDate: job.endDate,
  );

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
    logo,
  ];
}

@JsonSerializable()
class JobLinks extends Equatable {
  const JobLinks({
    @JsonKey(name: 'app_store') this.ios,
    @JsonKey(name: 'google_play') this.android,
    this.web,
  });

  @NullableUriConverter()
  @JsonKey(name: 'app_store')
  final Uri? ios;
  @NullableUriConverter()
  @JsonKey(name: 'google_play')
  final Uri? android;
  @NullableUriConverter()
  final Uri? web;

  factory JobLinks.fromJson(Map<String, dynamic> json) =>
      _$JobLinksFromJson(json);

  Map<String, dynamic> toJson() => _$JobLinksToJson(this);

  @override
  List<Object?> get props => [ios, android, web];
}
