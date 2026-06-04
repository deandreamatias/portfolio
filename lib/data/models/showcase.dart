import 'package:equatable/equatable.dart';

class Showcase extends Equatable {
  const Showcase({
    required this.id,
    this.jobId = '',
    required this.name,
    this.enterprise = '',
    this.logo,
    required this.startDate,
    this.endDate,
  });

  final String id;
  final String jobId;
  final String name;
  final String enterprise;
  final Uri? logo;
  final DateTime startDate;
  final DateTime? endDate;

  bool get isJob => jobId.isNotEmpty;

  @override
  List<Object?> get props => [
    id,
    jobId,
    name,
    enterprise,
    logo,
    startDate,
    endDate,
  ];
}
