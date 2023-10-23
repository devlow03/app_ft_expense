/// fullName : "Thiện"
/// userName : "admin@12"
/// password : "qt123456@"

class PostRegisterBody {
  PostRegisterBody({
      String? fullName, 
      String? userName, 
      String? password,}){
    _fullName = fullName;
    _userName = userName;
    _password = password;
}

  PostRegisterBody.fromJson(dynamic json) {
    _fullName = json['fullName'];
    _userName = json['userName'];
    _password = json['password'];
  }
  String? _fullName;
  String? _userName;
  String? _password;
PostRegisterBody copyWith({  String? fullName,
  String? userName,
  String? password,
}) => PostRegisterBody(  fullName: fullName ?? _fullName,
  userName: userName ?? _userName,
  password: password ?? _password,
);
  String? get fullName => _fullName;
  String? get userName => _userName;
  String? get password => _password;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['fullName'] = _fullName;
    map['userName'] = _userName;
    map['password'] = _password;
    return map;
  }

}