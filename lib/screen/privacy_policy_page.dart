import 'package:fluent_ui/fluent_ui.dart';

import 'package:flutter/services.dart';
import 'package:markdown_widget/markdown_widget.dart';

import '../gen/assets.gen.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: FluentTheme.of(context).navigationPaneTheme.backgroundColor,
      child: ScaffoldPage.withPadding(
        content: FutureBuilder(
          future: rootBundle.loadString(Assets.docs.privacyPolicy),
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            if (snapshot.hasData) {
              return MarkdownWidget(data: snapshot.data!);
            }

            return const Center(child: ProgressRing());
          },
        ),
      ),
    );
  }
}
