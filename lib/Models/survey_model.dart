class SurveyModel{
int id;
String googleFormurl,googleFormId;

SurveyModel({
  required this.id,
  required this.googleFormurl,
  required this.googleFormId
});


factory SurveyModel.fromJson(Map<String,dynamic> data){
  return SurveyModel(googleFormurl: data['google_form_url'], id: data['id'],googleFormId: data['google_form_id']);
}
}


