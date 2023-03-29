class VideoModel{
  int id,reward;
  String url;

  VideoModel({
    required this.id,
    required this.reward,
    required this.url
});

  factory VideoModel.fromJson(Map<String , dynamic> data){
    return VideoModel(id: data['id'], reward: data['point_reward'], url: data['url']);
  }
}