import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'project.g.dart';

@JsonSerializable()
class Project extends Equatable {
  const Project({
    required this.id,
    required this.name,
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
    this.logoUrl,
    this.startDate,
    this.endDate,
  });

  final String id;
  final String name;
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
  final String? url;
  final String? repo;
  @JsonKey(name: 'logo_url')
  final String? logoUrl;
  @JsonKey(name: 'start_date')
  final String? startDate;
  @JsonKey(name: 'end_date')
  final String? endDate;

  factory Project.fromJson(Map<String, dynamic> json) =>
      _$ProjectFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectToJson(this);

  @override
  List<Object?> get props => [
        id,
        name,
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
        logoUrl,
        startDate,
        endDate,
      ];
}
