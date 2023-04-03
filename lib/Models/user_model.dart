class UserModel{
int id;
String email,name,number,referralLink;

UserModel({
  required this.id,
  required this.email,
  required this.number,
  required this.name,
  required this.referralLink
});

factory UserModel.fromJson(Map<String, dynamic> data){
  return UserModel(id: data['id'], email: data['email'], number: data['contact_no']??'', name: data['first_name'], referralLink: data['referral_link']??'');
}
}