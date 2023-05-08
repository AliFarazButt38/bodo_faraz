import 'dart:convert';
import 'dart:io';

import 'package:bodoo_flutter/Models/user_model.dart';
import 'package:bodoo_flutter/Services/api.dart';
import 'package:bodoo_flutter/Views/Pages/dashboard.dart';
import 'package:bodoo_flutter/Views/Pages/email_verification.dart';
import 'package:bodoo_flutter/Views/Pages/signin.dart';
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
  UserModel? _userModel;
  String _accessToken = '';
  String _email = '';
  String _fcmToken = '';
  String _platform = '';


  setAccessToken( String token){
    _accessToken = token;
  }
  setEmail( String email){
    _email = email;
  }

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
  setFcmToken(String token){
    _fcmToken = token;
  }
  setPlatform(){
    if (Platform.isAndroid) {
      // Android-specific code
      _platform = 'android';

    } else if (Platform.isIOS) {
      // iOS-specific code
      _platform = 'ios';

    }
    print('platform $_platform');
    notifyListeners();
  }

  signup(String name,email,password,referal_code,phone,dob,country,city,facebook_url,instagram_username,BuildContext context)async {
    try {
      loading();
      print('phone $phone');
      var response = await http.post(
          Uri.parse('${Api.baseUrlAccount}register/'),
          body: {
            'first_name': name,
            'email': email,
            'password': password,
            'referral_code': referal_code,
            'contact_no': phone,
            'dob': dob,
            'country': country,
            'city': city,
            'facebook_profile_url': facebook_url,
            'instagram_username': instagram_username,
            'registration_id': _fcmToken,
            'type': _platform,

          }
      );
      print('status code ${response.statusCode}');
      print('response signup ${response.body}');
      var parsedJson = json.decode(response.body);
      if (response.statusCode == 200) {
        Navigator.of(context).pop();
        if (parsedJson.containsKey('message')) {
          //toast(parsedJson['message'],Palette.baseElementGreen);
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => EmailVerification()));
        }
      } else {
        Navigator.of(context).pop();
        // if(parsedJson.containsKey('email')){
        //   toast(parsedJson['email'].toString(),Colors.red);
        // }else{
        toast(parsedJson.toString(), Colors.red);
        // }
      }
    } catch (error, st) {
      // Navigator.of(context).pop();
      print('catch error in authprovider signup $error $st');
    } finally {
      notifyListeners();
    }
  }


    userdtails(String name,referal_code,phone,dob,country,city,facebook_url,instagram_username,BuildContext context)async{
    try{
      print('access token $_accessToken  email $_email');
      loading();
      print('phone $phone');
      var response = await http.post(Uri.parse('${Api.baseUrlAccount}register/google/'),
          body: {
            'first_name':name,
            'email':_email,
            'referral_code':referal_code,
            'contact_no':phone,
            'dob':dob,
            'country':country,
            'city':city,
            'access_token':_accessToken,
            'facebook_profile_url':facebook_url,
            'instagram_username':instagram_username,
            'registration_id': _fcmToken,
            'type': _platform,

          }
      );
      print('status code ${response.statusCode}');
      print('response signup ${response.body}');
      var parsedJson = json.decode(response.body);
      if(response.statusCode == 200){
        Navigator.of(context).pop();
        if(parsedJson['message'] == 'User registered successfully'){
          //toast(parsedJson['message'],Palette.baseElementGreen);
          setToken(parsedJson['token']);
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Dashboard()), (route) => false);
        }
      }else{
        Navigator.of(context).pop();
        // if(parsedJson.containsKey('email')){
        //   toast(parsedJson['email'].toString(),Colors.red);
        // }else{
        toast(parsedJson.toString(),Colors.red);
        // }
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
      print('device token $_fcmToken  device type $_platform');
      loading();
      var response = await http.post(Uri.parse('${Api.baseUrlAccount}login/'),
          body: {

            'email':email,
            'password':password,
            'device_token':_fcmToken,
            'device_type':_platform,

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

  googleSignin(String email,accessToke,BuildContext context)async{
    try{
      print('access token $accessToke  email $email');
      loading();
      var response = await http.post(Uri.parse('${Api.baseUrlAccount}google/login/'),
          body: {

            'email':email,
             'access_token':accessToke,
            'password':'',
            'device_token':_fcmToken,
            'device_type':_platform,


          }
      );
      print('status code ${response.statusCode}');
      print('response googleSignin ${response.body}');
      var parsedJson = json.decode(response.body);
      if(response.statusCode == 200){
        Navigator.of(context).pop();
        if(parsedJson['message'] == 'Successfully'){
          //toast(parsedJson['message'],Palette.baseElementGreen);

          setToken(parsedJson['token']);
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Dashboard()), (route) => false);
        }

      }else{
        Navigator.of(context).pop();
        if(parsedJson.containsKey('email')){
          toast(parsedJson['email'].toString(),Colors.red);
        }else if(parsedJson.containsKey('error')){
          toast(parsedJson['error'].toString(),Colors.red);
        }
      }
    }catch(error, st){
      //Navigator.of(context).pop();
      print('catch error in authprovider googleSignin $error $st');
    }finally{
      notifyListeners();
    }
  }

  forgotPassword(String email,BuildContext context)async{
    try{
      loading();
      var response = await http.post(Uri.parse('${Api.baseUrlAccount}password_reset/'),
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

  // verifyEmail(String token,BuildContext context)async{
  //   try{
  //     loading();
  //     var response = await http.get(Uri.parse('${Api.baseUrlAccount}verify-email/$token/'),
  //
  //     );
  //     print('status code ${response.statusCode}');
  //     print('response verifyEmail ${response.body}');
  //     //var parsedJson = json.decode(response.body);
  //     if(response.statusCode == 200){
  //       Navigator.of(context).pop();
  //       //  if(parsedJson['message'] == 'sucessfull'){
  //       //toast(parsedJson['message'],Palette.baseElementGreen);
  //       // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Dashboard()), (route) => false);
  //       // }
  //       toast('Your Email has been verify', Palette.baseElementGreen);
  //       Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Signin()), (route) => false);
  //
  //     }else{
  //       Navigator.of(context).pop();
  //       // if(parsedJson.containsKey('email')){
  //       //   toast(parsedJson['email'].toString(),Colors.red);
  //       // }
  //     }
  //   }catch(error, st){
  //     print('catch error in authprovider verifyEmail $error $st');
  //   }finally{
  //     notifyListeners();
  //   }
  // }
  verifyEmail(String token,BuildContext context) async {
    try{
      loading();
      var response = await http.get(Uri.parse('${Api.baseUrlAccount}verify-email/$token/'));

      print('status code ${response.statusCode}');
      print('response verifyEmail ${response.body}');

      var parsedJson = json.decode(response.body);
      if(response.statusCode == 200) {
        Navigator.of(context).pop();
        toast('Your Email has been verified', Palette.baseElementGreen);

        // Save the token and navigate to the dashboard
        setToken(parsedJson['token']);
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Dashboard()), (route) => false);
      } else {
        Navigator.of(context).pop();
      }
    } catch(error, st) {
      print('catch error in authprovider verifyEmail $error $st');
    } finally {
      notifyListeners();
    }
  }


  resetPassword(String token,password,BuildContext context)async{
    try{
      loading();
      var response = await http.post(Uri.parse('${Api.baseUrlAccount}password_reset/confirm/'),
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
          toast('Password has been changes', Palette.baseElementGreen);
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Signin()), (route) => false);
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
      var response = await http.get(Uri.parse('${Api.baseUrlApi}invite-friend/'),
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

  userProfile(BuildContext context)async{
    try{
     // loading();
      await getToken();
      var response = await http.get(Uri.parse('${Api.baseUrlAccount}profile/'),
        headers: {
          'Authorization':'Token $_token'
        },
      );
      print('status code ${response.statusCode}');
      print('response userProfile ${response.body}');
      var parsedJson = json.decode(response.body);
      if(response.statusCode == 200){

        _userModel = UserModel.fromJson(parsedJson);
       // Navigator.of(context).pop();

        //Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Signin()), (route) => false);

      }else{
        //Navigator.of(context).pop();

      }
    }catch(error, st){
      //Navigator.of(context).pop();
      print('catch error in authprovider userProfile $error $st');
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

  checkLoggedIn() async {
    await getToken();
    if(_token == null){
      return true;
    }else{
      return false;
    }
  }

  logout() async {

    await getToken();
    if(_token != null){
      final prefs = await SharedPreferences.getInstance();
      prefs.remove('token');
      Navigator.of(Values.navigatorKey.currentContext!).pushAndRemoveUntil(PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => const Signin(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return child;
        },
      ), (route) => false);
    }
  }

  String get inviteUrl => _inviteUrl;
  UserModel? get user => _userModel;
  String? get token => _token;
}