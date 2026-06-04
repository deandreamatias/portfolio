import 'package:json_annotation/json_annotation.dart';
import 'package:portfolio/data/models/json_converters.dart';
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
    required this.description,
    required this.summary,
    required this.type,
    required this.role,
    required this.platforms,
    required this.technologies,
    required this.featured,
    required this.availableInStores,
    required this.screenshots,
    this.url,
    this.repo,
  });

  final String description;
  final String summary;
  final String type;
  final String role;
  final List<String> platforms;
  final List<String> technologies;
  final bool featured;
  @JsonKey(name: 'available_in_stores')
  final bool availableInStores;
  final List<String> screenshots;
  @NullableUriConverter()
  final Uri? url;
  @NullableUriConverter()
  final Uri? repo;

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
    platforms,
    technologies,
    featured,
    availableInStores,
    screenshots,
    url,
    repo,
  ];
}
