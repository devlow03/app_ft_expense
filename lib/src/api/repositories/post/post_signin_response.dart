/// message : "Đăng nhập thành công"
/// access_token : "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vZXhwZW5zZS50aGllbmRldjIwMi5pZC52bi9hcGkvYXV0aC9zaWduaW4iLCJpYXQiOjE2OTcyOTcxOTksImV4cCI6MTY5NzMxOTA5OSwibmJmIjoxNjk3Mjk3MTk5LCJqdGkiOiJLbUVqdGJuN204Tk5xd0NYIiwic3ViIjoiMiIsInBydiI6IjIzYmQ1Yzg5NDlmNjAwYWRiMzllNzAxYzQwMDg3MmRiN2E1OTc2ZjcifQ.MAUKqlretQngz1ZVPLCJvJUSUOC0Rsk8vfgEbrfZKeI"
/// expires_in : 365
/// uid : "2"

class PostSigninResponse {
  PostSigninResponse({
      String? message, 
      String? accessToken, 
      num? expiresIn, 
      String? uid,}){
    _message = message;
    _accessToken = accessToken;
    _expiresIn = expiresIn;
    _uid = uid;
}

  PostSigninResponse.fromJson(dynamic json) {
    _message = json['message'];
    _accessToken = json['access_token'];
    _expiresIn = json['expires_in'];
    _uid = json['uid'];
  }
  String? _message;
  String? _accessToken;
  num? _expiresIn;
  String? _uid;
PostSigninResponse copyWith({  String? message,
  String? accessToken,
  num? expiresIn,
  String? uid,
}) => PostSigninResponse(  message: message ?? _message,
  accessToken: accessToken ?? _accessToken,
  expiresIn: expiresIn ?? _expiresIn,
  uid: uid ?? _uid,
);
  String? get message => _message;
  String? get accessToken => _accessToken;
  num? get expiresIn => _expiresIn;
  String? get uid => _uid;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    map['access_token'] = _accessToken;
    map['expires_in'] = _expiresIn;
    map['uid'] = _uid;
    return map;
  }

}