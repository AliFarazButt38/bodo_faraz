import 'dart:convert';

import 'package:bodoo_flutter/Models/socialmedia_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../Services/api.dart';
import '../Utils/navigator.dart';
import 'auth_provider.dart';
import 'home_provider.dart';
import 'level_provider.dart';

class SocialMediaProvider extends ChangeNotifier{

  AuthProvider authProvider = AuthProvider();
  List<SocialMediaModel> _socialMediaList=[];
  bool _taskLoading = false;
  List<SocialMediaModel> _facebookMediaList=[];
  bool _facebookTaskLoading = false;


  getInstagramPost(BuildContext context)async{
    try{
      _taskLoading=true;
      _socialMediaList=[];
      await authProvider.getToken();
      var response = await http.get(Uri.parse('${Api.baseUrlSocialMedia}instgram_post/'),
        headers: {
          'Authorization':'Token ${authProvider.token}'
        },
      );
      print('status code ${response.statusCode}');
      print('status body ${response.body}');
      print('tokennnnnnnnnnnn ${authProvider.token}');
      var parsedJson = json.decode(response.body);

      if(response.statusCode == 200){
        var data = parsedJson as List;
        _socialMediaList = data.map((e) => SocialMediaModel.fromJson(e)).toList();
      }else{

      }
    }
    catch(error, st){
      print('catch error $error $st');
    }finally{
       _taskLoading=false;
      notifyListeners();
    }
  }

  postInstagramBot(BuildContext context, int id)async{
    try{
      authProvider.loading();
      print('user');
      await authProvider.getToken();
      var response = await http.get(Uri.parse('${Api.baseUrlSocialMedia}instagram_bot/$id/'),
        headers: {
        'Authorization':'Token ${authProvider.token}'
        },

      );


      print('status code ${response.statusCode}');
      print('response body ${response.body}');
      print('tokennnnnnnnnnnn ${authProvider.token}');
      if(response.statusCode == 200){
        Navigator.pop(context);
        Provider.of<AuthProvider>(Values.navigatorKey.currentContext!, listen: false).showError('Your reward will reflect into your wallet  24 hours or less after verification.', 'Alert', Values.navigatorKey.currentContext!);
        getInstagramPost( context);
        Provider.of<LevelProvider>(context,listen: false).getCompletedTasks();
        Provider.of<LevelProvider>(context,listen: false).getLevels();
        Provider.of<HomeProvider>(context,listen: false).getHomeData();
      }
     // Navigator.pop(context);
    }
    catch(error,st){
      print('catch error $error $st');
    }
    finally{
      notifyListeners();
    }
  }

  getFacebookPost(BuildContext context)async{
    try{
      _facebookTaskLoading=true;
      _facebookMediaList=[];
      await authProvider.getToken();
      var response = await http.get(Uri.parse('${Api.baseUrlSocialMedia}facebook_post/'),
        headers: {
          'Authorization':'Token ${authProvider.token}'
        },
      );
      print('status code ${response.statusCode}');
      print('status body ${response.body}');
      print('tokennnnnnnnnnnn ${authProvider.token}');
      var parsedJson = json.decode(response.body);

      if(response.statusCode == 200){
        var data = parsedJson as List;
        _facebookMediaList = data.map((e) => SocialMediaModel.fromJson(e)).toList();
      }else{

      }
    }
    catch(error, st){
      print('catch error $error $st');
    }finally{
      _facebookTaskLoading=false;
      notifyListeners();
    }

  }
  PostFacebookBot(BuildContext context, int id)async{
    try{
      authProvider.loading();
      var response = await http.get(Uri.parse('${Api.baseUrlSocialMedia}facebook_bot/$id/'),
        headers: {
          'Authorization':'Token ${authProvider.token}'
        },
      );
      print('status code ${response.statusCode}');
      print('status body ${response.body}');
      print('tokennnnnnnnnnnn ${authProvider.token}');
      if(response.statusCode == 200){
        Navigator.pop(context);
        Provider.of<AuthProvider>(Values.navigatorKey.currentContext!, listen: false).showError('Your reward will reflect into your wallet  24 hours or less after verification.', 'Alert', Values.navigatorKey.currentContext!);
        getFacebookPost( context);
        Provider.of<LevelProvider>(context,listen: false).getCompletedTasks();
        Provider.of<LevelProvider>(context,listen: false).getLevels();
        Provider.of<HomeProvider>(context,listen: false).getHomeData();
      }
      // Navigator.pop(context);
    }
    catch(error,st){
      print('catch error $error $st');
    }
    finally{
      notifyListeners();
    }
  }


  List<SocialMediaModel> get socialTasksList => _socialMediaList;
  bool get taskLoading => _taskLoading;
  List<SocialMediaModel> get facebookTasksList => _facebookMediaList;
  bool get facebookTaskLoading => _facebookTaskLoading;
}

