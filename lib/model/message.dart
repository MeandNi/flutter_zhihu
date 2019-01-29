
class Message {
  int type;
  String username;
  String content;
  int created_time;

  Message.fromJson(Map data) {
    created_time = data['created_time'];
    content = data['content'];
    type = data['type'];

    username = data['username'];
  }
}