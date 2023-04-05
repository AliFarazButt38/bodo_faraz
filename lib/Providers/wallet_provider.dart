import 'dart:convert';

import 'package:bodoo_flutter/Models/referral_model.dart';
import 'package:bodoo_flutter/Models/wallet_model.dart';
import 'package:bodoo_flutter/Providers/auth_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../Services/api.dart';


class WalletProvider extends ChangeNotifier{

  AuthProvider authProvider = AuthProvider();
  WalletModel? _walletModel;
  ReferralModel? _referralModel;

  getWallet()async{
    try{

      await authProvider.getToken();
      var response = await http.get(Uri.parse('${Api.baseUrlApi}wallet/'),
        headers: {
          'Authorization':'Token ${authProvider.token}'
        },
      );
      print('status code ${response.statusCode}');
      print('response getWallet ${response.body}');
      var parsedJson = json.decode(response.body);
      if(response.statusCode == 200){
        _walletModel = WalletModel.fromJson(parsedJson);
      }else{
      }
    }catch(error, st){
      //Navigator.of(context).pop();
      print('catch error in WalletProvider getWallet $error $st');
    }finally{

      notifyListeners();
    }
  }

  getPostpondReward()async{
    try{

      await authProvider.getToken();
      var response = await http.get(Uri.parse('${Api.baseUrlAccount}postpond/reward/'),
        headers: {
          'Authorization':'Token ${authProvider.token}'
        },
      );
      print('status code ${response.statusCode}');
      print('response getPostpondReward ${response.body}');
      var parsedJson = json.decode(response.body);
      if(response.statusCode == 200){
        _referralModel = ReferralModel.fromJson(parsedJson);
      }else{
      }
    }catch(error, st){
      //Navigator.of(context).pop();
      print('catch error in WalletProvider getPostpondReward $error $st');
    }finally{

      notifyListeners();
    }
  }

  getGraphValues()async{
    try{

      await authProvider.getToken();
      var response = await http.get(Uri.parse('${Api.baseUrlApi}graph/value/'),
        headers: {
          'Authorization':'Token ${authProvider.token}'
        },
      );
      print('status code ${response.statusCode}');
      print('response getGraphValues ${response.body}');
      var parsedJson = json.decode(response.body);
      if(response.statusCode == 200){
      //  _referralModel = ReferralModel.fromJson(parsedJson);
      }else{
      }
    }catch(error, st){
      //Navigator.of(context).pop();
      print('catch error in WalletProvider getGraphValues $error $st');
    }finally{

      notifyListeners();
    }
  }

  WalletModel? get walletModel => _walletModel;
  ReferralModel? get referralModel => _referralModel;
}