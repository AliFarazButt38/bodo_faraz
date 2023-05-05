import 'package:flutter/material.dart';
class SocialMediaModel{
  int id,rewardPoints;
  String username,url,action,status;

  SocialMediaModel({
    required this.id,
    required this.username,
    required this.url,
    required this.action,
    required this.rewardPoints,
    required this.status,

});
  factory SocialMediaModel.fromJson(Map<String, dynamic> data){

    return SocialMediaModel(id: data['id'], username: data['instagram_username'], url: data['post_url'], action: data['action'],rewardPoints: data['reward_points'],status: data['status']);
  }
}
