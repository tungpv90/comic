class Article {
  int id = -1;
  int novelId = -1;
  String title= '';
  String content= '';
  int price = 0;
  int index = 0;
  int nextArticleId = -1;
  int preArticleId = -1;

  late List<Map<String, int>> pageOffsets;

  Article.fromJson(Map data) {
    id = data['id'];
    novelId = data['novel_id'];
    title = data['title'];
    content = data['content'];
    content = '　　' + content;
    content = content.replaceAll('\n', '\n　　');
    price = data['welth'];
    index = data['index'];
    nextArticleId = data['next_id'];
    preArticleId = data['prev_id'];
  }

  String stringAtPageIndex(int index) {
    var offset = pageOffsets[index];
    return  "";//this.content.substring(offset['start'], offset['end']);
  }

  int get pageCount {
    return pageOffsets.length;
  }
}
