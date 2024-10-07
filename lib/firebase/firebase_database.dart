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

  Stream<DocumentSnapshot<DevopsConfig>> streamDevopsConfig() {
    return _devopCollection.doc(userId).snapshots();
  }

  Future<void> saveUserDevopsInfo(DevopsConfig data) {
    return _devopCollection.doc(userId).set(data);
  }
}

Widget _onSuccess(
  BuildContext context,
  String message, {
  VoidCallback? close,
}) {
  return InfoBar(
    severity: InfoBarSeverity.success,
    title: Text(message),
    action: IconButton(
      icon: const Icon(FluentIcons.clear),
      onPressed: close,
    ),
  );
}

Widget _onError(
  BuildContext context,
  Object? error, {
  Object? stackTrace,
  bool showDetailError = false,
}) {
  return InfoBar(
    isLong: true,
    severity: InfoBarSeverity.error,
    title: Text(error.toString()),
    content: showDetailError ? Text(stackTrace.toString()) : null,
    action: GptButton(error.toString()),
  );
}

Widget _onLoading(BuildContext context) {
  return const InfoBar(title: Text('Loading'));
}

/// Extension for firebase database
extension ExtensionStreamDocumentSnapshot<T> on Stream<DocumentSnapshot<T>> {
  Widget builder(
    Widget Function(BuildContext context, T? data) onData, {
    Widget Function(BuildContext context, Object? error)? onError = _onError,
    Widget Function(BuildContext context)? onLoading = _onLoading,
  }) {
    return StreamBuilder(
      stream: this,
      builder: (context, snapshot) {
        Widget? result;

        if (snapshot.hasError) {
          result ??= onError?.call(context, snapshot.error);
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          result ??= onLoading?.call(context);
        }

        return result ?? onData.call(context, snapshot.data?.data());
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
            builder: (context, close) => _onSuccess(
              context,
              successMessage,
              close: close,
            ),
          );
        }

        return value;
      }).catchError((error, stackTrace) {
        if (context.mounted) {
          displayInfoBar(
            context,
            duration: const Duration(seconds: 5),
            builder: (context, close) => _onError(
              context,
              error,
              stackTrace: stackTrace,
              showDetailError: showDetailError,
            ),
          );
        }

        return Error.throwWithStackTrace(error, stackTrace);
      });
}
