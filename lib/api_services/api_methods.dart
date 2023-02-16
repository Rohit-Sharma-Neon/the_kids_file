
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:school_project/api_services/models/join_now_model.dart';

class ApiMethods{

  Future<JoinNowModel> joinNowApi({name,mobileNo,email,schoolName,className}) async {
    JoinNowModel joinNowModel;
    var mainUrl ='http://3.20.147.34:2004/api/users/save-school-api';

    Map data = {
      "name": name.toString(),
      "mobile_no":mobileNo.toString(),
      "email":email.toString(),
      "school_name":schoolName.toString(),
      "class_name":className.toString()
    };
    var url = Uri.parse(mainUrl);
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
}