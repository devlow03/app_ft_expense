/// userName : "admin@123"
/// password : "qt123456@"

class PostSigninBody {
  PostSigninBody({
      String? userName, 
      String? password,}){
    _userName = userName;
    _password = password;
}

  PostSigninBody.fromJson(dynamic json) {
    _userName = json['userName'];
    _password = json['password'];
  }
  String? _userName;
  String? _password;
PostSigninBody copyWith({  String? userName,
  String? password,
}) => PostSigninBody(  userName: userName ?? _userName,
  password: password ?? _password,
);
  String? get userName => _userName;
  String? get password => _password;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['userName'] = _userName;
    map['password'] = _password;
    return map;
  }

}