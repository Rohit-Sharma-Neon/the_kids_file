import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:school_project/api_services/api_methods.dart';
import 'package:school_project/api_services/api_models/school_list_model.dart';

class RegistrationProvider extends ChangeNotifier{
  bool isSchoolListLoading = false;
  SchoolListModel schoolListModel = SchoolListModel();

  getSchoolList(){
    isSchoolListLoading = true;
    notifyListeners();
    ApiMethods().getSchoolList().then((value){
      if(value.success??false){
        schoolListModel = value;
        notifyListeners();
      }else{
        Fluttertoast.showToast(msg: value.msg??"Something Went Wrong!!");
      }
      isSchoolListLoading = false;
    });
    notifyListeners();
  }
}