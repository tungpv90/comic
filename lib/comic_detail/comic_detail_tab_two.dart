import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:comic/comic_home/comic_block_item_view.dart';
import 'package:comic/public.dart';

class ComicChapterTabTwo extends StatelessWidget {
  final ComicChapter comicChapter;

  ComicChapterTabTwo(this.comicChapter);

  Widget buildChapterWidget(BuildContext context, String chapterName) {
    return GestureDetector(
        onTap: () {
          AppNavigator.pushComicReader(context, "");
        },
        child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(1),
              border: Border.all(color: Color(0xffe1e1e1), width: 0.5),
            ),
            alignment: Alignment.center,
            child: Text(chapterName,
                style: TextStyle(
                    fontSize: 17,
                    color: TYColor.gray,
                    fontWeight: FontWeight.w500,
                    decoration: TextDecoration.none))));
  }

  @override
  Widget build(BuildContext context) {
    if (comicChapter == null ||
        CollectionsUtils.isEmpty(comicChapter.recommendList)) {
      return Container();
    }
    var chapterChildren = comicChapter.categoryList
        .map((chapterName) => buildChapterWidget(context, chapterName))
        .toList();
    var recommendChildren = comicChapter.recommendList
        .map((comicItem) => ComicBlockItemView(comicItem, Color(0xFFF5F5EE)))
        .toList();
    return SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
                child: Text(comicChapter.updateTime,
                    style: TextStyle(
                        fontSize: 12,
                        color: TYColor.gray,
                        fontWeight: FontWeight.w300,
                        decoration: TextDecoration.none)),
                padding: EdgeInsets.fromLTRB(15, 10, 10, 0)),
            GridView(
                padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 15,
                    crossAxisCount: 3,
                    childAspectRatio: 2.4),
                children: chapterChildren,
                // ?????????row???column????????????
                shrinkWrap: true,
                // ??????????????????
                physics: NeverScrollableScrollPhysics()),
            GestureDetector(
              onTap: () => Toast.show("?????????????????????????????????"),
              child: Container(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                  margin: EdgeInsets.fromLTRB(15, 5, 15, 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    border: Border.all(color: Color(0xffe1e1e1), width: 0.5),
                  ),
                  alignment: Alignment.center,
                  child: Text(comicChapter.actionName,
                      style: TextStyle(
                          fontSize: 17,
                          color: TYColor.mediumGray,
                          fontWeight: FontWeight.w300,
                          decoration: TextDecoration.none))),
            ),
            Container(
              child: Text("??????????????????",
                  style: TextStyle(
                      fontSize: 15,
                      color: TYColor.gray,
                      fontWeight: FontWeight.w300,
                      decoration: TextDecoration.none)),
              padding: EdgeInsets.only(left: 15),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(15, 15, 0, 15),
              child: Wrap(
                  spacing: 15, runSpacing: 15, children: recommendChildren),
            ),
          ],
          crossAxisAlignment: CrossAxisAlignment.start,
        ),
        physics: NeverScrollableScrollPhysics());
  }
}
