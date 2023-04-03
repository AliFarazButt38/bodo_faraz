import 'package:bodoo_flutter/Models/user_model.dart';

class TaskLevelModel{
  UserModel user;
  double totalReward;
  int level;

  TaskLevelModel({
   required this.user,
   required this.level,
   required this.totalReward
});

  factory TaskLevelModel.fromJson(Map<String, dynamic> data)
  {
    UserModel user = UserModel.fromJson(data['user']);
    return TaskLevelModel(user: user, level: data['level'], totalReward: double.parse(data['total_reward'].toString()));
  }

}