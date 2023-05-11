import 'dart:convert';

import 'package:bodoo_flutter/Models/socialmedia_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../Services/api.dart';
import 'auth_provider.dart';

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
      print('user');
      var response = await http.get(Uri.parse('${Api.baseUrlSocialMedia}instagram_bot/1/')
      );
      print('status code ${response.statusCode}');
      print('response body ${response.body}');
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
  PostFacebookBot(BuildContext context)async{
    try{
      var response = await http.get(Uri.parse('${Api.baseUrlSocialMedia}facebook_bot/2/')
      );
      print('status code ${response.statusCode}');
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