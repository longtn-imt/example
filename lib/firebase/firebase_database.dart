import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/foundation.dart';

import '../model/devops_config.dart';
import '../widget/gpt_button.dart';
import 'firebase_authentication.dart';

class FirebaseDatabase {
  const FirebaseDatabase._();
  static const instance = FirebaseDatabase._();

  /// Currrent id user logged
  String get userId {
    return FirebaseAuthentication.instance.currentUser!.uid;
  }

  CollectionReference<DevopsConfig> get _devopCollection {
    return FirebaseFirestore.instance.collection('devops').withConverter(
        fromFirestore: (snapshot, _) => DevopsConfig.fromJson(snapshot.data()!),
        toFirestore: (value, _) => value.toJson());
  }

  Future<DocumentSnapshot<DevopsConfig>> getDevopsConfig() async {
    return _devopCollection.doc(userId).get();
  }

  Stream<DocumentSnapshot<DevopsConfig>> snapshotsDevopsConfig() {
    return _devopCollection.doc(userId).snapshots();
  }

  Future<void> saveUserDevopsInfo(DevopsConfig data) {
    return _devopCollection.doc(userId).set(data);
  }
}

/// Extension for firebase database
extension ExtensionFutureDocumentSnapshot<T> on Future<DocumentSnapshot<T>> {
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
extension ExtensionStreamDocumentSnapshot<T> on Stream<DocumentSnapshot<T>> {
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

extension ExtensionFuture<T> on Future<T> {
  Future<T> execute(
    BuildContext context, {
    String? successMessage = 'Execute successfully',
    bool showDetailError = kDebugMode,
  }) =>
      then((T value) {
        if (successMessage != null) {
          displayInfoBar(
            context,
            builder: (context, close) => InfoBar(
              severity: InfoBarSeverity.success,
              title: Text(successMessage),
              action: IconButton(
                icon: const Icon(FluentIcons.clear),
                onPressed: close,
              ),
            ),
          );
        }

        return value;
      }).catchError((error, stackTrace) {
        displayInfoBar(
          context,
          duration: const Duration(seconds: 5),
          builder: (context, close) => InfoBar(
            isLong: showDetailError,
            severity: InfoBarSeverity.error,
            title: Text(error.toString()),
            content: showDetailError ? Text(stackTrace.toString()) : null,
            action: GptButton(error.toString()),
          ),
        );

        return Error.throwWithStackTrace(error, stackTrace);
      });
}
