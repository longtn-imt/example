import 'package:fluent_ui/fluent_ui.dart';

import '../apis/devops_client.dart';
import '../model/pipeline.dart';
import '../model/project.dart';

class ComboBoxPipeline extends StatefulWidget {
  const ComboBoxPipeline({
    super.key,
    required this.client,
    required this.project,
    this.initValue,
    this.onChanged,
  });

  final DevOpsClient? client;
  final Project? project;
  final Pipeline? initValue;
  final ValueChanged<Pipeline?>? onChanged;

  @override
  State<ComboBoxPipeline> createState() => _ComboBoxPipelineState();
}

class _ComboBoxPipelineState extends State<ComboBoxPipeline> {
  Iterable<Pipeline> pipelines = const [];
  Pipeline? selectedPipeline;

  Future<void> _loadPipelines() async {
    if (widget.client == null) return;
    if (widget.project == null) return;

    final result = await widget.client!.pipelines(widget.project!.id);
    setState(() {
      pipelines = result.value?.whereType<Pipeline>() ?? const [];
    });
  }

  @override
  void initState() {
    super.initState();

    selectedPipeline = widget.initValue;
    _loadPipelines();
  }

  @override
  void didUpdateWidget(covariant ComboBoxPipeline oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.project != oldWidget.project) {
      _loadPipelines();
    }
    if (widget.initValue != oldWidget.initValue) {
      setState(() {
        selectedPipeline = widget.initValue;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ComboBox<Pipeline>(
      isExpanded: true,
      placeholder: const Text('Select pipeline name'),
      items: pipelines
          .map((e) => ComboBoxItem(
                value: e,
                child: Text(e.name ?? e.id.toString()),
              ))
          .toList(),
      value: selectedPipeline,
      onChanged: (value) {
        setState(() => selectedPipeline = value);
        widget.onChanged?.call(value);
      },
    );
  }
}
