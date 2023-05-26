class GraphModel{
  String mon,tue,wed,thu,fri,sat,sun;

  GraphModel({
    required this.sun,
    required this.sat,
    required this.fri,
    required this.thu,
    required this.wed,
    required this.tue,
    required this.mon
});

  factory GraphModel.fromJson(Map<String, dynamic> data){
    return GraphModel(sun: data['Sunday'], sat: data['Saturday'], fri: data['Friday'], thu: data['Thursday'], wed: data['Wednesday'], tue: data['Tuesday'], mon: data['Monday']);
  }
}