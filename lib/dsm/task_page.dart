import 'package:fluent_ui/fluent_ui.dart';

class TaskPage extends StatelessWidget {
  const TaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldPage.scrollable(
      header: const PageHeader(
        title: Text('Task'),
      ),
      children: const [],
    );
  }
}
