import 'package:bodoo_flutter/Models/home_model.dart';
import 'package:flutter/cupertino.dart';
import 'dart:convert';
import 'package:bodoo_flutter/Providers/auth_provider.dart';
import 'package:http/http.dart' as http;

import '../Services/api.dart';

class HomeProvider extends ChangeNotifier{

  AuthProvider authProvider = AuthProvider();
  HomeModel? _homeModel;

  getHomeData()async{
    try{

      await authProvider.getToken();
      var response = await http.get(Uri.parse('${Api.baseUrlApi}total/task/completed/'),
        headers: {
          'Authorization':'Token ${authProvider.token}'
        },
      );
      print('status code ${response.statusCode}');
      print('response getHomeData ${response.body}');
      var parsedJson = json.decode(response.body);
      if(response.statusCode == 200){
        _homeModel = HomeModel.fromJson(parsedJson);
      }else{
      }
    }catch(error, st){
      //Navigator.of(context).pop();
      print('catch error in HomeProvider getHomeData $error $st');
    }finally{

      notifyListeners();
    }
  }

  HomeModel? get homeModel => _homeModel;
}