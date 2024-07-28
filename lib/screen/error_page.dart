import 'package:fluent_ui/fluent_ui.dart';

import '../router/routes.dart';

void recordFlutterFatalError(FlutterErrorDetails details) {
  recordError(details.exception, details.stack);
}

bool recordError(Object error, StackTrace? stack) {
  navigatorKey.currentState?.push(FluentPageRoute(
    fullscreenDialog: true,
    builder: (context) {
      return ErrorPage(error: error, stack: stack);
    },
  ));

  return true;
}

class ErrorPage extends StatelessWidget {
  const ErrorPage({
    super.key,
    required this.error,
    this.stack,
  });

  final Object error;
  final StackTrace? stack;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.white,
      child: ScaffoldPage.scrollable(
        header: PageHeader(
          title: Text(error.toString()),
          commandBar: IconButton(
            icon: const Icon(FluentIcons.chrome_close),
            onPressed: Navigator.of(context).pop,
          ),
        ),
        children: [
          if (stack != null) Text(stack.toString()),
        ],
      ),
    );
  }
}
