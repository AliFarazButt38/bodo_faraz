class SubscriptionModel{
  int id;
  String name,planName;
  MembershipPrice membershipPrice;

  SubscriptionModel({
    required this.id,
    required this.name,
    required this.planName,
    required this.membershipPrice,
});
  factory SubscriptionModel.fromJson(Map<String, dynamic> data){
return SubscriptionModel(id: data['id'], name: data['name'] ?? '', planName: data['plan_name'] ?? '', membershipPrice: MembershipPrice.fromJson(data['membership_price']),);
  }
  }
class MembershipPrice {
  String currency;
  double amount;

  MembershipPrice({
    required this.currency,
    required this.amount,
  });

  factory MembershipPrice.fromJson(Map<String, dynamic> data) {
    return MembershipPrice(
      currency: data['currency'] ?? '',
      amount: data['amount'].toDouble() ?? 0,
    );
  }
}