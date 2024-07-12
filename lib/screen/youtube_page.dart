import 'package:fluent_ui/fluent_ui.dart' hide ProgressBar;
import 'package:flutter/services.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubePage extends StatefulWidget {
  const YoutubePage({super.key});

  @override
  State<YoutubePage> createState() => _YoutubePageState();
}

class _YoutubePageState extends State<YoutubePage> {
  final YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: YoutubePlayer.convertUrlToId(
      'https://www.youtube.com/watch?v=4AoFA19gbLo',
    )!,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      onExitFullScreen: () {
        /// The player forces portraitUp after exiting fullscreen.
        /// This overrides the behaviour.
        SystemChrome.setPreferredOrientations(DeviceOrientation.values);
      },
      player: YoutubePlayer(
        controller: _controller,
        bottomActions: [
          CurrentPosition(),
          Expanded(child: ProgressBar()),
          FullScreenButton(),
        ],
      ),
      builder: (context, player) {
        return ScaffoldPage(
          header: const PageHeader(title: Text('Youtube')),
          content: LayoutBuilder(
            builder: (context, BoxConstraints constraints) {
              return AspectRatio(
                aspectRatio: constraints.biggest.aspectRatio,
                child: player,
              );
            },
          ),
        );
      },
    );
  }
}
