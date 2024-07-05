import 'package:dio/dio.dart';
import 'package:fluent_ui/fluent_ui.dart';

import 'apis/interceptors.dart';
import 'apis/rest_client.dart';
import 'models/work_item.dart';

class DsmPage extends StatefulWidget {
  const DsmPage({super.key});

  @override
  State<DsmPage> createState() => _DsmPageState();
}

class _DsmPageState extends State<DsmPage> {
  TextEditingController baseUrlController = TextEditingController(
    text: 'https://devops.imt-soft.com',
  );
  TextEditingController usernameController = TextEditingController(
    text: 'longtn',
  );
  TextEditingController passwordController = TextEditingController();
  TextEditingController organizationController = TextEditingController();

  RestClient? restClient;
  AuthInterceptor? authInterceptor;
  Iterable<WorkItem>? workItems;

  @override
  Widget build(BuildContext context) {
    final FluentThemeData theme = FluentTheme.of(context);

    return ScaffoldPage.scrollable(
      header: buildHeader(context),
      children: List.generate(workItems?.length ?? 0, (index) {
        final WorkItem item = workItems!.elementAt(index);

        return ListTile(
          leading: switch (item.workItemType) {
            'Task' => const Icon(FluentIcons.task_solid),
            'Bug' => const Icon(FluentIcons.bug_solid),
            String() || null => const Icon(FluentIcons.product),
          },
          title: Text(item.title ?? 'title'),
          subtitle: Text(item.changedDate.toString()),
          trailing: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                item.state ?? 'state',
                style: theme.typography.bodyStrong,
              ),
              const SizedBox(height: 4),
              Text(item.assignedTo?.displayName ?? ''),
            ],
          ),
        );
      }),
    );
  }

  Widget buildHeader(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Expander(
          initiallyExpanded: workItems == null,
          header: const Text('Authentication'),
          content: Column(
            children: [
              TextBox(
                controller: baseUrlController,
                placeholder: 'Enter base url',
                onSubmitted: _updateAuthentication,
              ),
              const SizedBox(height: 8),
              TextBox(
                controller: usernameController,
                placeholder: 'Enter username or email',
                onSubmitted: _updateAuthentication,
              ),
              const SizedBox(height: 8),
              PasswordBox(
                controller: passwordController,
                placeholder: 'Enter personal access token',
                onSubmitted: _updateAuthentication,
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Expander(
          initiallyExpanded: workItems == null,
          header: const Text('Project'),
          content: Column(
            children: [
              TextBox(
                controller: organizationController,
                placeholder: 'Enter organization name',
                onSubmitted: _updateProject,
              ),
              const SizedBox(height: 8),
              ComboBox<int>(
                value: 1,
                onChanged: (value) {},
                isExpanded: true,
                placeholder: const Text('Enter project name'),
                items: const [
                  ComboBoxItem(
                    value: 1,
                    child: Text('Project 1'),
                  ),
                  ComboBoxItem(
                    value: 2,
                    child: Text('Project 2'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _updateAuthentication(String value) {
    final String username = usernameController.text;
    final String password = passwordController.text;

    /// Create auth interceptor
    if (username.isNotEmpty && password.isNotEmpty) {
      authInterceptor = AuthInterceptor(username, password);
    }

    /// Create rest client
    final String baseUrl = baseUrlController.text;
    if (baseUrl.isNotEmpty && authInterceptor != null) {
      restClient ??= RestClient(
        Dio()..interceptors.add(authInterceptor!),
        baseUrl: baseUrl,
      );
    }
  }

  void _updateProject(Object value) {
    if (restClient == null) return;

    /// Load task
    final String organization = organizationController.text;
    if (organization.isNotEmpty) {
      restClient?.myWorkRecentActivity(organization).then((value) {
        workItems = value.value?.whereType<WorkItem>();
        setState(() {});
      });
    }
  }
}
