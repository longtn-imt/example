import 'package:fluent_ui/fluent_ui.dart';

import '../firebase/firebase_database.dart';
import '../model/devops_config.dart';
import 'auto_box_organization.dart';

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

  Future _updateConfig(DevopsConfig? data) => FirebaseDatabase.instance
      .saveUserDevopsInfo(
        (data ?? const DevopsConfig()).copyWith(
          baseUrl: baseUrlController.text,
          username: usernameController.text,
          password: passwordController.text,
        ),
      )
      .execute(context, successMessage: 'Update successfully');

  @override
  void dispose() {
    super.dispose();
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
      content: FirebaseDatabase.instance.streamDevopsConfig().builder(onData),
    );
  }

  Widget onData(BuildContext context, DevopsConfig? data) {
    if (data != null && mounted) {
      Future.delayed(Duration.zero, () {
        baseUrlController.text = data.baseUrl ?? '';
        usernameController.text = data.username ?? '';
        passwordController.text = data.password ?? '';
      });
    }

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
        InfoLabel(
          label: 'Organization',
          child: const AutoBoxOrganization(),
        ),
        const SizedBox(height: 16),
        FilledButton(
          onPressed: () => _updateConfig(data),
          child: const Text('Update'),
        )
      ],
    );
  }
}
