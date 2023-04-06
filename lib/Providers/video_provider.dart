import 'dart:convert';

import 'package:bodoo_flutter/Models/video_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import '../Services/api.dart';
import 'auth_provider.dart';
import 'home_provider.dart';
import 'level_provider.dart';

class VideoProvider extends ChangeNotifier{
  AuthProvider authProvider = AuthProvider();
  List<VideoModel> _videosList = [];
  bool _videoLoading = false;

  getWatchVideos(BuildContext context)async{
    try{
      //  authProvider.loading();
      _videoLoading = true;
      _videosList = [];
      var response = await http.get(Uri.parse('${Api.baseUrlApi}videos/'),

      );
      print('status code ${response.statusCode}');
      print('response getWatchVideos ${response.body}');
      var parsedJson = json.decode(response.body);
      if(response.statusCode == 200){
        var data = parsedJson as List;
        _videosList = data.map((e) => VideoModel.fromJson(e)).toList();
        //Navigator.of(context).pop();
        // _surveyModel = SurveyModel.fromJson(parsedJson);
         print('url list ${_videosList.length}');

      }else{
      }
    }catch(error, st){
      //Navigator.of(context).pop();
      print('catch error in videoProvider getWatchVideos $error $st');
    }finally{
      _videoLoading = false;
      notifyListeners();
    }
  }

  postWatchVideos(String videoId,watchTime,BuildContext context)async{
    try{
      await  authProvider.getToken();
      authProvider.loading();
      print('watch time $watchTime videoid $videoId');
      var response = await http.post(Uri.parse('${Api.baseUrlApi}videos/$videoId/'),
        headers: {
          'Authorization':'Token ${authProvider.token}'
        },
        body: {
        'video':videoId,
          'watched_time': watchTime
        }
      );
      print('status code ${response.statusCode}');
      print('response postWatchVideos ${response.body}');
      var parsedJson = json.decode(response.body);
      if(response.statusCode == 200){
        Navigator.of(context).pop();
        Navigator.of(context).pop();
        Provider.of<LevelProvider>(context,listen: false).getCompletedTasks();
        Provider.of<LevelProvider>(context,listen: false).getLevels();
        Provider.of<HomeProvider>(context,listen: false).getHomeData();
      }else{
      }
    }catch(error, st){
      //Navigator.of(context).pop();
      print('catch error in videoProvider postWatchVideos $error $st');
    }finally{
      _videoLoading = false;
      notifyListeners();
    }
  }



  bool get videoLoading => _videoLoading;
  List<VideoModel> get videosList => _videosList;
}