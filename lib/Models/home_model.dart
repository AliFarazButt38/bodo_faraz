class HomeModel{
  int videos,surveys,invites,apps,others,totalTasks,completedTasks,completedSocialTask;

  String userLevel;

  double totalPoint;
  HomeModel({
   required this.invites,
   required this.apps,
   required this.others,
   required this.completedTasks,
   required this.surveys,
   required this.totalPoint,
   required this.totalTasks,
   required this.userLevel,
   required this.videos,
    required this.completedSocialTask,
});
  
  factory HomeModel.fromJson(Map<String,dynamic> data){
    return HomeModel(invites: data['completed_invited_friends'], apps: data['completed_download_apps'], others: data['completed_other_tasks'], completedTasks: data['completed_tasks'], surveys: data['completed_surveys'], totalPoint: double.parse(data['total_points'].toString()) , totalTasks: data['total_tasks'], userLevel: data['user_level'], videos: data['completed_videos'],completedSocialTask: data['completed_social_media_task']);
  }
}