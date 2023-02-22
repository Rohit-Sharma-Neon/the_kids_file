class GlobalNotificationModel{
  final String? title;
  final String? description;
  final bool? isRead;
  final String? link;
  final String? createdAt;
  final bool? isVideo;

  GlobalNotificationModel({this.title, this.description, this.isRead, this.link, this.isVideo = false,this.createdAt = "10/02/23"});
}