import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluent_ui/fluent_ui.dart';

import '../model/devops_config.dart';
import '../widgets/gpt_button.dart';

class FirebaseDatabase {
  const FirebaseDatabase._();
  static const instance = FirebaseDatabase._();

  CollectionReference<DevopsConfig> get _devopCollection {
    return FirebaseFirestore.instance.collection('users').withConverter(
        fromFirestore: (snapshot, _) => DevopsConfig.fromJson(snapshot.data()!),
        toFirestore: (value, _) => value.toJson());
  }

  Future<DocumentSnapshot<DevopsConfig>> getDevopsConfig(String id) async {
    return _devopCollection.doc(id).get();
  }

  Stream<DocumentSnapshot<DevopsConfig>> snapshotsDevopsConfig(String id) {
    return _devopCollection.doc(id).snapshots();
  }

  saveUserDevopsInfo(String userId, {DevopsConfig? data}) {}
}

/// Extension for firebase database
extension FirebaseDatabaseExtFuture<T> on Future<DocumentSnapshot<T>> {
  Widget futureBuilder(Widget Function(BuildContext context, T? data) builder) {
    return FutureBuilder(
      future: this,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return InfoBar(
            severity: InfoBarSeverity.error,
            title: const Text('Something went wrong'),
            content: Text(snapshot.error.toString()),
            action: GptButton(snapshot.error.toString()),
          );
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return const InfoBar(
            severity: InfoBarSeverity.warning,
            title: Text('Document does not exist'),
          );
        }

        if (snapshot.connectionState == ConnectionState.done) {
          return builder.call(context, snapshot.data?.data());
        }

        return const InfoBar(title: Text('Loading'));
      },
    );
  }
}

/// Extension for firebase database
extension FirebaseDatabaseExtStream<T> on Stream<DocumentSnapshot<T>> {
  Widget streamBuilder(Widget Function(BuildContext context, T? data) builder) {
    return StreamBuilder(
      stream: this,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return InfoBar(
            severity: InfoBarSeverity.error,
            title: const Text('Something went wrong'),
            content: Text(snapshot.error.toString()),
            action: GptButton(snapshot.error.toString()),
          );
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const InfoBar(title: Text('Loading'));
        }

        return builder.call(context, snapshot.data?.data());
      },
    );
  }
}
