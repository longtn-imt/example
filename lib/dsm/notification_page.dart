import 'package:fluent_ui/fluent_ui.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldPage.scrollable(
      header: const PageHeader(
        title: Text('Notification'),
      ),
      children: const [],
    );
  }
}
