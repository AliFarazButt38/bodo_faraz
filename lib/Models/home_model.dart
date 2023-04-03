class HomeModel{
  int userLevel,totalPoint,videos,surveys,invites,apps,others,totalTasks,completedTasks;

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
});
  
  factory HomeModel.fromJson(Map<String,dynamic> data){
    return HomeModel(invites: data['completed_invited_friends'], apps: data['completed_download_apps'], others: data['completed_other_tasks'], completedTasks: data['completed_tasks'], surveys: data['completed_surveys'], totalPoint: data['total_points'], totalTasks: data['total_tasks'], userLevel: data['user_level'], videos: data['completed_videos']);
  }
}