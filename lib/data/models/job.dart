import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:portfolio/data/models/json_converters.dart';

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
  final List<JobDeliverableRef> deliverables;
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
class JobDeliverableRef extends Equatable {
  const JobDeliverableRef({
    @JsonKey(name: 'project_id') required this.projectId,
  });

  final String projectId;

  factory JobDeliverableRef.fromJson(Map<String, dynamic> json) =>
      _$JobDeliverableRefFromJson(json);

  Map<String, dynamic> toJson() => _$JobDeliverableRefToJson(this);

  @override
  List<Object?> get props => [projectId];
}
