class DownloadAppModel{
  int id;
  String url,title,image;

  DownloadAppModel({
    required this.title,
    required this.id,
    required this.url,
    required this.image
});

  factory DownloadAppModel.fromJson(Map<String, dynamic> data){
    return DownloadAppModel(title: data['app_title'], id: data['id'], url: data['app_url'], image: data['app_img'] ?? '');
  }
}