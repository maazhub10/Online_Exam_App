import 'dart:convert';

class Test {
  int? _id;
  String? _name;
  String? _link;
  String? _code;

  Test({
    int? id,
    String? name,
    String? link,
    String? code,
  }) {
    if (id != null) {
      this._id = id;
    }
    if (name != null) {
      this._name = name;
    }
    if (link != null) {
      this._link = link;
    }
    if (code != null) {
      this._code = code;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  String? get name => _name;
  set name(String? name) => _name = name;
  String? get link => _link;
  set link(String? link) => _link = link;
  String? get code => _code;
  set code(String? code) => _code = code;

  Test.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _link = json['link'];
    _code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['name'] = this._name;
    data['link'] = this._link;
    data['code'] = this._code;
    return data;
  }
}

List<Test> testsfromJson(String jsonData) {
  final data = json.decode(jsonData);
  return List<Test>.from(data.map((item) => Test.fromJson(item)));
}