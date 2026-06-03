import 'package:flutter/foundation.dart';
import 'package:portfolio/data/file_service.dart';
import 'package:portfolio/data/models/job.dart';
import 'package:portfolio/data/models/project.dart';
import 'package:portfolio/data/models/showcase.dart';

class ShowcaseNotifier extends ValueNotifier<List<Showcase>> {
  ShowcaseNotifier(super.state);

  Future<void> loadProjects() async {
    final result = await [_loadJobs(), _loadProjects()].wait;
    final showcases = result.fold<List<Showcase>>([], (p, e) => p..addAll(e));
    showcases.sort((a, b) => b.startDate.compareTo(a.startDate));
    final ids = showcases.map((e) => e.id).toSet();
    showcases.retainWhere((x) => ids.remove(x.id));
    value = showcases.toSet().toList();
  }

  Future<List<Showcase>> _loadProjects() async {
    final result = await const FileService().loadProjects();
    final projects = result.fold((_) => <Project>[], (projects) => projects);
    return projects.map((e) => e.toShowcase()).toList();
  }

  Future<List<Showcase>> _loadJobs() async {
    final result = await const FileService().loadJobs();
    final jobs = result.fold((_) => <Job>[], (jobs) => jobs);
    final showcases = <Showcase>[];
    for (final job in jobs) {
      if (job.deliverables.isNotEmpty) {
        for (final deliverable in job.deliverables) {
          showcases.add(
            Showcase(
              id: deliverable.id,
              name: deliverable.name,
              logo: Uri.tryParse(deliverable.logoUrl),
              startDate: DateTime.tryParse(job.startDate) ?? DateTime.now(),
              endDate: DateTime.tryParse(job.endDate),
            ),
          );
        }
      }
    }
    return showcases;
  }
}
