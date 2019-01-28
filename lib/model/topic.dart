
class Topic {
  String imageurl;
  String title;
  String content;

  Topic.fromJson(Map data) {
    imageurl = data['imageurl'];
    title = data['title'];
    content = data['content'];
  }
}