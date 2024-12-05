import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

// This Widget for display youtube video. take[url]
class YoutubeWidget extends StatefulWidget {
  final String url;
  const YoutubeWidget({super.key, required this.url});

  @override
  State<YoutubeWidget> createState() => _YoutubeWidgetState();
}

class _YoutubeWidgetState extends State<YoutubeWidget> {
  late YoutubePlayerController controller;

  @override
  void initState() {
    super.initState();
    String id = YoutubePlayer.convertUrlToId(widget.url)!;

    controller = YoutubePlayerController(
      initialVideoId: id,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        controlsVisibleAtStart: true,
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      player: YoutubePlayer(controller: controller),
      builder: (context, player) {
        return player;
      },
    );
  }
}
