import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toktik/config/app_theme.dart';
import 'package:toktik/infrastructure/datasources/local_videos_datasource_impl.dart';
import 'package:toktik/infrastructure/repositories/video_posts_repository_impl.dart';
import 'package:toktik/presentation/providers/discover_provider.dart';
import 'package:toktik/presentation/screens/discover_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final videoPostsRepository =
        VideoPostsRepositoryImpl(videoPostsDatasource: LocalVideosDatasource());

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          lazy: false,
          create: (_) =>
              DiscoverProvider(videosRepository: videoPostsRepository)..loadNextPage(),
        )
      ],
      child: MaterialApp(
        theme: AppTheme().getTheme(),
        debugShowCheckedModeBanner: false,
        title: 'Toktik',
        home: const DiscoverScreen(),
      ),
    );
  }
}
