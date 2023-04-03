import 'dart:convert';

import 'package:bodoo_flutter/Models/task_level_model.dart';
import 'package:bodoo_flutter/Providers/auth_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../Services/api.dart';


class LevelProvider extends ChangeNotifier{

  AuthProvider authProvider = AuthProvider();
  TaskLevelModel? _taskLevelModel;
  String _totalForms='0';
  String _completedForms = '0';
  String _max_invite='0';
  String _invite = '0';
  String _totalApps='0';
  String _completedApps = '0';
  String _totalReviews='0';
  String _completedReviews = '0';

  String _totalVideos='0';
  String _completedVideos = '0';
  String _totalVariables='0';
  String _completedVariables = '0';

  getLevels()async{
    try{

      await authProvider.getToken();
      var response = await http.post(Uri.parse('${Api.baseUrlApi}level/'),
        headers: {
          'Authorization':'Token ${authProvider.token}'
        },
      );
      print('status code ${response.statusCode}');
      print('response getLevels ${response.body}');
      var parsedJson = json.decode(response.body);
      if(response.statusCode == 201){
        _taskLevelModel = TaskLevelModel.fromJson(parsedJson);
      }else{
      }
      await getCompletedTasks();
    }catch(error, st){
      //Navigator.of(context).pop();
      print('catch error in LevelProvider getLevels $error $st');
    }finally{

      notifyListeners();
    }
  }

  getCompletedTasks()async{
    try{

      await authProvider.getToken();
      var response = await http.get(Uri.parse('${Api.baseUrlApi}get_total_and_completed/'),
        headers: {
          'Authorization':'Token ${authProvider.token}'
        },
      );
      print('status code ${response.statusCode}');
      print('response getCompletedTasks ${response.body}');
      var parsedJson = json.decode(response.body);
      if(response.statusCode == 200){
        _completedForms =  parsedJson['completed_forms'].toString();
        _totalForms = parsedJson['total_forms'].toString();
        _max_invite = parsedJson['max_invite_allow'].toString();
        _invite = parsedJson['invited_friends'].toString();

        _totalApps =  parsedJson['total_apps'].toString();
        _completedApps = parsedJson['download_app'].toString();
        _totalReviews = parsedJson['total_review'].toString();
        _completedReviews = parsedJson['given_review'].toString();

        _totalVideos =  parsedJson['total_videos'].toString();
        _completedVideos = parsedJson['completed_videos'].toString();
        _totalVariables = parsedJson['total_variable'].toString();
        _completedVariables = parsedJson['given_variable'].toString();
      }else{
      }
    }catch(error, st){
      //Navigator.of(context).pop();
      print('catch error in LevelProvider getCompletedTasks $error $st');
    }finally{

      notifyListeners();
    }
  }

  TaskLevelModel? get taskLevel => _taskLevelModel;
  String get totalForms => _totalForms;
  String get completedForms => _completedForms;
  String get maxInvites => _max_invite;
  String get invites => _invite;

  String get totalApps => _totalApps;
  String get completedApps => _completedApps;
  String get totalReviews => _totalReviews;
  String get completedReviews => _completedReviews;

  String get totalVideos => _totalVideos;
  String get completedVideos => _completedVideos;
  String get totalVariables => _totalVariables;
  String get completedVariables => _completedVideos;

}