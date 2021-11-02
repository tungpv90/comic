import 'package:flutter/material.dart';
import 'package:comic/app/ty_color.dart';

import 'chapter.dart';

class Novel {
  String id = '';
  String name = '';
  String imgUrl = '';
  String firstChapter = '';
  late Chapter lastChapter;
  String author = '';
  double price = 0.0;
  double score = 0.0;
  String type = '';
  String introduction = '';
  int chapterCount = 0;
  int recommendCount = 0;
  int commentCount = 0;
  int firstArticleId = -1;

  late List<String> roles;
  String status = '';
  double wordCount = 0;
  late List<String> tags;
  bool isLimitedFree = false;

  Novel.fromJson(Map data) {
    id = data['bid'];
    firstArticleId = data['first_article_id'];
    name = data['bookname'];
    imgUrl = data['book_cover'];
    firstChapter = data['topic_first'];
    if (data['lastChapter'] != null) {
      lastChapter = Chapter.fromJson(data['lastChapter']);
    }
    score = data['score'];
    author = data['author_name'];
    price = double.parse(data['price'] ?? '0');
    type = data['class_name'];
    introduction = data['introduction'];
    chapterCount = int.parse(data['chapterNum'] ?? '0');
    recommendCount = int.parse(data['recommend_num'] ?? '0');
    commentCount = int.parse(data['comment_count'] ?? '0');

    status = data['stat_name'];
    wordCount = data['wordCount'];
    tags = data['tag']?.cast<String>()?.toList();

    isLimitedFree = data['is_free'] == 1;
  }

  String recommendCountStr() {
    if (recommendCount >= 10000) {
      return (recommendCount / 10000).toStringAsFixed(1) + '万人推荐';
    } else {
      return recommendCount.toString() + '人推荐';
    }
  }

  Color statusColor() {
    return status == '连载' ? TYColor.blue : TYColor.primary;
  }
}
