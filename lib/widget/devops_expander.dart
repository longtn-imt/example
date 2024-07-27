import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
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
  TextEditingController baseUrlController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  late StreamSubscription subscription;

  /// Currrent id user logged
  String get userId {
    return FirebaseAuthentication.instance.currentUser!.uid;
  }

  /// Stream data config
  Stream<DocumentSnapshot<DevopsConfig>> get stream {
    return FirebaseDatabase.instance.snapshotsDevopsConfig(userId);
  }

  /// Update config
  Future<void> updateConfig(DevopsConfig? value) async {
    await FirebaseDatabase.instance.saveUserDevopsInfo(
      userId,
      data: (value ?? const DevopsConfig()).copyWith(
        baseUrl: baseUrlController.text,
        username: usernameController.text,
        password: passwordController.text,
      ),
    );

    if (!mounted) return;
    await displayInfoBar(
      context,
      builder: (BuildContext context, void Function() close) {
        return InfoBar(
          title: const Text('Update successfully'),
          action: IconButton(
            icon: const Icon(FluentIcons.clear),
            onPressed: close,
          ),
        );
      },
    );
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
          ),
        ),
        const SizedBox(height: 16),
        InfoLabel(
          label: 'Username',
          child: TextBox(
            controller: usernameController,
            placeholder: 'longtn@imt-soft.com',
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
          onPressed: () => updateConfig(data),
          child: const Text('Update'),
        )
      ],
    );
  }
}
