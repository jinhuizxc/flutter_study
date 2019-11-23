/*
 * {
  "data": [
    {
      "children": [

      ],
      "courseId": 13,
      "id": 408,
      "name": "鸿洋",
      "order": 190000,
      "parentChapterId": 407,
      "userControlSetTop": false,
      "visible": 1
    }
  ],
  "errorCode": 0,
  "errorMsg": ""
}
  *
 */
class PublicList {
  String errorMsg;
  int errorCode;
  List<DataListBean> data;

  PublicList({this.errorMsg, this.errorCode, this.data});

  PublicList.fromJson(Map<String, dynamic> json) {
    this.errorMsg = json['errorMsg'];
    this.errorCode = json['errorCode'];
    this.data = (json['data'] as List)!=null?(json['data'] as List).map((i) => DataListBean.fromJson(i)).toList():null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['errorMsg'] = this.errorMsg;
    data['errorCode'] = this.errorCode;
    data['data'] = this.data != null?this.data.map((i) => i.toJson()).toList():null;
    return data;
  }

}

class DataListBean {
  String name;
  bool userControlSetTop;
  int courseId;
  int id;
  int order;
  int parentChapterId;
  int visible;

  DataListBean({this.name, this.userControlSetTop, this.courseId, this.id, this.order, this.parentChapterId, this.visible});

  DataListBean.fromJson(Map<String, dynamic> json) {
    this.name = json['name'];
    this.userControlSetTop = json['userControlSetTop'];
    this.courseId = json['courseId'];
    this.id = json['id'];
    this.order = json['order'];
    this.parentChapterId = json['parentChapterId'];
    this.visible = json['visible'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['userControlSetTop'] = this.userControlSetTop;
    data['courseId'] = this.courseId;
    data['id'] = this.id;
    data['order'] = this.order;
    data['parentChapterId'] = this.parentChapterId;
    data['visible'] = this.visible;
    return data;
  }
}
