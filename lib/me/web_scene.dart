import 'package:flutter/material.dart';

import 'package:share/share.dart';
import 'package:comic/widget/loading_indicator.dart';

class WebScene extends StatefulWidget {
  final String url;
  final String? title;

  WebScene({required this.url, this.title});

  @override
  _WebSceneState createState() => _WebSceneState();
}

class _WebSceneState extends State<WebScene> {
  bool isDataReady = false;
  PageState pageState = PageState.Loading;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    await Future.delayed(Duration(milliseconds: 2000), () {
      pageState = PageState.Content;
    });

    setState(() {
      isDataReady = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!isDataReady) {
      return LoadingIndicator(
        pageState,
      );
    }

    return Container();
  }
}
