import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:video_player/video_player.dart';

class IntroVideo extends StatefulWidget {
  const IntroVideo({Key? key}) : super(key: key);

  @override
  State<IntroVideo> createState() => _IntroVideoState();
}

class _IntroVideoState extends State<IntroVideo> {
  late VideoPlayerController _playerController;
  late VoidCallback _listener;
  bool _showControls = true;

  @override
  void initState() {
    super.initState();
    _listener = () {
      setState(() {});
    };
    _playerController = VideoPlayerController.networkUrl(
      Uri.parse(
          'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'),
    )
      ..addListener(_listener)
      ..initialize().then((_) {
        _playerController.play();
      });

    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeRight]);
  }

  @override
  void dispose() {
    _playerController.removeListener(_listener);
    _playerController.dispose();

    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String formatDuration(Duration duration) {
      String twoDigits(int n) {
        if (n >= 10) return "$n";
        return "0$n";
      }

      String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
      String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
      return "${duration.inHours}:$twoDigitMinutes:$twoDigitSeconds";
    }

    return Scaffold(
      body: GestureDetector(
        onTap: () {
          setState(() {
            _showControls = !_showControls;
          });
        },
        child: Stack(
          fit: StackFit.expand,
          children: [
            Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: AspectRatio(
                  aspectRatio: _playerController.value.aspectRatio,
                  child: VideoPlayer(_playerController),
                ),
              ),
            ),
            Center(
              child: AnimatedOpacity(
                opacity: _showControls ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 500),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 147,
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          if (_playerController.value.isPlaying) {
                            _playerController.pause();
                          } else {
                            _playerController.play();
                          }
                        });
                      },
                      icon: Icon(
                        _playerController.value.isPlaying
                            ? Icons.pause
                            : Icons.play_arrow,
                        size: 48,
                      ),
                    ),
                    const SizedBox(
                      height: 82,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            formatDuration(_playerController.value.position),
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                          ),
                          InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child:
                                  SvgPicture.asset('assets/icons/maximize.svg'))
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 23,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: VideoProgressIndicator(
                        _playerController,
                        allowScrubbing: true,
                        colors: const VideoProgressColors(
                          playedColor: Colors.blue,
                          backgroundColor: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: IntroVideo(),
  ));
}
