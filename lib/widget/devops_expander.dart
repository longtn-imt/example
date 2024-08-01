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
  TextEditingController organizationController = TextEditingController();
  FocusNode organizationFocusNode = FocusNode();

  @override
  void dispose() {
    super.dispose();
    baseUrlController.dispose();
    usernameController.dispose();
    passwordController.dispose();
    organizationController.dispose();
    organizationFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expander(
      initiallyExpanded: true,
      leading: const Icon(FluentIcons.code),
      header: const Text('DevOps'),
      content: FirebaseDatabase.instance
          .snapshotsDevopsConfig()
          .builder(buildContent),
    );
  }

  Widget buildContent(BuildContext context, DevopsConfig? data) {
    if (data != null && mounted) {
      Future.delayed(Duration.zero, () {
        baseUrlController.text = data.baseUrl ?? '';
        usernameController.text = data.username ?? '';
        passwordController.text = data.password ?? '';
        organizationController.text = data.selectedOrganization ?? '';
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
        buildSelectOrganization(context, data),
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
              .execute(context, successMessage: 'Update successfully'),
          child: const Text('Update'),
        )
      ],
    );
  }

  Widget buildSelectOrganization(BuildContext context, DevopsConfig? data) {
    return InfoLabel(
      label: 'Organization',
      child: AutoSuggestBox<String>(
        focusNode: organizationFocusNode,
        controller: organizationController,
        placeholder: 'Enter organization name',
        items: (data?.organizations ?? [])
            .map((e) => AutoSuggestBoxItem(value: e, label: e))
            .toList(),
        itemBuilder: (context, item) {
          return ListTile(
            title: Text(
              item.label,
              style: FluentTheme.of(context).typography.body,
            ),
            onPressed: () => FirebaseDatabase.instance
                .saveUserDevopsInfo(
                  (data ?? const DevopsConfig()).copyWith(
                    selectedOrganization: item.value,
                  ),
                )
                .whenComplete(() => organizationFocusNode.unfocus()),
            trailing: IconButton(
              icon: const Icon(FluentIcons.remove, size: 12),
              onPressed: () => FirebaseDatabase.instance
                  .saveUserDevopsInfo(
                    (data ?? const DevopsConfig()).copyWith(
                      selectedOrganization: null,
                      organizations: (data?.organizations ?? [])
                          .where((element) => element != item.value)
                          .toList(),
                    ),
                  )
                  .execute(context, successMessage: 'Remove successfully'),
            ),
          );
        },
        noResultsFoundBuilder: (context) {
          return ListTile(
            title: Text(
              'Create new organization',
              style: FluentTheme.of(context).typography.body,
            ),
            trailing: const Icon(FluentIcons.add, size: 12),
            onPressed: () => FirebaseDatabase.instance
                .saveUserDevopsInfo(
                  (data ?? const DevopsConfig()).copyWith(
                    selectedOrganization: organizationController.text,
                    organizations: [
                      ...?data?.organizations,
                      organizationController.text,
                    ],
                  ),
                )
                .execute(context, successMessage: 'Create successfully'),
          );
        },
      ),
    );
  }
}
