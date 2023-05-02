import 'dart:convert';

import 'package:bodoo_flutter/Paymob_integ/constant.dart';
import 'package:bodoo_flutter/Services/api.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class PaymentProvider extends ChangeNotifier{

  String _authToken = '';
  String _orderId = '';
  String _finalPaymentToken = '';
  String _refCode = '';

  getAuthToken()async{
    try{

      var response = await http.post(Uri.parse('${ApiConstant.paymentBaseUrl}${ApiConstant.authToken}'),
        body: {
        'api_key':ApiConstant.apiKey
        }
      );
      print('status code ${response.statusCode}');
      print('response getAuthToken ${response.body}');
      var parsedJson = json.decode(response.body);
      if(response.statusCode == 200){
        _authToken = parsedJson['token'];
      }else{
      }

    }catch(error, st){

      print('catch error in PaymentProvider getAuthToken $error $st');
    }finally{

      notifyListeners();
    }
  }

  orderRegisteration()async{
    try{

      var response = await http.post(Uri.parse('${ApiConstant.paymentBaseUrl}${ApiConstant.orderReg}'),
          body: {
            "auth_token":  _authToken,
            "delivery_needed": "false",
            "amount_cents": "100",
            "currency": "EGP",
            "items": [],
          }
      );
      print('status code ${response.statusCode}');
      print('response orderRegisteration ${response.body}');
      var parsedJson = json.decode(response.body);
      if(response.statusCode == 200){
        _orderId = parsedJson['id'].toString();
      }else{
      }

    }catch(error, st){

      print('catch error in PaymentProvider orderRegisteration $error $st');
    }finally{

      notifyListeners();
    }
  }

  getPaymentKey()async{
    try{

      var response = await http.post(Uri.parse('${ApiConstant.paymentBaseUrl}${ApiConstant.paymentKey}'),
          body: {
            "auth_token": _authToken,
            "amount_cents": "100",
            "expiration": 3600,
            "order_id": _orderId,
            "billing_data": {
              "apartment": "NA",
              "email": "claudette09@exa.com",
              "floor": "NA",
              "first_name": "Clifford",
              "street": "NA",
              "building": "NA",
              "phone_number": "+86(8)9135210487",
              "shipping_method": "NA",
              "postal_code": "NA",
              "city": "NA",
              "country": "NA",
              "last_name": "Nicolas",
              "state": "NA"
            },
            "currency": "EGP",
            "integration_id": 1,
            "lock_order_when_paid": "false"
          }
      );
      print('status code ${response.statusCode}');
      print('response getPaymentKey ${response.body}');
      var parsedJson = json.decode(response.body);
      if(response.statusCode == 200){
        _finalPaymentToken = parsedJson['token'];
      }else{
      }

    }catch(error, st){

      print('catch error in PaymentProvider getPaymentKey $error $st');
    }finally{

      notifyListeners();
    }
  }

  getRefCode()async{
    try{

      var response = await http.post(Uri.parse('${ApiConstant.paymentBaseUrl}${ApiConstant.getRefCode}'),
          body: {
            "source": {
              "identifier": "AGGREGATOR",
              "subtype": "AGGREGATOR",
            },
            "payment_token": _finalPaymentToken,
          },
      );
      print('status code ${response.statusCode}');
      print('response getRefCode ${response.body}');
      var parsedJson = json.decode(response.body);
      if(response.statusCode == 200){
        _refCode = parsedJson['id'].toString();
      }else{
      }

    }catch(error, st){

      print('catch error in PaymentProvider getRefCode $error $st');
    }finally{

      notifyListeners();
    }
  }
}