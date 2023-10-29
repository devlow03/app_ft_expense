class GetUserResponse {
  GetUserResponse({
      this.data,});

  GetUserResponse.fromJson(dynamic json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  Data? data;
GetUserResponse copyWith({  Data? data,
}) => GetUserResponse(  data: data ?? this.data,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

}

class Data {
  Data({

      this.userName, 
      this.password, 
      this.fullName, 
      this.avatar, 
      this.email, 
      this.token, 
      this.createdAt,});

  Data.fromJson(dynamic json) {

    userName = json['userName'];
    password = json['password'];
    fullName = json['fullName'];
    avatar = json['avatar'];
    email = json['email'];
    token = json['token'];
    createdAt = json['createdAt'];
  }

  String? userName;
  String? password;
  String? fullName;
  dynamic avatar;
  dynamic email;
  String? token;
  String? createdAt;
Data copyWith({  num? id,
  String? userName,
  String? password,
  String? fullName,
  dynamic avatar,
  dynamic email,
  String? token,
  String? createdAt,
}) => Data(
  userName: userName ?? this.userName,
  password: password ?? this.password,
  fullName: fullName ?? this.fullName,
  avatar: avatar ?? this.avatar,
  email: email ?? this.email,
  token: token ?? this.token,
  createdAt: createdAt ?? this.createdAt,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['userName'] = userName;
    map['password'] = password;
    map['fullName'] = fullName;
    map['avatar'] = avatar;
    map['email'] = email;
    map['token'] = token;
    map['createdAt'] = createdAt;
    return map;
  }

}