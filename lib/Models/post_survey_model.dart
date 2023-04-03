class PostSurveyModel {
  int surveyId;

  PostSurveyModel({
   required this.surveyId
});

  factory PostSurveyModel.fromJson(Map<String, dynamic> data){
    return PostSurveyModel(surveyId: data['survey_id']);
  }
}