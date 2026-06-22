import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:portfolio/data/models/json_converters.dart';

part 'project_links.g.dart';

@JsonSerializable()
class ProjectLinks extends Equatable {
  const ProjectLinks({
    @JsonKey(name: 'app_store') this.appStore,
    @JsonKey(name: 'google_play') this.googlePlay,
    this.web,
    this.repository,
  });

  @NullableUriConverter()
  final Uri? appStore;
  @NullableUriConverter()
  final Uri? googlePlay;
  @NullableUriConverter()
  final Uri? web;
  @NullableUriConverter()
  final Uri? repository;

  factory ProjectLinks.fromJson(Map<String, dynamic> json) =>
      _$ProjectLinksFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectLinksToJson(this);

  @override
  List<Object?> get props => [appStore, googlePlay, web, repository];
}
