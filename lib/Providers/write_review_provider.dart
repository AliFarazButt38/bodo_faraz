import 'dart:convert';

import 'package:bodoo_flutter/Models/write_review_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../Services/api.dart';
import '../Theme/palette.dart';
import 'auth_provider.dart';


class WriteReviewProvider extends ChangeNotifier{
  AuthProvider authProvider = AuthProvider();
  List<WriteReviewModel> _reviewsList = [];
  bool _reviewsLoading = false;

  getReviewsList()async{
    try{
      _reviewsLoading = true;
      await authProvider.getToken();
      var response = await http.get(Uri.parse('${Api.baseUrlApi}list_review/'),
        headers: {
          'Authorization':'Token ${authProvider.token}'
        },
      );
      print('status code ${response.statusCode}');
      print('response getReviewsList ${response.body}');
      var parsedJson = json.decode(response.body);
      if(response.statusCode == 200){
        var data = parsedJson as List;
        _reviewsList = data.map((e) => WriteReviewModel.fromJson(e)).toList();
      }else{
      }
    }catch(error, st){
      //Navigator.of(context).pop();
      print('catch error in WriteReviewProvider getReviewsList $error $st');
    }finally{
      _reviewsLoading = false;
      notifyListeners();
    }
  }

  postReviewSubmit(int id,BuildContext context)async{
    try{
      authProvider.loading();
      _reviewsLoading = true;
      await authProvider.getToken();
      var response = await http.post(Uri.parse('${Api.baseUrlApi}add_review/'),
        headers: {
          'Authorization':'Token ${authProvider.token}'
        },
        body: {
        'add_review_id':id.toString()
        }
      );
      print('status code ${response.statusCode}');
      print('response postReviewSubmit ${response.body}');
      var parsedJson = json.decode(response.body);
      if(response.statusCode == 200){
        Navigator.of(context).pop();
        authProvider.toast('Review has been submitted successfully', Palette.baseElementGreen);
      }else{
        if(parsedJson.containsKey('error')){
          Navigator.of(context).pop();
          authProvider.toast(parsedJson['error'], Colors.red);
        }
      }
    }catch(error, st){
      //Navigator.of(context).pop();
      print('catch error in WriteReviewProvider postReviewSubmit $error $st');
    }finally{
      _reviewsLoading = false;
      notifyListeners();
    }
  }

  bool get reviewsLoading => _reviewsLoading;
  List<WriteReviewModel> get reviewsList => _reviewsList;
}