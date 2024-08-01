import 'package:fluent_ui/fluent_ui.dart';

import '../apis/devops_client.dart';
import '../model/project.dart';

class ComboBoxProject extends StatefulWidget {
  const ComboBoxProject({
    super.key,
    required this.organization,
    this.client,
    this.initValue,
    this.onChanged,
  });

  final String organization;
  final DevOpsClient? client;
  final Project? initValue;
  final ValueChanged<Project?>? onChanged;

  @override
  State<ComboBoxProject> createState() => _ComboBoxProjectState();
}

class _ComboBoxProjectState extends State<ComboBoxProject> {
  Iterable<Project> projects = const [];
  Project? selectedProject;

  Future<void> _loadProjects([String? value]) async {
    if (widget.client == null) return;

    final String organization = value ?? widget.organization;
    if (organization.isEmpty) return;

    final result = await widget.client!.projects(organization);
    setState(() {
      projects = result.value?.whereType<Project>() ?? const [];
    });
  }

  @override
  void initState() {
    super.initState();

    selectedProject = widget.initValue;
    _loadProjects();
  }

  @override
  void didUpdateWidget(covariant ComboBoxProject oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.organization != oldWidget.organization) {
      _loadProjects();
    } else if (widget.initValue != oldWidget.initValue) {
      setState(() {
        selectedProject = widget.initValue;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ComboBox<Project>(
      isExpanded: true,
      placeholder: const Text('Select project name'),
      items: projects
          .map((e) => ComboBoxItem(
                value: e,
                child: Text(e.name ?? e.id ?? ''),
              ))
          .toList(),
      value: selectedProject,
      onChanged: (value) {
        setState(() => selectedProject = value);
        widget.onChanged?.call(value);
      },
    );
  }
}
