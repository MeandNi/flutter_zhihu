

import 'package:flutter_zhihu/model/author.dart';

class Question {

  int id;
  String type;
  String title;
  String excerpt;
  int answer_count;
  int follower_count;
  int comment_count;
  Author author;

  Question.fromJson(data) {
    id = data['id'];
    title = data['title'];
    excerpt = data['excerpt'];
    answer_count = data['answer_count'];
    follower_count = data['follower_count'];
    comment_count = data['comment_count'];

    if (data['author'] != null) {
      author = Author.fromJson(data['author']);
    }
  }

}