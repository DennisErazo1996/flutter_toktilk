import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class VideoMusicPlaying extends StatelessWidget {
  
  final String image;

  const VideoMusicPlaying({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SpinPerfect(
              duration: const Duration(seconds: 6),
              infinite: true,
              child: IconButton(onPressed: (){}, icon: const Icon(Icons.play_circle_fill), iconSize: 40,)),
            const Text('Skillet - Comatose')
          ],
        )
      ],
    );
  }
}
