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