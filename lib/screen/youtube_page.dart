import 'package:fluent_ui/fluent_ui.dart' hide ProgressBar;
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

import '../widget/youtube_fullscreen.dart';

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

  Future<void> _exitFullscreen() async {
    double? currentTime = await _controller.currentTime;

    if (!mounted) return;
    currentTime = await YoutubeFullscreen(
      videoId: '4AoFA19gbLo',
      startSeconds: currentTime,
    ).launch(context);

    if (currentTime == null) return;
    _controller.seekTo(seconds: currentTime);
    _controller.exitFullScreen();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerScaffold(
      controller: _controller,
      builder: (context, player) {
        return ScaffoldPage.withPadding(
          header: PageHeader(
            title: const Text('Youtube'),
            commandBar: Button(
              onPressed: _exitFullscreen,
              child: const Text('Enter fullscreen'),
            ),
          ),
          content: SafeArea(child: player),
        );
      },
    );
  }
}
