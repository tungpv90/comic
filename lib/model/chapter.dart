
class Chapter {
  int id = -1;
  String title = '';
  int index = 0;

  Chapter.fromJson(Map data) {
    id = data['id'];
    title = data['title'];
    index = data['index'];
  }
}
