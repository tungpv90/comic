import 'package:comic/model/comic_comment.dart';

class CommentListHolder{
  List<ComicComment> commentList = [];

  CommentListHolder.fromJson(Map data) {
    commentList = data['commentList'];
  }
}