

import 'package:flutter_zhihu/model/answer.dart';
import 'package:flutter_zhihu/model/author.dart';

class Recommend {
  String id;
  String type;
  int created_time;
  int updated_time;
  Answer target;
  String action_text;

  Recommend.fromJson(Map data) {
    id = data['id'];
    type = data['type'];
    created_time = data['updated_time'];
    updated_time = data['updated_time'];

    if (data['target'] != null) {
      target = Answer.fromJson(data['target']);
    }
  }

}