class ReferralModel{
  double totalEarning,todayEarning;
  int accounts;

  ReferralModel({
   required this.accounts,
   required this.todayEarning,
    required this.totalEarning
});

  factory ReferralModel.fromJson(Map<String,dynamic> data){
    return ReferralModel(accounts: data['referral_count'] ?? 0, todayEarning:double.parse( data['today_earnings'].toString()), totalEarning: double.parse(data['total_earnings'].toString()) );
  }
}