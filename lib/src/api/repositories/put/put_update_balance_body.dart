class PutUpdateBalanceBody {
  PutUpdateBalanceBody({
      this.balance,});

  PutUpdateBalanceBody.fromJson(dynamic json) {
    balance = json['balance'];
  }
  String? balance;
PutUpdateBalanceBody copyWith({  String? balance,
}) => PutUpdateBalanceBody(  balance: balance ?? this.balance,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['balance'] = balance;
    return map;
  }

}