class WriteReviewModel {
  int id;
  String appLink,appTitle,appIcon,appComment;

  WriteReviewModel({
    required this.id,
    required this.appComment,
    required this.appIcon,
    required this.appLink,
    required this.appTitle,
});

  factory WriteReviewModel.fromJson(Map<String,dynamic> data){
    return WriteReviewModel(id: data['id'], appComment: data['app_comment'], appIcon: data['app_icon'], appLink: data['app_link'], appTitle: data['app_title']);
  }
}