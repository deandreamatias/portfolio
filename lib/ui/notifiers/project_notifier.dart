import 'package:flutter/foundation.dart';
import 'package:portfolio/data/file_service.dart';
import 'package:portfolio/data/models/project.dart';

class ProjectNotifier extends ValueNotifier<Project?> {
  ProjectNotifier(super.state);

  Future<void> loadProjectById(String id) async {
    try {
      final result = await const FileService().loadProjects();
      final project = result.fold(
        (_) => null,
        (projects) => projects.firstWhere(
          (p) => p.id == id,
          orElse: () => throw Exception('Project not found'),
        ),
      );
      value = project;
    } catch (e) {
      value = null;
      debugPrint('Error loading project: $e');
    }
  }
}
