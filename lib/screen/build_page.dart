import 'package:fluent_ui/fluent_ui.dart';

import '../apis/devops_client.dart';
import '../model/project.dart';
import '../widget/auto_box_organization.dart';
import '../widget/combo_box_pipeline.dart';
import '../widget/combo_box_pipeline_run.dart';
import '../widget/combo_box_project.dart';

class BuildPage extends StatefulWidget {
  const BuildPage({super.key});

  @override
  State<BuildPage> createState() => _BuildPageState();
}

class _BuildPageState extends State<BuildPage> {
  DevOpsClient? _client;
  Project? _project;

  @override
  Widget build(BuildContext context) {
    return ScaffoldPage.scrollable(
      header: const PageHeader(
        title: Text('Build'),
      ),
      children: [
        buildHeader(context),
      ],
    );
  }

  Widget buildHeader(BuildContext context) {
    return Expander(
      initiallyExpanded: true,
      header: const Text('Pipeline'),
      content: Column(
        children: [
          InfoLabel(
            label: 'Organization',
            child: AutoBoxOrganization(onChanged: (value) {
              if (value == null) return;

              _client = DevOpsClient.fromConfig(value);
            }),
          ),
          const SizedBox(height: 8),
          InfoLabel(
            label: 'Project',
            child: ComboBoxProject(
              client: _client,
              onChanged: (value) => _project = value,
            ),
          ),
          const SizedBox(height: 8),
          InfoLabel(
            label: 'Pipeline',
            child: ComboBoxPipeline(
              client: _client,
              project: _project,
            ),
          ),
          const SizedBox(height: 8),
          InfoLabel(
            label: 'Runs',
            child: ComboBoxPipelineRun(
              client: _client,
              project: _project,
              pipelineId: null,
            ),
          ),
        ],
      ),
    );
  }
}
