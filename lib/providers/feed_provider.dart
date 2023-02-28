import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:school_project/api_services/api_methods.dart';
import 'package:school_project/api_services/api_models/feed_model.dart';
import 'package:school_project/utils/app_string.dart';

class FeedProvider extends ChangeNotifier{
  bool isFeedLoading = false;
  List<FeedData> feedData = [];

  getFeeds(){
    isFeedLoading = true;
    notifyListeners();
    ApiMethods().getFeeds().then((value){
      if(value.success??false){
        feedData = value.result??[];
        notifyListeners();
      }else{
        Fluttertoast.showToast(msg: value.msg??somethingWentWrong,gravity: ToastGravity.CENTER);
      }
    });
    isFeedLoading = false;
    notifyListeners();
  }

}