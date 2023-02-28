class SchoolListModel {
  bool? success;
  String? msg;
  List<SchoolListData>? result;

  SchoolListModel({this.success, this.msg, this.result});

  SchoolListModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    msg = json['msg'];
    if (json['result'] != null) {
      result = <SchoolListData>[];
      json['result'].forEach((v) {
        result!.add( SchoolListData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['success'] = this.success;
    data['msg'] = this.msg;
    if (this.result != null) {
      data['result'] = this.result!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SchoolListData {
  int? id;
  int? userId;
  String? name;
  String? address;
  String? isStatus;

  SchoolListData({this.id, this.userId, this.name, this.address, this.isStatus});

  SchoolListData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    name = json['name'];
    address = json['address'];
    isStatus = json['is_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['id'] = this.id;
    data['userId'] = this.userId;
    data['name'] = this.name;
    data['address'] = this.address;
    data['is_status'] = this.isStatus;
    return data;
  }
}