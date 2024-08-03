import 'package:fluent_ui/fluent_ui.dart';

import '../apis/devops_client.dart';
import '../model/project.dart';
import '../model/work_item.dart';
import '../widget/auto_box_organization.dart';
import '../widget/combo_box_project.dart';

class DsmPage extends StatefulWidget {
  const DsmPage({super.key});

  @override
  State<DsmPage> createState() => _DsmPageState();
}

class _DsmPageState extends State<DsmPage> {
  DevOpsClient? _client;
  Iterable<WorkItem> workItems = const [];

  @override
  Widget build(BuildContext context) {
    final FluentThemeData theme = FluentTheme.of(context);

    return ScaffoldPage.scrollable(
      header: const PageHeader(title: Text('DSM task')),
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
            child: AutoBoxOrganization(
              onChanged: (value) {
                if (value == null) return;

                _client = DevOpsClient.fromConfig(value);
                _loadWorkItems();
              },
            ),
          ),
          const SizedBox(height: 8),
          InfoLabel(
            label: 'Project',
            child: ComboBoxProject(
              client: _client,
              onChanged: (Project? value) {},
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _loadWorkItems() async {
    if (_client == null) return;

    final result = await _client!.workRecentActivity();
    setState(() {
      workItems = result.value?.whereType<WorkItem>() ?? const [];
    });
  }
}
