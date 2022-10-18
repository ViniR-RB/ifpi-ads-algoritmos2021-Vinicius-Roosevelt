import 'package:flutter/material.dart';
import 'package:miniplayer/miniplayer.dart';
import 'package:timeago/timeago.dart' as timeago;
import '../data.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../screens/nav_screnn.dart';

class VideoCard extends StatelessWidget {
  final Video video;
  final bool hasPadding;
  const VideoCard({Key? key, required this.video, this.hasPadding = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read(selectedvideoProvider).state = video;
        context
            .read(miniPlayerControllerProvider)
            .state
            .animateToHeight(state: PanelState.MAX);
      },
      child: Column(
        children: [
          Stack(
            children: [
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: hasPadding ? 12.0 : 0.0),
                child: Image.network(
                  video.thumbnailUrl,
                  height: 220.0,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: 8,
                right: hasPadding ? 20.0 : 8,
                child: Container(
                  padding: EdgeInsets.all(4),
                  color: Colors.black,
                  child: Text(
                    video.duration,
                    style: Theme.of(context)
                        .textTheme
                        .caption!
                        .copyWith(color: Colors.white),
                  ),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => print('Navegando para o profile'),
                  child: CircleAvatar(
                    foregroundImage: NetworkImage(video.author.profileImageUrl),
                  ),
                ),
                SizedBox(
                  width: 8.0,
                ),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                          child: Text(
                        video.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(fontSize: 15.0),
                      )),
                      Flexible(
                        child: Text(
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context)
                                .textTheme
                                .caption!
                                .copyWith(fontSize: 14.0),
                            '${video.author.username} * ${video.viewCount} view * ${timeago.format(video.timestamp)} '),
                      )
                    ],
                  ),
                ),
                GestureDetector(
                    child: Icon(
                  Icons.more_vert,
                  size: 20.0,
                )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
