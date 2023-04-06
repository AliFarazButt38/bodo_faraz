import 'dart:convert';

import 'package:bodoo_flutter/Models/community_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import '../Services/api.dart';
import 'auth_provider.dart';

class CommunityProvider extends ChangeNotifier{

  AuthProvider authProvider = AuthProvider();
  List<CommunityModel> _communityModelList = [];
  bool _communityLoading = false;

  getUserCommunity(BuildContext context)async{
    try{
      _communityModelList = [];
      _communityLoading = true;
      await authProvider.getToken();
      print('user id ${Provider.of<AuthProvider>(context,listen: false).user!.id}');
      var response = await http.get(Uri.parse('${Api.baseUrlAccount}community/${Provider.of<AuthProvider>(context,listen: false).user!.id}/'),
        headers: {
          'Authorization':'Token ${authProvider.token}'
        },
      );
      print('status code ${response.statusCode}');
      print('response getUserCommunity ${response.body}');
      var parsedJson = json.decode(response.body);
      if(response.statusCode == 200){
        var data = parsedJson['referred_users'] as List;
        _communityModelList = data.map((e) => CommunityModel.fromJson(e)).toList();
      }else{
      }

    }catch(error, st){
      //Navigator.of(context).pop();
      print('catch error in CommunityProvider getUserCommunity $error $st');
    }finally{
      _communityLoading =  false;
      notifyListeners();
    }
  }

  List<CommunityModel> get communityList => _communityModelList;
  bool get communityLoading => _communityLoading;
}