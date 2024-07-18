import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/services.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class YoutubeFullscreen extends StatefulWidget {
  const YoutubeFullscreen({
    super.key,
    required this.videoId,
    this.startSeconds,
  });

  final String videoId;
  final double? startSeconds;

  Future<double?> launch(BuildContext context) =>
      Navigator.of(context, rootNavigator: true).push<double>(
        FluentPageRoute(
          fullscreenDialog: true,
          builder: (context) => YoutubeFullscreen(
            videoId: videoId,
            startSeconds: startSeconds,
          ),
        ),
      );

  @override
  State<YoutubeFullscreen> createState() => _YoutubeFullscreenState();
}

class _YoutubeFullscreenState extends State<YoutubeFullscreen> {
  late final _controller = YoutubePlayerController.fromVideoId(
    videoId: widget.videoId,
    startSeconds: widget.startSeconds,
    autoPlay: true,
    params: const YoutubePlayerParams(
      showFullscreenButton: true,
      showControls: false,
      enableJavaScript: false,
      pointerEvents: PointerEvents.none,
    ),
  );

  @override
  void initState() {
    super.initState();

    _controller.listen(
      (YoutubePlayerValue value) {},
      onDone: () => _onPopInvoked(false),
    );

    /// Setup fullscreen
    _controller.setFullScreenListener(_onPopInvoked);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  }

  @override
  void dispose() {
    /// Cleanup fullscreen
    SystemChrome.setPreferredOrientations(DeviceOrientation.values);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    _controller.close();

    super.dispose();
  }

  Future _onPopInvoked(bool didPop) async {
    if (didPop) return;
    final currentTime = await _controller.currentTime;

    if (!mounted) return;
    Navigator.pop(context, currentTime);
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: _onPopInvoked,
      child: AspectRatio(
        aspectRatio: MediaQuery.of(context).size.aspectRatio,
        child: Stack(
          alignment: Alignment.center,
          fit: StackFit.expand,
          children: [
            YoutubePlayer(controller: _controller),
            Align(
              alignment: Alignment.bottomLeft,
              child: PlayerStateControl(controller: _controller),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: FullScreenControl(controller: _controller),
            ),
          ],
        ),
      ),
    );
  }
}

class PlayerStateControl extends StatelessWidget {
  const PlayerStateControl({super.key, this.controller});

  final YoutubePlayerController? controller;

  @override
  Widget build(BuildContext context) {
    final controller = this.controller ?? context.ytController;

    return YoutubeValueBuilder(
      controller: controller,
      builder: (BuildContext context, YoutubePlayerValue value) {
        return IconButton(
          icon: Icon(
            switch (value.playerState) {
              PlayerState.playing => FluentIcons.pause,
              PlayerState.paused => FluentIcons.play,
              PlayerState() => FluentIcons.progress_ring_dots,
            },
            color: Colors.white,
            size: 42,
          ),
          onPressed: () {
            if (value.playerState == PlayerState.playing) {
              controller.pauseVideo();
            } else {
              controller.playVideo();
            }
          },
        );
      },
    );
  }
}

class FullScreenControl extends StatelessWidget {
  const FullScreenControl({super.key, this.controller});

  final YoutubePlayerController? controller;

  @override
  Widget build(BuildContext context) {
    final controller = this.controller ?? context.ytController;

    return YoutubeValueBuilder(
      controller: controller,
      builder: (BuildContext context, YoutubePlayerValue value) {
        return IconButton(
          icon: Icon(
            switch (value.fullScreenOption) {
              final option when option.locked => FluentIcons.lock,
              final option when option.enabled => FluentIcons.focus_view,
              FullScreenOption() => FluentIcons.full_view,
            },
            color: Colors.white,
            size: 42,
          ),
          onPressed: () {
            if (value.fullScreenOption.enabled) {
              controller.exitFullScreen(lock: false);
            } else {
              controller.enterFullScreen(lock: false);
            }
          },
        );
      },
    );
  }
}
