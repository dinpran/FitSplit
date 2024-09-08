import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerWidget extends StatefulWidget {
  const VideoPlayerWidget({Key? key, required this.videoUrl}) : super(key: key);
  final String videoUrl;

  @override
  State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _videoplayercontroller;
  late Future<void> _initializeVideoPlayerFuture;

  double _volume = 1.0;
  double _playbackSpeed = 1.0;

  @override
  void initState() {
    super.initState();
    _videoplayercontroller = VideoPlayerController.asset(widget.videoUrl);
    _initializeVideoPlayerFuture =
        _videoplayercontroller.initialize().then((_) {
      _videoplayercontroller.play();
      _videoplayercontroller.setLooping(true);
      setState(() {});
    });
  }

  @override
  void dispose() {
    _videoplayercontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          alignment: Alignment.center,
          children: [
            AspectRatio(
              aspectRatio: _videoplayercontroller.value.aspectRatio,
              child: VideoPlayer(_videoplayercontroller),
            ),
            Positioned.fill(
              child: GestureDetector(
                onTap: () {
                  _togglePlayPause();
                },
                child: Visibility(
                  visible: !_videoplayercontroller.value.isPlaying,
                  child: Icon(
                    Icons.play_circle_filled,
                    size: 50,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: VideoProgressIndicator(
                _videoplayercontroller,
                allowScrubbing: true,
                colors: VideoProgressColors(
                  playedColor: Colors.blueAccent,
                  bufferedColor: Colors.grey,
                  backgroundColor: Colors.white,
                ),
              ),
            ),
            Positioned(
              top: 8,
              right: 8,
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(
                      _videoplayercontroller.value.isPlaying
                          ? Icons.pause
                          : Icons.play_arrow,
                      color: Colors.white,
                    ),
                    onPressed: _togglePlayPause,
                  ),
                  PopupMenuButton<double>(
                    initialValue: _playbackSpeed,
                    icon: Icon(
                      Icons.speed,
                      color: Colors.white,
                    ),
                    onSelected: (speed) {
                      _setPlaybackSpeed(speed);
                    },
                    itemBuilder: (context) => [
                      PopupMenuItem(
                        value: 0.5,
                        child: Text('0.5x'),
                      ),
                      PopupMenuItem(
                        value: 1.0,
                        child: Text('1.0x'),
                      ),
                      PopupMenuItem(
                        value: 1.5,
                        child: Text('1.5x'),
                      ),
                      PopupMenuItem(
                        value: 2.0,
                        child: Text('2.0x'),
                      ),
                    ],
                  ),
                  IconButton(
                    icon: Icon(
                      _volume > 0 ? Icons.volume_up : Icons.volume_off,
                      color: Colors.white,
                    ),
                    onPressed: _toggleVolume,
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 8,
              right: 8,
              child: IconButton(
                icon: Icon(
                  Icons.fullscreen,
                  color: Colors.white,
                ),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _togglePlayPause() {
    if (_videoplayercontroller.value.isPlaying) {
      _videoplayercontroller.pause();
    } else {
      _videoplayercontroller.play();
    }
    setState(() {});
  }

  void _setPlaybackSpeed(double speed) {
    _videoplayercontroller.setPlaybackSpeed(speed);
    _playbackSpeed = speed;
    setState(() {});
  }

  void _toggleVolume() {
    _volume = _volume > 0 ? 0.0 : 1.0;
    _videoplayercontroller.setVolume(_volume);
    setState(() {});
  }
}
