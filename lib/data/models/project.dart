import 'package:json_annotation/json_annotation.dart';
import 'package:portfolio/data/models/project_links.dart';
import 'package:portfolio/data/models/showcase.dart';

part 'project.g.dart';

@JsonSerializable()
class Project extends Showcase {
  const Project({
    required super.id,
    required super.name,
    @JsonKey(name: 'logo_url') super.logo,
    @JsonKey(name: 'start_date') required super.startDate,
    @JsonKey(name: 'end_date') super.endDate,
    @JsonKey(name: 'job_id') super.jobId = '',
    @JsonKey(name: 'enterprise') super.enterprise = '',
    required this.description,
    required this.summary,
    required this.type,
    required this.role,
    required this.technologies,
    required this.featured,
    required this.screenshots,
    required this.links,
  });

  final String description;
  final String summary;
  final String type;
  final String role;
  final List<String> technologies;
  final bool featured;
  final List<String> screenshots;
  final ProjectLinks links;

  factory Project.fromJson(Map<String, dynamic> json) =>
      _$ProjectFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectToJson(this);

  @override
  List<Object?> get props => [
    ...super.props,
    description,
    summary,
    type,
    role,
    technologies,
    featured,
    screenshots,
    links,
  ];
}
