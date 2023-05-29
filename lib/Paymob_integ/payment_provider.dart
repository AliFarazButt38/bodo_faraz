import 'dart:convert';
import 'package:bodoo_flutter/Paymob_integ/constant.dart';
import 'package:bodoo_flutter/Paymob_integ/mobile_wallet_webview.dart';
import 'package:bodoo_flutter/Providers/auth_provider.dart';
import 'package:bodoo_flutter/Services/api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../Utils/navigator.dart';

class PaymentProvider extends ChangeNotifier{

  String _authToken = '';
  String _orderId = '';
  String _finalPaymentToken = '';
  String _refCode = '';
  String _rediUrl = '';
  AuthProvider _authProvider = AuthProvider();

  void printWrapped(String text) {
    final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
    pattern.allMatches(text).forEach((match) => print(match.group(0)));
  }


  getAuthToken()async{
    try{
      print('working auth');
      var response = await http.post(Uri.parse('${ApiConstant.paymentBaseUrl}${ApiConstant.authToken}'),
        body:json.encode({
          'api_key':ApiConstant.apiKey
        }) ,
        headers: {"Content-Type": "application/json"},
      );
      print('status code ${response.statusCode}');
      //print('response getAuthToken ${response.body}');
      var parsedJson = json.decode(response.body);
      if(response.statusCode == 201){
        _authToken = parsedJson['token'];
        orderRegisteration();
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
      print('auth token $_authToken');
      var response = await http.post(Uri.parse('${ApiConstant.paymentBaseUrl}${ApiConstant.orderReg}'),
          body:json.encode({
            "auth_token":  _authToken,
            "delivery_needed": "false",
            "amount_cents": "100",
            "currency": "EGP",
            "items": [],
          }),
        headers: {"Content-Type": "application/json"},
      );
      print('status code ${response.statusCode}');
     // print('response orderRegisteration ${response.body}');
      var parsedJson = json.decode(response.body);
      if(response.statusCode == 201){
        _orderId = parsedJson['id'].toString();
        print('order id $_orderId');
        getPaymentKey();
      //  getPaymentKey('test@gmail.com','03333333333','test first','test last','10');
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
      var auth = Provider.of<AuthProvider>(Values.navigatorKey.currentContext!,listen: false).user;
      print('order id $_orderId');
      var map = {
        "auth_token": _authToken,
        "amount_cents": '100',
        "expiration": 3600,
        "order_id": _orderId,
        "billing_data": {
          "apartment": "NA",
          "email": auth!.email,
          "floor": "NA",
          "first_name": auth.name,
          "street": "NA",
          "building": "NA",
          "phone_number": auth.number,
          "shipping_method": "NA",
          "postal_code": "NA",
          "city": "NA",
          "country": "NA",
          "last_name": "NA",
          "state": "NA"
        },
        "currency": "EGP",
        "integration_id": 3078429,

      };
     // "lock_order_when_paid": "false"
      var response = await http.post(Uri.parse('${ApiConstant.paymentBaseUrl}${ApiConstant.paymentKey}'),
          body: json.encode(map),
        headers: {"Content-Type": "application/json"},
      );
      print('status code ${response.statusCode}');
      print('response getPaymentKey ${response.body}');
      var parsedJson = json.decode(response.body);
      if(response.statusCode == 201){
        _finalPaymentToken = parsedJson['token'];
        //getRefCode();
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
          body: json.encode({
            "source": {
              "identifier": "AGGREGATOR",
              "subtype": "AGGREGATOR",
            },
            "payment_token": _finalPaymentToken,
          }),
        headers: {"Content-Type": "application/json"},
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

  getMobileWalletUrl(String number)async{
    try{
     // 01010101010
      _authProvider.loading();
      print('final token $_finalPaymentToken');
      var response = await http.post(Uri.parse('${ApiConstant.paymentBaseUrl}${ApiConstant.getMobileWallet}'),
        body: json.encode({
          "source": {
            "identifier": number,
            "subtype": "WALLET"
          },
          "payment_token": _finalPaymentToken // token obtained in step 3
        }),
        headers: {"Content-Type": "application/json"},
      );
      print('status code ${response.statusCode}');
      printWrapped(' response getMobileWalletUrl body  ${response.body}');
      //print('response getMobileWalletUrl ${response.body}');
      var parsedJson = json.decode(response.body);
      if(response.statusCode == 200){

        print('url ${parsedJson['redirection_url']}');
        _rediUrl = parsedJson['redirection_url'];
        Navigator.pop(Values.navigatorKey.currentContext!);
        Navigator.push(Values.navigatorKey.currentContext!, MaterialPageRoute(builder: (context) => MobileWalletWebview()));
       // _refCode = parsedJson['id'].toString();
      }else{
        Navigator.pop(Values.navigatorKey.currentContext!);
      }

    }catch(error, st){

      print('catch error in PaymentProvider getMobileWalletUrl $error $st');
    }finally{

      notifyListeners();
    }
  }

  String get finalPayToken => _finalPaymentToken;
  String get referenceCode => _refCode;
  String get redirectionUrl => _rediUrl;
}