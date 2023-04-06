import 'dart:convert';

import 'package:bodoo_flutter/Models/post_survey_model.dart';
import 'package:bodoo_flutter/Models/survey_model.dart';
import 'package:bodoo_flutter/Providers/auth_provider.dart';
import 'package:bodoo_flutter/Providers/home_provider.dart';
import 'package:bodoo_flutter/Providers/level_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../Services/api.dart';
import '../Utils/navigator.dart';


class SurveyProvider extends ChangeNotifier{


  AuthProvider authProvider = AuthProvider();

  List<SurveyModel> _surveyList = [];
  List<PostSurveyModel> _postSurveyList = [];
  bool _surveyLoading = false;
  List<bool> _checkList = [];

  getSurveys(BuildContext context)async{
    try{
    //  authProvider.loading();

      _surveyLoading = true;
      await  authProvider.getToken();
      _surveyList = [];
      var response = await http.get(Uri.parse('${Api.baseUrlApi}goole_form/'),
        headers: {
          'Authorization':'Token ${authProvider.token}'
        },
      );
      print('status code ${response.statusCode}');
      print('response getSurveys ${response.body}');
      var parsedJson = json.decode(response.body);
      if(response.statusCode == 200){
        //Navigator.of(context).pop();
        var data = parsedJson as List;
        _surveyList = data.map((e) => SurveyModel.fromJson(e)).toList();
       // print('formslist ${_surveyModel!.googleForms.first}');
        setCheckList();
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

  setCheckList(){
    _checkList = [];
    if(_surveyList.isNotEmpty){
      _surveyList.forEach((element) {
        _checkList.add(false);
      });
    }
    notifyListeners();
  }

  setCheckTrue(int index){
    _checkList[index] = true;
    notifyListeners();
  }


  postSurvey(String id)async{
    try{
      await  authProvider.getToken();
      _postSurveyList = [];
      var response = await http.post(Uri.parse('${Api.baseUrlApi}submit_google_survey/'),
        headers: {
          'Authorization':'Token ${authProvider.token}'
        },
        body: {
        'google_form_id' : id
        }
      );
      print('status code ${response.statusCode}');
      print('response postSurvey ${response.body}');
      var parsedJson = json.decode(response.body);
      if(response.statusCode == 200){
        var data = parsedJson['status'] as List;
        _postSurveyList = data.map((e) => PostSurveyModel.fromJson(e)).toList();
        print('idssssssss ${_postSurveyList.length} value  ${_postSurveyList[0].surveyId}');
        getSurveys(Values.navigatorKey.currentContext!);
        Provider.of<LevelProvider>(Values.navigatorKey.currentContext!,listen: false).getCompletedTasks();
        //Provider.of<HomeProvider>(context,listen: false).getHomeData();
        Provider.of<LevelProvider>(Values.navigatorKey.currentContext!,listen: false).getLevels();

      }else{
      }
    }catch(error, st){
      //Navigator.of(context).pop();
      print('catch error in surveyProvider postSurvey $error $st');
    }finally{
      notifyListeners();
    }
  }

  getCompletedSurveys()async{
    try{
      await  authProvider.getToken();
      _postSurveyList = [];
      var response = await http.get(Uri.parse('${Api.baseUrlApi}get_survey_reward/'),
          headers: {
            'Authorization':'Token ${authProvider.token}'
          },

      );
      print('status code ${response.statusCode}');
      print('response getCompletedSurveys ${response.body}');
      var parsedJson = json.decode(response.body);
      if(response.statusCode == 200){
        var data = parsedJson['status'] as List;
        _postSurveyList = data.map((e) => PostSurveyModel.fromJson(e)).toList();
        print('idssssssss ${_postSurveyList.length} value  ${_postSurveyList[0].surveyId}');
        // _surveyList.forEach((element) {
        //   print('element id ${element.id}');
        //   if(_postSurveyList[0].surveyId == element.id){
        //     print('okkkk');
        //   }else{
        //     print('yess');
        //   }
        // });

      }else{
      }
    }catch(error, st){
      //Navigator.of(context).pop();
      print('catch error in surveyProvider getCompletedSurveys $error $st');
    }finally{
      notifyListeners();
    }
  }

  //  checkExists(int id){
  //   _postSurveyList.forEach((element) {
  //     if(element.surveyId == id){
  //       return true;
  //     }else{
  //       return false;
  //     }
  //   });
  //
  // }

  List<SurveyModel> get surveysList => _surveyList;
  List<PostSurveyModel> get postSurveysList => _postSurveyList;
  bool get surveyLoading => _surveyLoading;
  List<bool> get checkList => _checkList;
}