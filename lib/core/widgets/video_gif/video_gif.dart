import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';


class VideoGif extends StatefulWidget {
  final VoidCallback? onVideoEnd;

  const VideoGif({super.key, this.onVideoEnd});

  @override
  State<VideoGif> createState() => _VideoGifState();
}

class _VideoGifState extends State<VideoGif> {
  late VideoPlayerController _controller;
  bool _hasError = false;

  @override
  void initState() {
    super.initState();

    _controller = VideoPlayerController.asset(
      'assets/videos/splash_vid.mp4',
    )..initialize().then((_) {
        if (!mounted) return;

        _controller
          ..setLooping(false)
          ..setVolume(0)
          ..play();

        _controller.addListener(() {
          if (_controller.value.position >= _controller.value.duration) {
            widget.onVideoEnd?.call();
          }
        });

        setState(() {});
      }).catchError((e) {
        debugPrint('VIDEO ERROR: $e');
        _hasError = true;
        widget.onVideoEnd?.call();
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_hasError) {
      return const Center(child: Text('Video failed to load'));
    }

    if (!_controller.value.isInitialized) {
      return const Center(child: CircularProgressIndicator());
    }

    return SizedBox.expand(
      child: FittedBox(
        fit: BoxFit.cover,
        child: SizedBox(
          width: _controller.value.size.width,
          height: _controller.value.size.height,
          child: VideoPlayer(_controller),
        ),
      ),
    );
  }
}
