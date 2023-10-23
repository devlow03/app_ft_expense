/// balance : "500000"

class PostAddBalanceBody {
  PostAddBalanceBody({
      String? balance,}){
    _balance = balance;
}

  PostAddBalanceBody.fromJson(dynamic json) {
    _balance = json['balance'];
  }
  String? _balance;
PostAddBalanceBody copyWith({  String? balance,
}) => PostAddBalanceBody(  balance: balance ?? _balance,
);
  String? get balance => _balance;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['balance'] = _balance;
    return map;
  }

}