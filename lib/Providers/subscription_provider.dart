import 'dart:convert';

import 'package:bodoo_flutter/Models/subscription_model.dart';
import 'package:bodoo_flutter/Services/api.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class SubscriptionPlanProvider extends ChangeNotifier{

  SubscriptionModel? _subscriptionModel;

  getSubscriptionPlan(BuildContext context)async{
    try{
      var response = await http.get(Uri.parse('${Api.baseUrlPlan}subscription_plans/')
      );
      print('status code ${response.statusCode}');
      print('status body ${response.body}');
      var parsedJson = json.decode(response.body);
      if(response.statusCode == 200){
        var data  = parsedJson as List;
       // List<SubscriptionModel> _list = data.map((e) => SubscriptionModel.fromJson(e)).toList();
        _subscriptionModel = SubscriptionModel.fromJson(data[0]);
        print('model  ${_subscriptionModel!.name}');
      }
    }
    catch(error,st){
      print('catch error $error $st');
    }
    finally{
      notifyListeners();
    }
  }
SubscriptionModel? get subscriptionModel=> _subscriptionModel;
}