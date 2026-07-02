import 'package:cs_academy_e_learning_app/Core/constants/app_color.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerView extends StatefulWidget {
  const VideoPlayerView({super.key, required this.url});

  final String url;

  @override
  State<VideoPlayerView> createState() => _VideoPlayerViewState();
}

class _VideoPlayerViewState extends State<VideoPlayerView> {
  late FlickManager flickManager;

  @override
  void initState() {
    super.initState();
    flickManager = FlickManager(
      videoPlayerController: VideoPlayerController.networkUrl(
        Uri.parse(widget.url),
      )..initialize().then((_) {
        setState(() {});
      }),
    );
  }

  @override
  void dispose() {
    flickManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = flickManager.flickVideoManager!.videoPlayerController;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        elevation: 0,
        title: const Text(
          "Course Video", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios ,color: Colors.white,),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: controller == null
          ? const Center(child: CircularProgressIndicator())
          : controller.value.hasError
          ? const Center(child: Text("Something went wrong"))
          : !controller.value.isInitialized
          ? const Center(child: CircularProgressIndicator())
          : Center(
        child: AspectRatio(
          aspectRatio: controller.value.aspectRatio,
          child: FlickVideoPlayer(flickManager: flickManager),
        ),
      ),
    );
  }
}
