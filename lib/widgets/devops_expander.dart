import 'package:fluent_ui/fluent_ui.dart';

import '../firebase/firebase_authentication.dart';
import '../firebase/firebase_database.dart';
import '../model/devops_config.dart';

/// ======== DevOps Config ========
class DevopsExpander extends StatefulWidget {
  const DevopsExpander({super.key});

  @override
  State<DevopsExpander> createState() => _DevopsExpanderState();
}

class _DevopsExpanderState extends State<DevopsExpander> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String get userId => FirebaseAuthentication.instance.currentUser!.uid;

  @override
  Widget build(BuildContext context) {
    return Expander(
      leading: const Icon(FluentIcons.code),
      header: const Text('DevOps'),
      content: FirebaseDatabase.instance
          .snapshotsDevopsConfig(userId)
          .streamBuilder(buildConfig),
    );
  }

  Widget buildConfig(BuildContext context, DevopsConfig? data) {
    return Column(
      children: [
        InfoLabel(
          label: 'Username',
          child: TextBox(
            controller: usernameController,
            placeholder: 'Enter username',
          ),
        ),
        const SizedBox(height: 16),
        InfoLabel(
          label: 'Password',
          child: PasswordBox(
            controller: passwordController,
            placeholder: 'Enter password',
          ),
        ),
        const SizedBox(height: 16),
        FilledButton(
          onPressed: () => FirebaseDatabase.instance.saveUserDevopsInfo(
            userId,
            data: data,
          ),
          child: const Text('Update'),
        )
      ],
    );
  }
}
