import 'package:bodoo_flutter/Models/user_model.dart';

class CommunityModel {
  UserModel user;
  List<UserModel> referralsList;

  CommunityModel({
    required this.user,
    required this.referralsList
});


  factory CommunityModel.fromJson(Map<String, dynamic> data){

    UserModel user = UserModel.fromJson(data['user']);
    var dataList = data['referred_users'] as List;
    List<UserModel> userList = dataList.map((e) => UserModel.fromJson(e)).toList();

    return CommunityModel(user: user, referralsList: userList);
  }
}