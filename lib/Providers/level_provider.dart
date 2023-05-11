import 'dart:convert';

import 'package:bodoo_flutter/Models/task_level_model.dart';
import 'package:bodoo_flutter/Providers/auth_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../Services/api.dart';


class LevelProvider extends ChangeNotifier{

  AuthProvider authProvider = AuthProvider();
  TaskLevelModel? _taskLevelModel;
  int _totalForms=0;
  int _completedForms = 0;
  int _max_invite=0;
  int _invite = 0;
  int _totalApps=0;
  int _completedApps = 0;
  int _totalReviews=0;
  int _completedReviews = 0;
  int _totalOther=0;
  int _completedOther = 0;
  int _totalVideos=0;
  int _completedVideos = 0;
  int _totalSocialTask=0;
  int _completedSocialTask=0;
  int _totalInstaPost=0;
  int _completedInstaPost=0;
  int _totalFacebookPost=0;
  int _completedFacebookPost=0;
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
        _completedForms =  parsedJson['completed_forms'];
        _totalForms = parsedJson['total_forms'];
        _max_invite = parsedJson['max_invite_allow'];
        _invite = parsedJson['invited_friends'];

        _totalApps =  parsedJson['total_apps'];
        _completedApps = parsedJson['download_app'];
        _totalReviews = parsedJson['total_review'];
        _completedReviews = parsedJson['given_review'];

        _totalOther = parsedJson['total_other'];
        _completedOther = parsedJson['completed_other'];

        _totalVideos =  parsedJson['total_videos'];
        _completedVideos = parsedJson['completed_videos'];
        _totalVariables = parsedJson['total_variable'].toString();
        _completedVariables = parsedJson['given_variable'].toString();

        _totalSocialTask= parsedJson['total_social_media_task'];
        _completedSocialTask=parsedJson['completed_social_media_task'];

        _totalInstaPost=parsedJson['total_instagram_post'];
        _completedInstaPost=parsedJson['completed_instagram_post'];

        _totalFacebookPost=parsedJson['total_facebook_post'];
        _completedFacebookPost=parsedJson['completed_facebook_post'];

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
  int get totalForms => _totalForms;
  int get completedForms => _completedForms;
  int get maxInvites => _max_invite;
  int get invites => _invite;

  int get totalApps => _totalApps;
  int get completedApps => _completedApps;
  int get totalReviews => _totalReviews;
  int get completedReviews => _completedReviews;

  int get totalVideos => _totalVideos;
  int get completedVideos => _completedVideos;

  int get totalOther => _totalOther;
  int get completedOther => _completedOther;

  String get totalVariables => _totalVariables;
  String get completedVariables => _completedVariables;

  int get totalSocialTask => _totalSocialTask;
  int get completedSocialTask => _completedSocialTask;

  int get totalInstaPost=> _totalInstaPost;
  int get completedInstaPost=> _completedInstaPost;

  int get totalFacebookPost=> _totalFacebookPost;
  int get completedFacebookPost => _completedFacebookPost;
}