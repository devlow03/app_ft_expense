/// data : {"id":"6","userId":"7","balance":"1000000","updatedAt":"2023-10-15 09:04:23"}

class GetBalanceResponse {
  GetBalanceResponse({
      Data? data,}){
    _data = data;
}

  GetBalanceResponse.fromJson(dynamic json) {
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  Data? _data;
GetBalanceResponse copyWith({  Data? data,
}) => GetBalanceResponse(  data: data ?? _data,
);
  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }

}

/// id : "6"
/// userId : "7"
/// balance : "1000000"
/// updatedAt : "2023-10-15 09:04:23"

class Data {
  Data({
      String? id, 
      String? userId, 
      String? balance, 
      String? updatedAt,}){
    _id = id;
    _userId = userId;
    _balance = balance;
    _updatedAt = updatedAt;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _userId = json['userId'];
    _balance = json['balance'];
    _updatedAt = json['updatedAt'];
  }
  String? _id;
  String? _userId;
  String? _balance;
  String? _updatedAt;
Data copyWith({  String? id,
  String? userId,
  String? balance,
  String? updatedAt,
}) => Data(  id: id ?? _id,
  userId: userId ?? _userId,
  balance: balance ?? _balance,
  updatedAt: updatedAt ?? _updatedAt,
);
  String? get id => _id;
  String? get userId => _userId;
  String? get balance => _balance;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['userId'] = _userId;
    map['balance'] = _balance;
    map['updatedAt'] = _updatedAt;
    return map;
  }

}