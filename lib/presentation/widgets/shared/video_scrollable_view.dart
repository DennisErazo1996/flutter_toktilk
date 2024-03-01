import 'package:flutter/material.dart';
import 'package:toktik/domain/entities/video_post.dart';
import 'package:toktik/presentation/widgets/shared/video_buttons.dart';
import 'package:toktik/presentation/widgets/shared/video_music_playing.dart';
import 'package:toktik/presentation/widgets/video/fullscreen_player.dart';

class VideoScrollableView extends StatelessWidget {
  final List<VideoPost> videos;

  const VideoScrollableView({super.key, required this.videos});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      scrollDirection: Axis.vertical,
      physics: const BouncingScrollPhysics(),
      itemCount: videos.length,
      itemBuilder: (context, index) {
        
        final VideoPost videoPost = videos[index];

        return Stack(
          children: [
            //video player + gradiente

            SizedBox.expand(
              child: FullScreenPlayer(videoUrl: videoPost.videoUrl, caption: videoPost.caption,)
            ),


            // botones
            Positioned(
              bottom: 25,
              right: 10,
              child: VideoButtons(video: videoPost)
            ),
            const Positioned(
              bottom: 25,
              left: 10,
              child: VideoMusicPlaying(image: '')
            )
          ],
        );
      },
    );
  }
}
