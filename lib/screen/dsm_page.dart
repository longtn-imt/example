import 'package:fluent_ui/fluent_ui.dart';

import '../apis/devops_client.dart';
import '../firebase/firebase_database.dart';
import '../model/devops_config.dart';
import '../model/project.dart';
import '../model/work_item.dart';

class DsmPage extends StatefulWidget {
  const DsmPage({super.key});

  @override
  State<DsmPage> createState() => _DsmPageState();
}

class _DsmPageState extends State<DsmPage> {
  TextEditingController organizationController = TextEditingController();

  DevOpsClient? client;
  Iterable<WorkItem> workItems = const [];
  Iterable<Project> projects = const [];
  Project? selectedProject;

  @override
  void initState() {
    super.initState();
    _init().execute(context, successMessage: null);
  }

  @override
  void dispose() {
    super.dispose();
    organizationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final FluentThemeData theme = FluentTheme.of(context);

    return ScaffoldPage.scrollable(
      header: PageHeader(
        title: const Text('DSM task'),
        commandBar: IconButton(
          icon: Icon(
            client == null
                ? FluentIcons.status_circle_ring
                : FluentIcons.status_circle_inner,
            color: Colors.green,
          ),
          onPressed: _init,
        ),
      ),
      children: List.generate(workItems.length + 1, (index) {
        /// Header
        if (index == 0) return buildHeader(context);

        /// Body
        final WorkItem item = workItems.elementAt(index - 1);
        return ListTile(
          leading: switch (item.workItemType) {
            'Task' => const Icon(FluentIcons.task_solid),
            'Bug' => const Icon(FluentIcons.bug_solid),
            String() || null => const Icon(FluentIcons.product),
          },
          title: Text(item.title ?? 'title'),
          subtitle: Text(item.changedDate.toString()),
          trailing: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                item.state ?? 'state',
                style: theme.typography.bodyStrong,
              ),
              const SizedBox(height: 4),
              Text(item.assignedTo?.displayName ?? ''),
            ],
          ),
        );
      }),
    );
  }

  Widget buildHeader(BuildContext context) {
    return Expander(
      initiallyExpanded: workItems.isEmpty,
      header: const Text('Project'),
      content: Column(
        children: [
          InfoLabel(
            label: 'Organization',
            child: TextBox(
              readOnly: true,
              controller: organizationController,
              suffix: IconButton(
                icon: const Icon(FluentIcons.search),
                onPressed: () => _loadWorkItems().execute(context),
              ),
            ),
          ),
          const SizedBox(height: 8),
          InfoLabel(
            label: 'Project',
            child: ComboBox<Project>(
              isExpanded: true,
              placeholder: const Text('Select project name'),
              items: projects
                  .map((e) => ComboBoxItem(
                        value: e,
                        child: Text(e.name ?? e.id ?? ''),
                      ))
                  .toList(),
              value: selectedProject,
              onChanged: (value) => setState(() => selectedProject = value),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _init() async {
    final snapshot = await FirebaseDatabase.instance.getDevopsConfig();
    final DevopsConfig? config = snapshot.data();

    if (config == null) throw 'Config not found';

    setState(() {
      client = DevOpsClient.fromConfig(config);
      organizationController.text = config.selectedOrganization ?? '';
    });

    if (!mounted) return;
    await _loadProjects(config.selectedOrganization).execute(context);
  }

  Future<void> _loadWorkItems([String? value]) async {
    if (client == null) return;

    final String organization = value ?? organizationController.text;
    if (organization.isEmpty) return;

    final result = await client!.workRecentActivity(organization);
    setState(() {
      workItems = result.value?.whereType<WorkItem>() ?? const [];
    });
  }

  Future<void> _loadProjects([String? value]) async {
    if (client == null) return;

    final String organization = value ?? organizationController.text;
    if (organization.isEmpty) return;

    final result = await client!.projects(organization);
    setState(() {
      projects = result.value?.whereType<Project>() ?? const [];
    });
  }
}
