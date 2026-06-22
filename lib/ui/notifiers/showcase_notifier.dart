import 'package:flutter/foundation.dart';
import 'package:portfolio/data/file_service.dart';
import 'package:portfolio/data/models/showcase.dart';

class ShowcaseNotifier extends ValueNotifier<List<Showcase>> {
  ShowcaseNotifier(super.state);

  Future<void> loadProjects() async {
    final result = await const FileService().loadProjects();
    final projects = result.fold(
      (_) => <Showcase>[],
      (projects) => projects,
    );
    projects.sort((a, b) => b.startDate.compareTo(a.startDate));
    value = projects;
  }
}
