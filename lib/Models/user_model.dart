import 'package:intl/intl.dart';

//model
class UserModel{
int id;
String userLevel;
String email,name,number,referralLink;
DateTime joinedDate;

UserModel({
  required this.id,
  required this.email,
  required this.number,
  required this.name,
  required this.referralLink,
  required this.userLevel,
  required this.joinedDate,
});

factory UserModel.fromJson(Map<String, dynamic> data){
  DateTime tempDate = new DateFormat("yyyy-MM-dd hh:mm:ss").parse(data['date_joined']);
  return UserModel(joinedDate: tempDate,userLevel: data['user_level']['subscription_name'] ?? '',id: data['id'], email: data['email'], number: data['contact_no']??'', name: data['first_name'], referralLink: data['referral_link']??'');
}
}