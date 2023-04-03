class WalletModel {
int availablePoint,todayEarnings;

WalletModel({
  required this.availablePoint,
  required this.todayEarnings
});

factory WalletModel.fromJson(Map<String,dynamic> data){
  return WalletModel(availablePoint: data['available_points'], todayEarnings: data['today_earnings']);
}
}