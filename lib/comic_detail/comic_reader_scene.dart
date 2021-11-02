import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:comic/public.dart';
import 'package:comic/widget/loading_indicator.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class ComicReaderScene extends StatefulWidget {
  final String url;

  ComicReaderScene(this.url);

  @override
  ComicReaderState createState() => ComicReaderState();
}

class ComicReaderState extends State<ComicReaderScene> with RouteAware {
  ScrollController scrollController = ScrollController();

  bool isDataReady = false;
  List<String> imageList = [];

  PageState pageState = PageState.Loading;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  void didPopNext() {
    Screen.updateStatusBarStyle(SystemUiOverlayStyle.dark);
  }

  @override
  void didPush() {
    super.didPush();
    Timer(const Duration(milliseconds: 1000), () {
      Screen.updateStatusBarStyle(SystemUiOverlayStyle.dark);
    });
  }

  Future<void> fetchData() async {
    try {
      imageList.clear();
      var responseJson = await Request.get(url: 'home_comic_image_list', params: {});
      responseJson["comicPictureList"].forEach((data) {
        imageList.add(data);
      });

      await Future.delayed(Duration(milliseconds: 2000), () {
        pageState = PageState.Content;
      });

      setState(() {
        isDataReady = true;
      });
    } catch (e) {
      print(e.toString());
    }
  }

  /// 失败重试
  _retry() {
    pageState = PageState.Loading;
    setState(() {});
    fetchData();
  }

  Widget buildWidget(int index) {
    return NovelCoverImage(imageList[index], fit: BoxFit.fitWidth);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: PhotoViewGallery.builder(
          scrollPhysics: const BouncingScrollPhysics(),
          allowImplicitScrolling: true,
          builder: (BuildContext context, int index) {
            return PhotoViewGalleryPageOptions(
              imageProvider: NetworkImage (imageList[index]),
              initialScale: PhotoViewComputedScale.contained * 0.8,
            );
          },
          itemCount: imageList.length,
          loadingBuilder: (context, event) => Center(
            child: Container(
              width: 20.0,
              height: 20.0,
              child: CircularProgressIndicator(
                value:  0,
              ),
            ),
          ),
        )
    );
  }
  /*
  @override
  Widget build(BuildContext context) {
    if (!isDataReady) {
      return LoadingIndicator(
        pageState,
        retry: _retry,
      );
    }
    return Container(
        color: TYColor.white,
        child: Stack(
          children: <Widget>[
            ListView.builder(
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.only(top: 0),
              controller: scrollController,
              itemCount: CollectionsUtils.size(imageList),
              itemBuilder: (BuildContext context, int index) {
                return buildWidget(index);
              },
              cacheExtent: 10,
            )
          ],
        ));
  }

   */
}
