import 'package:fluent_ui/fluent_ui.dart';

import '../widget/devops_expander.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return ScaffoldPage.scrollable(
      header: const PageHeader(title: Text('Setting')),
      children: const [
        DevopsExpander(),
      ],
    );
  }
}
