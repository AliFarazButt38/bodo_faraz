import 'dart:convert';

import 'package:bodoo_flutter/Services/api.dart';
import 'package:bodoo_flutter/Views/Pages/dashboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../Theme/palette.dart';
import '../Utils/navigator.dart';
import '../Views/Pages/reset_password.dart';

class AuthProvider extends ChangeNotifier{

  String? _token;
  String _inviteUrl = '';

  loading(){
    showDialog(
        context: Values.navigatorKey.currentContext!,
        barrierDismissible: false,
        builder: (context) => const Center(child: CircularProgressIndicator(color: Palette.baseElementGreen,)));
  }

  toast(String message,Color color){
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: color,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }


  signup(String name,email,password,referal_code,BuildContext context)async{
    try{
      loading();
      var response = await http.post(Uri.parse('${Api.baseUrl}register/'),
      body: {
        'first_name':name,
        'email':email,
        'password':password,
        'referral_code':referal_code
      }
      );
      print('status code ${response.statusCode}');
      print('response signup ${response.body}');
      var parsedJson = json.decode(response.body);
      if(response.statusCode == 200){
        Navigator.of(context).pop();
        if(parsedJson.containsKey('message')){
          toast(parsedJson['message'],Palette.baseElementGreen);
        }

      }else{
        Navigator.of(context).pop();
        if(parsedJson.containsKey('email')){
          toast(parsedJson['email'].toString(),Colors.red);
        }
      }
    }catch(error, st){
     // Navigator.of(context).pop();
      print('catch error in authprovider signup $error $st');
    }finally{
      notifyListeners();
    }
  }

  signin(String email,password,BuildContext context)async{
    try{
      loading();
      var response = await http.post(Uri.parse('${Api.baseUrl}login/'),
          body: {

            'email':email,
            'password':password,

          }
      );
      print('status code ${response.statusCode}');
      print('response signin ${response.body}');
      var parsedJson = json.decode(response.body);
      if(response.statusCode == 200){
        Navigator.of(context).pop();
        if(parsedJson['message'] == 'sucessfull'){
          //toast(parsedJson['message'],Palette.baseElementGreen);
          setToken(parsedJson['token']);
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Dashboard()), (route) => false);
        }

      }else{
        Navigator.of(context).pop();
        if(parsedJson.containsKey('email')){
          toast(parsedJson['email'].toString(),Colors.red);
        }
      }
    }catch(error, st){
      //Navigator.of(context).pop();
      print('catch error in authprovider signup $error $st');
    }finally{
      notifyListeners();
    }
  }

  forgotPassword(String email,BuildContext context)async{
    try{
      loading();
      var response = await http.post(Uri.parse('${Api.baseUrl}password_reset/'),
          body: {
            'email':email,
          }
      );
      print('status code ${response.statusCode}');
      print('response forgotPassword ${response.body}');
      //var parsedJson = json.decode(response.body);
      if(response.statusCode == 200){
        Navigator.of(context).pop();
      //  if(parsedJson['message'] == 'sucessfull'){
          //toast(parsedJson['message'],Palette.baseElementGreen);
         // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Dashboard()), (route) => false);
       // }
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ResetPassword()));

      }else{
        // Navigator.of(context).pop();
        // if(parsedJson.containsKey('email')){
        //   toast(parsedJson['email'].toString(),Colors.red);
        // }
      }
    }catch(error, st){
      //Navigator.of(context).pop();
      print('catch error in authprovider forgotPassword $error $st');
    }finally{
      notifyListeners();
    }
  }

  resetPassword(String token,password,BuildContext context)async{
    try{
      loading();
      var response = await http.post(Uri.parse('${Api.baseUrl}password_reset/confirm/'),
          body: {
            'token':token,
            'password':password
          }
      );
      print('status code ${response.statusCode}');
      print('response forgotPassword ${response.body}');
      var parsedJson = json.decode(response.body);
      if(response.statusCode == 200){
        Navigator.of(context).pop();
        if(parsedJson['status'] == 'OK'){
          print('ok 1');
         // navigations.openSignIn(Values.navigatorKey.currentContext!);
        }

      }else{
        if(parsedJson.containsKey('password')){
         // showError(parsedJson['password'].toString(),'Alert');
        }else{
         // showError(parsedJson['detail'].toString(),'Alert');
        }
      }
    }catch(error, st){
      //Navigator.of(context).pop();
      print('catch error in authprovider resetPassword $error $st');
    }finally{
      notifyListeners();
    }
  }


  inviteFirends(BuildContext context)async{
    try{
     // loading();
      await getToken();
      var response = await http.get(Uri.parse('${Api.baseUrl}invite-friend/'),
        headers: {
          'Authorization':'Token $_token'
        },
      );
      print('status code ${response.statusCode}');
      print('response invite friends ${response.body}');
      var parsedJson = json.decode(response.body);
      if(response.statusCode == 200){
        //Navigator.of(context).pop();
        //  if(parsedJson['message'] == 'sucessfull'){
        //toast(parsedJson['message'],Palette.baseElementGreen);
        //Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Dashboard()), (route) => false);
        // }

        _inviteUrl = parsedJson['invited_url'];
      }else{
        // Navigator.of(context).pop();
        // if(parsedJson.containsKey('email')){
        //   toast(parsedJson['email'].toString(),Colors.red);
        // }
      }
    }catch(error, st){
      //Navigator.of(context).pop();
      print('catch error in authprovider invite friends $error $st');
    }finally{
      notifyListeners();
    }
  }

  setToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
  }

  getToken() async {
    final prefs = await SharedPreferences.getInstance();
    _token = await prefs.getString('token');
    notifyListeners();
  }

  String get inviteUrl => _inviteUrl;
}