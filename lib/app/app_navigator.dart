import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:comic/comic_detail/comic_detail_scene.dart';
import 'package:comic/comic_detail/comic_reader_scene.dart';
import 'package:comic/me/login_scene.dart';
import 'package:comic/me/web_scene.dart';
import 'package:comic/novel_detail/novel_detail_scene.dart';
import 'package:comic/public.dart';
import 'package:comic/reader/reader_scene.dart';
import 'package:comic/video/video_detail_scene.dart';

class AppNavigator {
  static push(BuildContext context, Widget scene) {
    Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (BuildContext context) => scene,
      ),
    );
  }

  static pushNovelDetail(BuildContext context, Novel novel) {
    AppNavigator.push(context, NovelDetailScene(novel.id));
  }

  static pushComicDetail(BuildContext context, String url) {
    AppNavigator.push(context, ComicDetailScene(""));
  }

  static pushComicReader(BuildContext context, String url) {
    AppNavigator.push(context, ComicReaderScene(""));
  }

  static pushVideoDetail(BuildContext context, String url) {
    AppNavigator.push(context, VideoDetailScene());
  }

  static pushLogin(BuildContext context) {
    AppNavigator.push(context, LoginScene());
  }

  static pushWeb(BuildContext context, String url, String title) {
    AppNavigator.push(context, WebScene(url: url, title: title));
  }

  static pushReader(BuildContext context, int articleId) {
    AppNavigator.push(context, ReaderScene(articleId: articleId));
  }
}
