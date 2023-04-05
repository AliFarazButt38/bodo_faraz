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
  CommunityModel? _communityModel;

  getUserCommunity(BuildContext context)async{
    try{

      await authProvider.getToken();
      var response = await http.get(Uri.parse('${Api.baseUrlAccount}community/${Provider.of<AuthProvider>(context,listen: false).user!.id}/'),
        headers: {
          'Authorization':'Token ${authProvider.token}'
        },
      );
      print('status code ${response.statusCode}');
      print('response getUserCommunity ${response.body}');
      var parsedJson = json.decode(response.body);
      if(response.statusCode == 200){
        _communityModel = CommunityModel.fromJson(parsedJson);
      }else{
      }

    }catch(error, st){
      //Navigator.of(context).pop();
      print('catch error in CommunityProvider getUserCommunity $error $st');
    }finally{

      notifyListeners();
    }
  }

  CommunityModel? get community => _communityModel;
}