import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluent_ui/fluent_ui.dart';

import '../firebase/firebase_database.dart';
import '../model/devops_config.dart';

/// ======== DevOps Config ========
class DevopsExpander extends StatefulWidget {
  const DevopsExpander({super.key});

  @override
  State<DevopsExpander> createState() => _DevopsExpanderState();
}

class _DevopsExpanderState extends State<DevopsExpander> {
  TextEditingController baseUrlController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  late StreamSubscription subscription;

  /// Stream data config
  Stream<DocumentSnapshot<DevopsConfig>> get stream {
    return FirebaseDatabase.instance.snapshotsDevopsConfig();
  }

  @override
  void initState() {
    super.initState();
    subscription = stream.listen((DocumentSnapshot<DevopsConfig> event) {
      final DevopsConfig? config = event.data();

      if (config != null) {
        baseUrlController.text = config.baseUrl ?? '';
        usernameController.text = config.username ?? '';
        passwordController.text = config.password ?? '';
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    subscription.cancel();
    baseUrlController.dispose();
    usernameController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expander(
      initiallyExpanded: true,
      leading: const Icon(FluentIcons.code),
      header: const Text('DevOps'),
      content: stream.builder(buildContent),
    );
  }

  Widget buildContent(BuildContext context, DevopsConfig? data) {
    return Column(
      children: [
        InfoLabel(
          label: 'Base url',
          child: TextBox(
            controller: baseUrlController,
            placeholder: 'https://devops.imt-soft.com',
            suffix: IconButton(
              icon: const Icon(FluentIcons.auto_enhance_on),
              onPressed: () {
                baseUrlController.text = 'https://devops.imt-soft.com';
              },
            ),
          ),
        ),
        const SizedBox(height: 16),
        InfoLabel(
          label: 'Username',
          child: TextBox(
            controller: usernameController,
            placeholder: 'username@imt-soft.com',
            suffix: IconButton(
              icon: const Icon(FluentIcons.auto_enhance_on),
              onPressed: () {
                usernameController.text = 'username@imt-soft.com';
              },
            ),
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
          onPressed: () => FirebaseDatabase.instance
              .saveUserDevopsInfo(
                (data ?? const DevopsConfig()).copyWith(
                  baseUrl: baseUrlController.text,
                  username: usernameController.text,
                  password: passwordController.text,
                ),
              )
              .execute(context),
          child: const Text('Update'),
        )
      ],
    );
  }
}
