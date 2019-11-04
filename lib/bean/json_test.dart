
/*
 * alt+ inset
 * {
  "userId": 1,
  "id": 1,
  "title": "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
  "body": "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto"
}
 */
class JsonTest {
  String title;
  String body;
  int userId;
  int id;

  JsonTest({this.title, this.body, this.userId, this.id});

  JsonTest.fromJson(Map<String, dynamic> json) {    
    this.title = json['title'];
    this.body = json['body'];
    this.userId = json['userId'];
    this.id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['body'] = this.body;
    data['userId'] = this.userId;
    data['id'] = this.id;
    return data;
  }

}
