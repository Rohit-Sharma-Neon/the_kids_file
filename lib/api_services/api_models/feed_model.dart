class FeedModel {
  bool? success;
  String? msg;
  List<FeedData>? result;

  FeedModel({this.success, this.msg, this.result});

  FeedModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    msg = json['msg'];
    if (json['result'] != null) {
      result = <FeedData>[];
      json['result'].forEach((v) {
        result!.add( FeedData.fromJson(v));
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

class FeedData {
  int? id;
  String? headingPhoto;
  String? title;
  int? likeCount;
  int? isLikeStatus;
  int? commenCount;
  List<String>? imagesList;

  FeedData(
      {this.id,
        this.headingPhoto,
        this.title,
        this.likeCount,
        this.isLikeStatus,
        this.commenCount,
        this.imagesList});

  FeedData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    headingPhoto = json['heading_photo'];
    title = json['title'];
    likeCount = json['like_count'];
    isLikeStatus = json['is_like_status'];
    commenCount = json['commen_count'];
    imagesList = json['images_list'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['id'] = this.id;
    data['heading_photo'] = this.headingPhoto;
    data['title'] = this.title;
    data['like_count'] = this.likeCount;
    data['is_like_status'] = this.isLikeStatus;
    data['commen_count'] = this.commenCount;
    data['images_list'] = this.imagesList;
    return data;
  }
}
