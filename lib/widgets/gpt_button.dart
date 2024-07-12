import 'package:fluent_ui/fluent_ui.dart';
import 'package:url_launcher/url_launcher.dart';

class GptButton extends StatelessWidget {
  const GptButton(this.message, {super.key});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Button(
      // 'https://chat.openai.com/chat?q=some+initial+question'
      onPressed: () => launchUrl(
        Uri.https('chat.openai.com', '/chat', {'q': message}),
      ),
      child: const Text('Open GPT'),
    );
  }
}
