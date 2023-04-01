// ignore_for_file: unnecessary_this, prefer_collection_literals

class PostModelClass {
  int? userId;
  int? id;
  String? title;
  String? body;

  PostModelClass({this.userId, this.id, this.title, this.body});

  PostModelClass.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    body = json['body'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['userId'] = this.userId;
    data['id'] = this.id;
    data['title'] = this.title;
    data['body'] = this.body;
    return data;
  }
}
