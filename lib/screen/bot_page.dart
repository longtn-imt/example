import 'package:fluent_ui/fluent_ui.dart';

class BotPage extends StatelessWidget {
  const BotPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldPage.scrollable(
      header: const PageHeader(
        title: Text('Bot'),
      ),
      children: const [],
    );
  }
}
