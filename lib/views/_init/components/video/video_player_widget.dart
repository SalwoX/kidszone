import 'package:chewie/chewie.dart';
import 'package:double_tap_player_view/double_tap_player_view.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:video_player/video_player.dart';

class PageVideoPlayerWidget extends StatefulWidget {
  final String? videoUrl;

  PageVideoPlayerWidget({Key? key, this.videoUrl});

  @override
  _PageVideoPlayerWidgetState createState() => _PageVideoPlayerWidgetState();
}

class _PageVideoPlayerWidgetState extends State<PageVideoPlayerWidget> {
  late VideoPlayerController _videoPlayerController;
  late ChewieController _chewieController;
  late bool loaded;
  @override
  void initState() {
    loaded = false;
    load();

    super.initState();
    //WidgetsBinding.instance?.addPostFrameCallback((_) async => _controller.play());
  }

  void load() {
    _videoPlayerController = VideoPlayerController.network(widget.videoUrl ?? '');

    _videoPlayerController.initialize().then((value) => {
          setState(() {
            loaded = true;
            _chewieController = new ChewieController(
              videoPlayerController: _videoPlayerController,
              //    aspectRatio: 16 / 9,
              autoInitialize: true,
              looping: false,
              autoPlay: false,
              showControls: true,
              allowPlaybackSpeedChanging: false,
              fullScreenByDefault: false,
              allowFullScreen: false,
            );
          })
        });
  }

  @override
  void dispose() {
    _chewieController.dispose();
    _videoPlayerController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return loaded
        ? AspectRatio(
            aspectRatio: 16 / 9,
            child: ProviderScope(
              child: GestureDetector(
                onTap: () {
                  if (_chewieController.isPlaying) {
                    _chewieController.pause();
                  } else {
                    _chewieController.play();
                  }
                },
                // child: DoubleTapPlayerView(
                //   doubleTapConfig: DoubleTapConfig.create(
                //     ignoreCenterWidth:
                //         128, // width of the zone which the double tap event is not fired in center
                //     iconLeft: Icon(
                //       Icons.fast_rewind,
                //       color: Colors.white,
                //       size: 40,
                //     ),
                //     iconRight: Icon(
                //       Icons.fast_forward,
                //       color: Colors.white,
                //       size: 40,
                //     ),
                //     curveBank: 40, // height of the oval curve bank
                //     ovalColor: Colors.white30,
                //     rippleColor: Colors.white30,
                //     rippleExpansionTime: const Duration(milliseconds: 400),
                //     expansionHoldingTime: const Duration(milliseconds: 200),
                //     backDropAnimDuration: const Duration(milliseconds: 400),
                //     fadeTime: const Duration(milliseconds: 100),
                //     backDrop: Colors.black26,
                //     // if provide [customWidgetBuilder], [ovalColor], [rippleColor], [labelBuilder], [labelStyle] must be null
                //     //  customWidgetBuilder: null, // type: Widget Function(Lr lr, int tapCount)
                //     //  labelBuilder: null, // type: `Widget Function(Lr lr, int tapCount)`
                //     labelStyle: const TextStyle(color: Colors.white),
                //     onDoubleTap: (lr) {
                //       if (Lr.LEFT == lr) {
                //         _videoPlayerController.seekTo(
                //             _videoPlayerController.value.position -
                //                 Duration(seconds: 10));
                //       } else {
                //         _videoPlayerController.seekTo(
                //             _videoPlayerController.value.position +
                //                 Duration(seconds: 10));
                //       }
                //     }, // type: `void Function(Lr lr)`

                //   ),
                child: Chewie(
                  controller: _chewieController,
                ),
              ),
            ),
            // ),
          )
        : Container(
            alignment: Alignment.center,
            child: CircularProgressIndicator(),
          );
  }

  Widget overlay(SwipeData data) {
    final dxDiff = (data.currentDx - data.startDx).toInt();
    Duration diffDuration = Duration(seconds: dxDiff);
    final prefix = diffDuration.isNegative ? '-' : '+';
    final positionText = '${prefix}${diffDuration.printDuration()}';
    final aimedDuration = diffDuration + Duration(minutes: 5);
    final diffText = aimedDuration.printDuration();

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            positionText,
            style: const TextStyle(
              fontSize: 30,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 4),
          Text(
            diffText,
            style: const TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

extension on Duration {
  /// ref: https://stackoverflow.com/a/54775297/8183034
  String printDuration() {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(inMinutes.abs().remainder(60));
    String twoDigitSeconds = twoDigits(inSeconds.abs().remainder(60));
    return "$twoDigitMinutes:$twoDigitSeconds";
  }
}
