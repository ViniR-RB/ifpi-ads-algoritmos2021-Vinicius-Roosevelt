import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miniplayer/miniplayer.dart';
import 'package:youtubeui/data.dart';
import 'package:youtubeui/screens/video_screen.dart';
import 'home_screen.dart';

final selectedvideoProvider = StateProvider<Video?>((ref) => null);
final miniPlayerControllerProvider =
    StateProvider.autoDispose<MiniplayerController>(
  (ref) => MiniplayerController(),
);

class NavScreen extends StatefulWidget {
  const NavScreen({Key? key}) : super(key: key);

  @override
  State<NavScreen> createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  static const double _playerMinHeight = 60.0;
  int _selectIndex = 0;
  final _screens = [
    HomeScreen(),
    const Scaffold(
      body: Center(
        child: Text('Explorer'),
      ),
    ),
    const Scaffold(
      body: Center(
        child: Text('Add'),
      ),
    ),
    const Scaffold(
      body: Center(
        child: Text('Subscriptions'),
      ),
    ),
    const Scaffold(
      body: Center(
        child: Text('Libary'),
      ),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer(
        builder: (context, watch, _) {
          final selectVideo = watch(selectedvideoProvider).state;
          final miniPlayerController =
              watch(miniPlayerControllerProvider).state;
          print(selectVideo);
          return Stack(
            children: _screens
                .asMap()
                .map(
                  (i, screen) => MapEntry(
                    i,
                    Offstage(offstage: _selectIndex != i, child: screen),
                  ),
                )
                .values
                .toList()
              ..add(
                Offstage(
                  offstage: selectVideo == null,
                  child: Miniplayer(
                      controller: miniPlayerController,
                      minHeight: _playerMinHeight,
                      maxHeight: MediaQuery.of(context).size.height,
                      builder: (height, percentage) {
                        if (selectVideo == null) {
                          return const SizedBox.shrink();
                        }
                        if (height <= _playerMinHeight + 50.0)
                          return Container(
                            color: Theme.of(context).scaffoldBackgroundColor,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Image.network(
                                      selectVideo.thumbnailUrl,
                                      height: _playerMinHeight - 4.0,
                                      width: 120.0,
                                      fit: BoxFit.cover,
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Flexible(
                                                child: Text(
                                              selectVideo.title,
                                              overflow: TextOverflow.ellipsis,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .caption!
                                                  .copyWith(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w500),
                                            )),
                                            Flexible(
                                              child: Text(
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .caption!
                                                      .copyWith(
                                                          fontWeight:
                                                              FontWeight.w500),
                                                  '${selectVideo.author.username} * ${selectVideo.viewCount}'),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    IconButton(
                                        onPressed: () {},
                                        icon: Icon(Icons.play_arrow)),
                                    IconButton(
                                        onPressed: () {
                                          context
                                              .read(selectedvideoProvider)
                                              .state = null;
                                        },
                                        icon: Icon(Icons.close))
                                  ],
                                ),
                                const LinearProgressIndicator(
                                  value: 0.4,
                                  valueColor:
                                      AlwaysStoppedAnimation<Color>(Colors.red),
                                ),
                              ],
                            ),
                          );
                        return VideoScreen();
                      }),
                ),
              ),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 10.0,
        unselectedFontSize: 10.0,
        currentIndex: _selectIndex,
        onTap: (i) => setState(() => _selectIndex = i),
        items: const [
          BottomNavigationBarItem(
              activeIcon: Icon(Icons.home),
              icon: Icon(Icons.home_outlined),
              label: 'Home'),
          BottomNavigationBarItem(
              activeIcon: Icon(Icons.explore),
              icon: Icon(Icons.explore_outlined),
              label: 'Explore'),
          BottomNavigationBarItem(
              activeIcon: Icon(Icons.add_circle),
              icon: Icon(Icons.add_circle_outlined),
              label: 'Add'),
          BottomNavigationBarItem(
              activeIcon: Icon(Icons.subscriptions),
              icon: Icon(Icons.subscriptions_outlined),
              label: 'Subscriptions'),
          BottomNavigationBarItem(
              activeIcon: Icon(Icons.video_library),
              icon: Icon(Icons.video_library_outlined),
              label: 'Video'),
        ],
      ),
    );
  }
}
