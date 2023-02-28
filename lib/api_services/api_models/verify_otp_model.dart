class VerifyOtpModel {
  bool? success;
  String? msg;
  Result? result;

  VerifyOtpModel({this.success, this.msg, this.result});

  VerifyOtpModel.fromJson(Map<String, dynamic> json) {
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
  String? userNo;
  int? userType;
  String? name;
  String? username;
  String? email;
  String? countryCode;
  String? mobile;
  String? password;
  String? token;
  Null? socialId;
  String? gender;
  Null? image;
  Null? deviceType;
  Null? deviceToken;
  Null? latitude;
  Null? longitude;
  int? isNotify;
  bool? isVerify;
  bool? isEmailVerify;
  String? isStatus;
  String? dob;
  Null? residenceAddress;
  Null? pincode;
  Null? city;
  Null? landmark;
  int? age;
  Null? state;
  String? aadharNo;
  String? aadhaarFrontPhoto;
  String? aadhaarBackPhoto;
  String? aadhaarStatus;
  String? panNo;
  String? pancardPhoto;
  String? panStatus;
  String? accountName;
  String? accountNo;
  String? ifscCode;
  String? passbookPhoto;
  String? accountStatus;
  String? rating;
  String? createdAt;
  String? updatedAt;

  Result(
      {this.id,
        this.userNo,
        this.userType,
        this.name,
        this.username,
        this.email,
        this.countryCode,
        this.mobile,
        this.password,
        this.token,
        this.socialId,
        this.gender,
        this.image,
        this.deviceType,
        this.deviceToken,
        this.latitude,
        this.longitude,
        this.isNotify,
        this.isVerify,
        this.isEmailVerify,
        this.isStatus,
        this.dob,
        this.residenceAddress,
        this.pincode,
        this.city,
        this.landmark,
        this.age,
        this.state,
        this.aadharNo,
        this.aadhaarFrontPhoto,
        this.aadhaarBackPhoto,
        this.aadhaarStatus,
        this.panNo,
        this.pancardPhoto,
        this.panStatus,
        this.accountName,
        this.accountNo,
        this.ifscCode,
        this.passbookPhoto,
        this.accountStatus,
        this.rating,
        this.createdAt,
        this.updatedAt});

  Result.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userNo = json['userNo'];
    userType = json['user_type'];
    name = json['name'];
    username = json['username'];
    email = json['email'];
    countryCode = json['country_code'];
    mobile = json['mobile'];
    password = json['password'];
    token = json['token'];
    socialId = json['social_id'];
    gender = json['gender'];
    image = json['image'];
    deviceType = json['device_type'];
    deviceToken = json['device_token'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    isNotify = json['is_notify'];
    isVerify = json['is_verify'];
    isEmailVerify = json['is_email_verify'];
    isStatus = json['is_status'];
    dob = json['dob'];
    residenceAddress = json['residence_address'];
    pincode = json['pincode'];
    city = json['city'];
    landmark = json['landmark'];
    age = json['age'];
    state = json['state'];
    aadharNo = json['aadhar_no'];
    aadhaarFrontPhoto = json['aadhaar_front_photo'];
    aadhaarBackPhoto = json['aadhaar_back_photo'];
    aadhaarStatus = json['aadhaar_status'];
    panNo = json['pan_no'];
    pancardPhoto = json['pancard_photo'];
    panStatus = json['pan_status'];
    accountName = json['account_name'];
    accountNo = json['account_no'];
    ifscCode = json['ifsc_code'];
    passbookPhoto = json['passbook_photo'];
    accountStatus = json['account_status'];
    rating = json['rating'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userNo'] = this.userNo;
    data['user_type'] = this.userType;
    data['name'] = this.name;
    data['username'] = this.username;
    data['email'] = this.email;
    data['country_code'] = this.countryCode;
    data['mobile'] = this.mobile;
    data['password'] = this.password;
    data['token'] = this.token;
    data['social_id'] = this.socialId;
    data['gender'] = this.gender;
    data['image'] = this.image;
    data['device_type'] = this.deviceType;
    data['device_token'] = this.deviceToken;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['is_notify'] = this.isNotify;
    data['is_verify'] = this.isVerify;
    data['is_email_verify'] = this.isEmailVerify;
    data['is_status'] = this.isStatus;
    data['dob'] = this.dob;
    data['residence_address'] = this.residenceAddress;
    data['pincode'] = this.pincode;
    data['city'] = this.city;
    data['landmark'] = this.landmark;
    data['age'] = this.age;
    data['state'] = this.state;
    data['aadhar_no'] = this.aadharNo;
    data['aadhaar_front_photo'] = this.aadhaarFrontPhoto;
    data['aadhaar_back_photo'] = this.aadhaarBackPhoto;
    data['aadhaar_status'] = this.aadhaarStatus;
    data['pan_no'] = this.panNo;
    data['pancard_photo'] = this.pancardPhoto;
    data['pan_status'] = this.panStatus;
    data['account_name'] = this.accountName;
    data['account_no'] = this.accountNo;
    data['ifsc_code'] = this.ifscCode;
    data['passbook_photo'] = this.passbookPhoto;
    data['account_status'] = this.accountStatus;
    data['rating'] = this.rating;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}