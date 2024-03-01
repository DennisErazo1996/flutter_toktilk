import 'package:flutter/material.dart';
import 'package:toktik/config/helpers/human_formats.dart';
import 'package:toktik/domain/entities/video_post.dart';

class VideoButtons extends StatelessWidget {
  final VideoPost video;

  const VideoButtons({super.key, required this.video});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _CustomIconButton(video.likes, Icons.favorite, Colors.red),
        _CustomIconButton(video.views, Icons.remove_red_eye_rounded, Colors.white),
        const _CustomIconButton(0, Icons.share_rounded, Colors.white),
        const _CustomIconButton(0, Icons.bookmark, Colors.white)
      ],
    );
  }
}

class _CustomIconButton extends StatelessWidget {
  final int? value;
  final IconData iconData;
  final Color? color;

  const _CustomIconButton(this.value,  this.iconData, iconColor)
  : color = iconColor ?? Colors.white;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          IconButton(onPressed: () {}, icon: Icon(iconData, color: color, size: 30,)),
          if(value! > 0)
          Text(HumanFormats.humanReadbleNumber(value!.toDouble())) 
        ],
      ),
    );
  }
}
