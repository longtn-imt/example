import 'package:fluent_ui/fluent_ui.dart';

import '../firebase/firebase_database.dart';
import '../model/devops_config.dart';

class AutoBoxOrganization extends StatefulWidget {
  const AutoBoxOrganization({super.key});

  @override
  State<AutoBoxOrganization> createState() => _AutoBoxOrganizationState();
}

class _AutoBoxOrganizationState extends State<AutoBoxOrganization> {
  FocusNode focusNode = FocusNode();
  TextEditingController controller = TextEditingController();

  Future _addOrganization(DevopsConfig? data, String item) =>
      FirebaseDatabase.instance
          .saveUserDevopsInfo(
            (data ?? const DevopsConfig()).copyWith(
              selectedOrganization: controller.text,
              organizations: [
                ...?data?.organizations,
                item,
              ],
            ),
          )
          .execute(context, successMessage: 'Add organization successfully');

  Future _removeOrganization(DevopsConfig? data, String item) =>
      FirebaseDatabase.instance
          .saveUserDevopsInfo(
            (data ?? const DevopsConfig()).copyWith(
              selectedOrganization: null,
              organizations: (data?.organizations ?? [])
                  .where((element) => element != item)
                  .toList(),
            ),
          )
          .execute(context, successMessage: 'Remove organization successfully');

  Future _changeOrganization(DevopsConfig? data, String? item) =>
      FirebaseDatabase.instance
          .saveUserDevopsInfo(
            (data ?? const DevopsConfig()).copyWith(
              selectedOrganization: item,
            ),
          )
          .execute(context, successMessage: 'Change organization successfully');

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
    focusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FirebaseDatabase.instance.streamDevopsConfig().builder(
          onData,
          onError: null,
          onLoading: null,
        );
  }

  Widget onData(BuildContext context, DevopsConfig? data) {
    if (data?.selectedOrganization != null) {
      Future.delayed(Duration.zero, () {
        controller.text = data!.selectedOrganization!;
      });
    }

    return AutoSuggestBox<String>(
      focusNode: focusNode,
      controller: controller,
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
          onPressed: () => _changeOrganization(data, item.value).whenComplete(
            () {
              controller.text = item.value;
              focusNode.unfocus();
            },
          ),
          trailing: IconButton(
            icon: const Icon(FluentIcons.remove, size: 12),
            onPressed: () => _removeOrganization(data, item.value),
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
          onPressed: () => _addOrganization(data, controller.text),
        );
      },
    );
  }
}
