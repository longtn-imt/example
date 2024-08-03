import 'package:fluent_ui/fluent_ui.dart';

class BuildPage extends StatelessWidget {
  const BuildPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldPage.scrollable(
      header: const PageHeader(
        title: Text('Build'),
      ),
      children: const [],
    );
  }
}
