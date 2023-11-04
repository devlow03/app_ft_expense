/// data : [{"id":"124","userId":"23","type":"1","categories":"16","price":"100000","description":"trung so","createdAtDate":"2023-11-04","createdAtTime":"14:00:00","typeId":"1","nameType":"Thu nhập","categoryId":"16","categoryName":"Tiền thưởng","thumnailUrl":"assets/categories/bonus.png","hexColor":"0xFF00FF7F"},{"id":"123","userId":"23","type":"2","categories":"13","price":"20000","description":"abc","createdAtDate":"2023-11-04","createdAtTime":"12:04:00","typeId":"2","nameType":"Chi tiêu","categoryId":"13","categoryName":"Trả nợ","thumnailUrl":"assets/categories/pay.png","hexColor":"0xFF00CED1"},{"id":"122","userId":"23","type":"1","categories":"15","price":"2500000","description":"CDS","createdAtDate":"2023-11-04","createdAtTime":"11:59:00","typeId":"1","nameType":"Thu nhập","categoryId":"15","categoryName":"Tiền lương","thumnailUrl":"assets/categories/salary.png","hexColor":"0xFF800000"},{"id":"121","userId":"23","type":"2","categories":"3","price":"20000","description":"abc","createdAtDate":"2023-11-04","createdAtTime":"10:52:00","typeId":"2","nameType":"Chi tiêu","categoryId":"3","categoryName":"Đồ uống","thumnailUrl":"assets/categories/drink.png","hexColor":"0xFFFFA500"}]

class GetTransactionResponse {
  GetTransactionResponse({
      List<Data>? data,}){
    _data = data;
}

  GetTransactionResponse.fromJson(dynamic json) {
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
  }
  List<Data>? _data;
GetTransactionResponse copyWith({  List<Data>? data,
}) => GetTransactionResponse(  data: data ?? _data,
);
  List<Data>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : "124"
/// userId : "23"
/// type : "1"
/// categories : "16"
/// price : "100000"
/// description : "trung so"
/// createdAtDate : "2023-11-04"
/// createdAtTime : "14:00:00"
/// typeId : "1"
/// nameType : "Thu nhập"
/// categoryId : "16"
/// categoryName : "Tiền thưởng"
/// thumnailUrl : "assets/categories/bonus.png"
/// hexColor : "0xFF00FF7F"

class Data {
  Data({
      String? id, 
      String? userId, 
      String? type, 
      String? categories, 
      String? price, 
      String? description, 
      String? createdAtDate, 
      String? createdAtTime, 
      String? typeId, 
      String? nameType, 
      String? categoryId, 
      String? categoryName, 
      String? thumnailUrl, 
      String? hexColor,}){
    _id = id;
    _userId = userId;
    _type = type;
    _categories = categories;
    _price = price;
    _description = description;
    _createdAtDate = createdAtDate;
    _createdAtTime = createdAtTime;
    _typeId = typeId;
    _nameType = nameType;
    _categoryId = categoryId;
    _categoryName = categoryName;
    _thumnailUrl = thumnailUrl;
    _hexColor = hexColor;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _userId = json['userId'];
    _type = json['type'];
    _categories = json['categories'];
    _price = json['price'];
    _description = json['description'];
    _createdAtDate = json['createdAtDate'];
    _createdAtTime = json['createdAtTime'];
    _typeId = json['typeId'];
    _nameType = json['nameType'];
    _categoryId = json['categoryId'];
    _categoryName = json['categoryName'];
    _thumnailUrl = json['thumnailUrl'];
    _hexColor = json['hexColor'];
  }
  String? _id;
  String? _userId;
  String? _type;
  String? _categories;
  String? _price;
  String? _description;
  String? _createdAtDate;
  String? _createdAtTime;
  String? _typeId;
  String? _nameType;
  String? _categoryId;
  String? _categoryName;
  String? _thumnailUrl;
  String? _hexColor;
Data copyWith({  String? id,
  String? userId,
  String? type,
  String? categories,
  String? price,
  String? description,
  String? createdAtDate,
  String? createdAtTime,
  String? typeId,
  String? nameType,
  String? categoryId,
  String? categoryName,
  String? thumnailUrl,
  String? hexColor,
}) => Data(  id: id ?? _id,
  userId: userId ?? _userId,
  type: type ?? _type,
  categories: categories ?? _categories,
  price: price ?? _price,
  description: description ?? _description,
  createdAtDate: createdAtDate ?? _createdAtDate,
  createdAtTime: createdAtTime ?? _createdAtTime,
  typeId: typeId ?? _typeId,
  nameType: nameType ?? _nameType,
  categoryId: categoryId ?? _categoryId,
  categoryName: categoryName ?? _categoryName,
  thumnailUrl: thumnailUrl ?? _thumnailUrl,
  hexColor: hexColor ?? _hexColor,
);
  String? get id => _id;
  String? get userId => _userId;
  String? get type => _type;
  String? get categories => _categories;
  String? get price => _price;
  String? get description => _description;
  String? get createdAtDate => _createdAtDate;
  String? get createdAtTime => _createdAtTime;
  String? get typeId => _typeId;
  String? get nameType => _nameType;
  String? get categoryId => _categoryId;
  String? get categoryName => _categoryName;
  String? get thumnailUrl => _thumnailUrl;
  String? get hexColor => _hexColor;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['userId'] = _userId;
    map['type'] = _type;
    map['categories'] = _categories;
    map['price'] = _price;
    map['description'] = _description;
    map['createdAtDate'] = _createdAtDate;
    map['createdAtTime'] = _createdAtTime;
    map['typeId'] = _typeId;
    map['nameType'] = _nameType;
    map['categoryId'] = _categoryId;
    map['categoryName'] = _categoryName;
    map['thumnailUrl'] = _thumnailUrl;
    map['hexColor'] = _hexColor;
    return map;
  }

}