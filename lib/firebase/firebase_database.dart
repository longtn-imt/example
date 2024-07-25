import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluent_ui/fluent_ui.dart';

import '../model/devops_config.dart';
import '../widget/gpt_button.dart';

class FirebaseDatabase {
  const FirebaseDatabase._();
  static const instance = FirebaseDatabase._();

  CollectionReference<DevopsConfig> get _devopCollection {
    return FirebaseFirestore.instance.collection('devops').withConverter(
        fromFirestore: (snapshot, _) => DevopsConfig.fromJson(snapshot.data()!),
        toFirestore: (value, _) => value.toJson());
  }

  Future<DocumentSnapshot<DevopsConfig>> getDevopsConfig(String id) async {
    return _devopCollection.doc(id).get();
  }

  Stream<DocumentSnapshot<DevopsConfig>> snapshotsDevopsConfig(String id) {
    return _devopCollection.doc(id).snapshots();
  }

  Future<void> saveUserDevopsInfo(String id, {required DevopsConfig data}) {
    return _devopCollection.doc(id).set(data);
  }
}

/// Extension for firebase database
extension FirebaseDatabaseExtFuture<T> on Future<DocumentSnapshot<T>> {
  Widget builder(
    Widget Function(BuildContext context, T? data) builder, {
    bool checkHasError = true,
    bool checkNotExist = true,
  }) {
    return FutureBuilder(
      future: this,
      builder: (context, snapshot) {
        if (checkHasError && snapshot.hasError) {
          return InfoBar(
            severity: InfoBarSeverity.error,
            title: const Text('Something went wrong'),
            content: Text(snapshot.error.toString()),
            action: GptButton(snapshot.error.toString()),
          );
        }

        if (checkNotExist && snapshot.hasData && !snapshot.data!.exists) {
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
  Widget builder(
    Widget Function(BuildContext context, T? data) builder, {
    bool checkHasError = true,
  }) {
    return StreamBuilder(
      stream: this,
      builder: (context, snapshot) {
        if (checkHasError && snapshot.hasError) {
          final content = snapshot.error.toString();

          return InfoBar(
            isLong: true,
            severity: InfoBarSeverity.error,
            title: const Text('Something went wrong'),
            content: Text(content),
            action: GptButton(content),
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
