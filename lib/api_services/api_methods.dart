
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:school_project/api_services/api_models/feed_model.dart';
import 'package:school_project/api_services/api_models/join_now_model.dart';
import 'package:school_project/api_services/api_models/school_list_model.dart';
import 'package:school_project/api_services/api_models/send_otp_model.dart';
import 'package:school_project/api_services/api_models/verify_otp_model.dart';
import 'package:school_project/api_services/end_points.dart';

class ApiMethods{
  var baseUrl ='http://3.20.147.34:2004/api';

  Future<JoinNowModel> joinNowApi({name,mobileNo,email,schoolName,className}) async {
    JoinNowModel joinNowModel = JoinNowModel();

    Map data = {
      "name": name.toString(),
      "mobile_no":mobileNo.toString(),
      "email":email.toString(),
      "school_name":schoolName.toString(),
      "class_name":className.toString()
    };
      var url = Uri.parse((baseUrl)+(EndPoints().joinNow));
      var response = await http.post(
        url,
        body: data,
      );
      print(response.statusCode.toString());
      print(response.body);
      joinNowModel = JoinNowModel.fromJson(json.decode(response.body));
      print(joinNowModel.toJson().toString());

    return joinNowModel;
  }

  Future<SendOtpModel> sendOtp({type,mobileNo,schoolId}) async {
    SendOtpModel sendOtpModel = SendOtpModel();

    Map data = {
      "type": type.toString(),
      "verify_type":"mobile",
      "country_code":"+91",
      "mobile": mobileNo.toString(),
      "school_id": schoolId.toString(),
    };
    var url = Uri.parse((baseUrl)+(EndPoints().sendOtp));
    var response = await http.post(
      url,
      body: data,
    );
    print(response.statusCode.toString());
    print(response.body);
    sendOtpModel = SendOtpModel.fromJson(json.decode(response.body));
    print(sendOtpModel.toJson().toString());

    return sendOtpModel;
  }

  Future<VerifyOtpModel> veryOTP({type,mobileNo,otp}) async {
    VerifyOtpModel verifyOtpModel = VerifyOtpModel();

    Map data = {
      "type": type.toString(),
      "verify_type":"mobile",
      "country_code":"+91",
      "mobile": mobileNo.toString(),
      "otp": otp.toString()
    };
    var url = Uri.parse((baseUrl)+(EndPoints().verifyOtp));
    var response = await http.post(
      url,
      body: data,
    );
    print(response.statusCode.toString());
    print(response.body);
    verifyOtpModel = VerifyOtpModel.fromJson(json.decode(response.body));
    print(verifyOtpModel.toJson().toString());

    return verifyOtpModel;
  }

  Future<SchoolListModel> getSchoolList() async {
    SchoolListModel schoolListModel = SchoolListModel();

    var url = Uri.parse((baseUrl)+(EndPoints().getSchoolList));
    var response = await http.get(
      url,
    );
    print(response.statusCode.toString());
    print(response.body);
    schoolListModel = SchoolListModel.fromJson(json.decode(response.body));
    print(schoolListModel.toJson().toString());

    return schoolListModel;
  }

  Future<FeedModel> getFeeds() async {
    FeedModel feedModel = FeedModel();

    var url = Uri.parse((baseUrl)+(EndPoints().getFeedList));
    var response = await http.get(
      url,
    );
    print(response.statusCode.toString());
    print(response.body);
    feedModel = FeedModel.fromJson(json.decode(response.body));
    print(feedModel.toJson().toString());

    return feedModel;
  }
}