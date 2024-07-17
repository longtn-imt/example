import 'package:fluent_ui/fluent_ui.dart' hide ProgressBar;
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class YoutubePage extends StatefulWidget {
  const YoutubePage({super.key});

  @override
  State<YoutubePage> createState() => _YoutubePageState();
}

class _YoutubePageState extends State<YoutubePage> {
  final _controller = YoutubePlayerController.fromVideoId(
    videoId: '4AoFA19gbLo',
    params: const YoutubePlayerParams(showFullscreenButton: true),
  );

  @override
  void dispose() {
    _controller.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerScaffold(
      controller: _controller,
      builder: (context, player) {
        return ScaffoldPage.withPadding(
          header: const PageHeader(title: Text('Youtube')),
          content: SafeArea(child: player),
        );
      },
    );
  }
}
