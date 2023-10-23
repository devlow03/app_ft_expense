/// status : 200
/// message : "Đăng kí tài khoản thành công"

class PostRegisterResponse {
  PostRegisterResponse({
      num? status, 
      String? message,}){
    _status = status;
    _message = message;
}

  PostRegisterResponse.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
  }
  num? _status;
  String? _message;
PostRegisterResponse copyWith({  num? status,
  String? message,
}) => PostRegisterResponse(  status: status ?? _status,
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