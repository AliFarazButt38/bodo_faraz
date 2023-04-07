import 'package:bodoo_flutter/Models/user_model.dart';

class TaskLevelModel{
  //UserModel user;
  double totalReward;
  int level,remainingTasks;

  TaskLevelModel({
 //  required this.user,
   required this.level,
   required this.totalReward,
    required this.remainingTasks
});

  factory TaskLevelModel.fromJson(Map<String, dynamic> data)
  {
   // UserModel user = UserModel.fromJson(data['user']);
    return TaskLevelModel( remainingTasks: data['remaining_tasks'],level: data['level'], totalReward: double.parse(data['total_reward'].toString()));
  }

}