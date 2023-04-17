import 'dart:convert';

import 'package:bodoo_flutter/Models/download_app_model.dart';
import 'package:bodoo_flutter/Providers/auth_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../Services/api.dart';
import '../Theme/palette.dart';
import 'home_provider.dart';
import 'level_provider.dart';

class DownloadAppsProvider extends ChangeNotifier{
  AuthProvider authProvider = AuthProvider();
  List<DownloadAppModel> _downloadAppList = [];
  bool _downloadAppLoading = false;

  getDownloadAppUrls()async{
    try{
      _downloadAppLoading = true;
      await authProvider.getToken();
      var response = await http.get(Uri.parse('${Api.baseUrlApi}add_playstore_link/'),
        headers: {
          'Authorization':'Token ${authProvider.token}'
        },
      );
      print('status code ${response.statusCode}');
      print('response getDownloadAppUrls ${response.body}');
      var parsedJson = json.decode(response.body);
      if(response.statusCode == 200){
        var data = parsedJson as List;
        _downloadAppList = data.map((e) => DownloadAppModel.fromJson(e)).toList();
        //Navigator.of(context).pop();
        // if(parsedJson['message'] == 'sucessfull'){
        //   //toast(parsedJson['message'],Palette.baseElementGreen);
        //   setToken(parsedJson['token']);
        //   Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Dashboard()), (route) => false);
        // }

        print('list length ${_downloadAppList.length}');
      }else{
       // Navigator.of(context).pop();
        // if(parsedJson.containsKey('email')){
        //   toast(parsedJson['email'].toString(),Colors.red);
        // }
      }
    }catch(error, st){
      //Navigator.of(context).pop();
      print('catch error in DownloadAppUrlsProvider getDownloadAppUrls $error $st');
    }finally{
      _downloadAppLoading = false;
      notifyListeners();
    }
  }

  postDownloadApp(String url,BuildContext context)async{
    try{
        authProvider.loading();
      await authProvider.getToken();


      var response = await http.post(Uri.parse('${Api.baseUrlApi}download_app/'),
        body: {
          'playstore_link':url
        },
        headers: {
          'Authorization':'Token ${authProvider.token}'
        },
      );
      print('status code ${response.statusCode}');
      print('response postDownloadApp ${response.body}');
      var parsedJson = json.decode(response.body);
      if(response.statusCode == 201){
        Navigator.of(context).pop();
        Navigator.of(context).pop();
        Provider.of<LevelProvider>(context,listen: false).getCompletedTasks();
        Provider.of<LevelProvider>(context,listen: false).getLevels();
        Provider.of<HomeProvider>(context,listen: false).getHomeData();
      }else{
        Navigator.of(context).pop();
        Navigator.of(context).pop();
        authProvider.toast('The app is already installed', Palette.baseElementGreen);
      }
    }catch(error, st){
      //Navigator.of(context).pop();
      print('catch error in videoProvider postDownloadApp $error $st');
    }finally{

      notifyListeners();
    }
  }

  List<DownloadAppModel> get appsList => _downloadAppList;
  bool get appsLoading => _downloadAppLoading;

}