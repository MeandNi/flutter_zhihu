
import 'package:flutter_zhihu/model/Question.dart';
import 'package:flutter_zhihu/model/author.dart';

class Answer {
  int id;
  String excerpt;
  int created_time;
  int updated_time;
  int comment_count;
  int voteup_count;
  Question question;
  Author author;

  Answer.fromJson(Map data) {
    id = data['id'];
    excerpt = data['excerpt'];
    created_time = data['created_time'];
    updated_time = data['updated_time'];
    comment_count = data['comment_count'];
    voteup_count = data['voteup_count'];

    if (data['author'] != null) {
      author = Author.fromJson(data['author']);
    }

    if (data['question'] != null) {
      question = Question.fromJson(data['question']);
    }
  }
}