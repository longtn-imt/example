import 'package:fluent_ui/fluent_ui.dart';

import '../apis/devops_client.dart';
import '../model/pipeline_run.dart';
import '../model/project.dart';

class ComboBoxPipelineRun extends StatefulWidget {
  const ComboBoxPipelineRun({
    super.key,
    required this.client,
    required this.project,
    required this.pipelineId,
    this.initValue,
    this.onChanged,
  });

  final DevOpsClient? client;
  final Project? project;
  final String? pipelineId;
  final PipelineRun? initValue;
  final ValueChanged<PipelineRun?>? onChanged;

  @override
  State<ComboBoxPipelineRun> createState() => _ComboBoxPipelineRunState();
}

class _ComboBoxPipelineRunState extends State<ComboBoxPipelineRun> {
  Iterable<PipelineRun> runs = const [];
  PipelineRun? selectedPipelineRun;

  Future<void> _loadPipelineRuns() async {
    if (widget.client == null) return;
    if (widget.project == null) return;
    if (widget.pipelineId == null) return;

    final result = await widget.client!.pipelineRuns(
      widget.project!.id,
      widget.pipelineId!,
    );
    setState(() {
      runs = result.value?.whereType<PipelineRun>() ?? const [];
    });
  }

  @override
  void initState() {
    super.initState();

    selectedPipelineRun = widget.initValue;
    _loadPipelineRuns();
  }

  @override
  void didUpdateWidget(covariant ComboBoxPipelineRun oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.project != oldWidget.project) {
      _loadPipelineRuns();
    }
    if (widget.initValue != oldWidget.initValue) {
      setState(() {
        selectedPipelineRun = widget.initValue;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ComboBox<PipelineRun>(
      isExpanded: true,
      placeholder: const Text('Select run name'),
      items: runs
          .map((e) => ComboBoxItem(
                value: e,
                child: Text(e.name ?? e.id.toString()),
              ))
          .toList(),
      value: selectedPipelineRun,
      onChanged: (value) {
        setState(() => selectedPipelineRun = value);
        widget.onChanged?.call(value);
      },
    );
  }
}
