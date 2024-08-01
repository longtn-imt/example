import 'package:fluent_ui/fluent_ui.dart';

import '../firebase/firebase_database.dart';
import '../model/devops_config.dart';

class DevopsStatusButton extends StatelessWidget {
  const DevopsStatusButton({super.key, this.onChanged});

  final ValueChanged<DevopsConfig?>? onChanged;

  @override
  Widget build(BuildContext context) {
    return FirebaseDatabase.instance.snapshotsDevopsConfig().builder(
          onData,
          onError: (context, error) => const Icon(FluentIcons.error),
          onLoading: (context) => const Icon(FluentIcons.sync_status),
        );
  }

  Widget onData(BuildContext context, DevopsConfig? data) {
    onChanged?.call(data);

    return Icon(
      data == null
          ? FluentIcons.status_circle_ring
          : FluentIcons.status_circle_inner,
      color: Colors.green,
    );
  }
}
