
class Author {
  String id;
  String name;
  int gender;
  String avatar_url;
  String headline;

  Author.fromJson(Map data) {
    id = data['id'];
    name = data['name'];
    gender = data['gender'];
    avatar_url = data['avatar_url'];
    headline = data['headline'];
  }
}