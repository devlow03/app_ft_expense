/// status : 200
/// message : "Thêm giao dịch thành công"
/// type : "Chuyển khoản"
/// balance : 200000

class PostCreateTransactionResponse {
  PostCreateTransactionResponse({
      num? status, 
      String? message, 
      String? type, 
      num? balance,}){
    _status = status;
    _message = message;
    _type = type;
    _balance = balance;
}

  PostCreateTransactionResponse.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _type = json['type'];
    _balance = json['balance'];
  }
  num? _status;
  String? _message;
  String? _type;
  num? _balance;
PostCreateTransactionResponse copyWith({  num? status,
  String? message,
  String? type,
  num? balance,
}) => PostCreateTransactionResponse(  status: status ?? _status,
  message: message ?? _message,
  type: type ?? _type,
  balance: balance ?? _balance,
);
  num? get status => _status;
  String? get message => _message;
  String? get type => _type;
  num? get balance => _balance;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    map['type'] = _type;
    map['balance'] = _balance;
    return map;
  }

}