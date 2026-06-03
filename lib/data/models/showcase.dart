import 'package:equatable/equatable.dart';

class Showcase extends Equatable {
  final String id;
  final String jobId;
  final String name;
  final Uri? logo;
  final DateTime startDate;
  final DateTime? endDate;

  const Showcase({
    required this.id,
    this.jobId = '',
    required this.name,
    required this.logo,
    required this.startDate,
    this.endDate,
  });

  @override
  List<Object?> get props => [id, jobId, name, logo, startDate, endDate];
}
