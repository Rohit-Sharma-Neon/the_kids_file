class JoinNowModel {
  bool? success;
  String? msg;
  Result? result;

  JoinNowModel({this.success, this.msg, this.result});

  JoinNowModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    msg = json['msg'];
    result =
    json['result'] != null ? new Result.fromJson(json['result']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['msg'] = this.msg;
    if (this.result != null) {
      data['result'] = this.result!.toJson();
    }
    return data;
  }
}

class Result {
  int? id;
  String? name;
  String? mobileNo;
  String? email;
  String? schoolName;
  String? className;
  String? updatedAt;
  String? createdAt;

  Result(
      {this.id,
        this.name,
        this.mobileNo,
        this.email,
        this.schoolName,
        this.className,
        this.updatedAt,
        this.createdAt});

  Result.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    mobileNo = json['mobile_no'];
    email = json['email'];
    schoolName = json['school_name'];
    className = json['class_name'];
    updatedAt = json['updatedAt'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['mobile_no'] = this.mobileNo;
    data['email'] = this.email;
    data['school_name'] = this.schoolName;
    data['class_name'] = this.className;
    data['updatedAt'] = this.updatedAt;
    data['createdAt'] = this.createdAt;
    return data;
  }
}

