import 'package:bodoo_flutter/Models/user_model.dart';

class CommunityModel {
  int id;
  String name,email;
  List<Community> cReferralsList;



  CommunityModel({
    required this.id,
    required this.email,
    required this.name,
    required this.cReferralsList
});


  factory CommunityModel.fromJson(Map<String, dynamic> data){


    var dataList = data['invited_user'] as List;
    List<Community> userList = dataList.map((e) => Community.fromJson(e)).toList();

    return CommunityModel(id: data['id'], name: data['first_name'], email: data['email'], cReferralsList: userList);
  }
}


class Community{
  int id;
  String name,email;

  Community({
   required this.id,
   required this.name,
   required this.email
});

  factory Community.fromJson(Map<String,dynamic> data){
    return Community(id: data['id'], name: data['first_name'], email: data['email']);
  }
}