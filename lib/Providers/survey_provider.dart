import 'dart:convert';

import 'package:bodoo_flutter/Models/survey_model.dart';
import 'package:bodoo_flutter/Providers/auth_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../Services/api.dart';


class SurveyProvider extends ChangeNotifier{


  AuthProvider authProvider = AuthProvider();
  SurveyModel? _surveyModel;
  bool _surveyLoading = false;

  getSurveys(BuildContext context)async{
    try{
    //  authProvider.loading();
      _surveyLoading = true;
      var response = await http.get(Uri.parse('${Api.baseUrl}goole_form/'),

      );
      print('status code ${response.statusCode}');
      print('response getSurveys ${response.body}');
      var parsedJson = json.decode(response.body);
      if(response.statusCode == 200){
        //Navigator.of(context).pop();
        _surveyModel = SurveyModel.fromJson(parsedJson);
        print('formslist ${_surveyModel!.googleForms.first}');

      }else{
      }
    }catch(error, st){
      //Navigator.of(context).pop();
      print('catch error in surveysProvider getSurveys $error $st');
    }finally{
      _surveyLoading = false;
      notifyListeners();
    }
  }


  SurveyModel? get surveysList => _surveyModel;
  bool get surveyLoading => _surveyLoading;
}