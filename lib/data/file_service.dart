import 'dart:convert';

import 'package:either_dart/either.dart';
import 'package:flutter/services.dart';
import 'package:portfolio/data/models/project.dart';

class FileService {
  const FileService();

  Future<Either<String, List<Project>>> loadProjects() async {
    try {
      final raw = await rootBundle.loadString('assets/projects.json');
      final List<dynamic> decoded = json.decode(raw) as List<dynamic>;
      final projects = decoded
          .map((e) => Project.fromJson(e as Map<String, dynamic>))
          .toList();
      return Right(projects);
    } catch (e) {
      return Left('Failed to load projects: $e');
    }
  }
}
