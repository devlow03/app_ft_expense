/// status : 200
/// message : "Thêm số dư tài khoản thành công"

class PostAddBalanceResponse {
  PostAddBalanceResponse({
      num? status, 
      String? message,}){
    _status = status;
    _message = message;
}

  PostAddBalanceResponse.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
  }
  num? _status;
  String? _message;
PostAddBalanceResponse copyWith({  num? status,
  String? message,
}) => PostAddBalanceResponse(  status: status ?? _status,
  message: message ?? _message,
);
  num? get status => _status;
  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    return map;
  }

}