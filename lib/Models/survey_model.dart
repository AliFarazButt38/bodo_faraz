class SurveyModel{
int totalForms;
List<dynamic> googleForms = [];

SurveyModel({
  required this.googleForms,
  required this.totalForms
});


factory SurveyModel.fromJson(Map<String,dynamic> data){
  return SurveyModel(googleForms: data['google_form_url'], totalForms: data['total_forms']);
}
}