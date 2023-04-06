class VideoModel{
  int id;
  String url,title,thumbnail;

  VideoModel({
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnail
});

  factory VideoModel.fromJson(Map<String , dynamic> data){
    return VideoModel(id: data['id'], title: data['video_title'] ?? '', url: data['url'],thumbnail: data['video_thumbnail']?? '');
  }
}