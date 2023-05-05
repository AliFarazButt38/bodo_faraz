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


  PostInstagramBot(BuildContext context)async{
    try{
      var response = await http.get(Uri.parse('${Api.baseUrlSocialMedia}instagram_bot/4/')
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

}