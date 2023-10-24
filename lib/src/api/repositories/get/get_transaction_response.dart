/// data : [{"id":"5","userId":"1","type":"1","categories":"5","price":"150000","description":"mua bún thịt xào","createdAt":"2023-10-02 16:09:10","nameType":"thu nhập","categoryName":"Gửi xe"},{"id":"6","userId":"1","type":"1","categories":"6","price":"150000","description":"mua bún thịt xào","createdAt":"2023-10-02 16:09:13","nameType":"thu nhập","categoryName":"Tiền vé"},{"id":"2","userId":"1","type":"2","categories":"2","price":"15000","description":"mua bún thịt xào","createdAt":"2023-10-02 16:09:02","nameType":"chi tiêu","categoryName":"Ăn ngoài"},{"id":"3","userId":"1","type":"2","categories":"3","price":"15000","description":"mua bún thịt xào","createdAt":"2023-10-02 16:09:05","nameType":"chi tiêu","categoryName":"Đồ uống"},{"id":"4","userId":"1","type":"2","categories":"4","price":"15000","description":"mua bún thịt xào","createdAt":"2023-10-02 16:09:08","nameType":"chi tiêu","categoryName":"Nhiên liệu"},{"id":"1","userId":"1","type":"2","categories":"1","price":"150000","description":"mua bún thịt xào","createdAt":"2023-10-15 09:19:41","nameType":"chi tiêu","categoryName":"Mua sắm thực phẩm"},{"id":"1","userId":"1","type":"2","categories":"1","price":"150000","description":"mua bún thịt xào","createdAt":"2023-10-15 09:19:43","nameType":"chi tiêu","categoryName":"Mua sắm thực phẩm"},{"id":"1","userId":"1","type":"2","categories":"1","price":"150000","description":"mua bún thịt xào","createdAt":"2023-10-15 09:19:47","nameType":"chi tiêu","categoryName":"Mua sắm thực phẩm"},{"id":"1","userId":"1","type":"2","categories":"1","price":"150000","description":"mua bún thịt xào","createdAt":"2023-10-15 09:19:50","nameType":"chi tiêu","categoryName":"Mua sắm thực phẩm"}]
/// sum : "945000"

class GetTransactionResponse {
  GetTransactionResponse({
      List<Data>? data,
      String? sum,}){
    _data = data;
    _sum = sum;
}

  GetTransactionResponse.fromJson(dynamic json) {
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
    _sum = json['sum'].toString();
  }
  List<Data>? _data;
  String? _sum;
GetTransactionResponse copyWith({  List<Data>? data,
  String? sum,
}) => GetTransactionResponse(  data: data ?? _data,
  sum: sum ?? _sum,
);
  List<Data>? get data => _data;
  String? get sum => _sum;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    map['sum'] = _sum;
    return map;
  }

}

/// id : "5"
/// userId : "1"
/// type : "1"
/// categories : "5"
/// price : "150000"
/// description : "mua bún thịt xào"
/// createdAt : "2023-10-02 16:09:10"
/// nameType : "thu nhập"
/// categoryName : "Gửi xe"

class Data {
  Data({
      String? id,
      String? userId,
      String? type,
      String? categories,
      String? price,
      String? description,
      String? createdAt,
      String? nameType,
      String? categoryName,}){
    _id = id;
    _userId = userId;
    _type = type;
    _categories = categories;
    _price = price;
    _description = description;
    _createdAt = createdAt;
    _nameType = nameType;
    _categoryName = categoryName;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _userId = json['userId'];
    _type = json['type'];
    _categories = json['categories'];
    _price = json['price'];
    _description = json['description'];
    _createdAt = json['createdAt'];
    _nameType = json['nameType'];
    _categoryName = json['categoryName'];
  }
  String? _id;
  String? _userId;
  String? _type;
  String? _categories;
  String? _price;
  String? _description;
  String? _createdAt;
  String? _nameType;
  String? _categoryName;
Data copyWith({  String? id,
  String? userId,
  String? type,
  String? categories,
  String? price,
  String? description,
  String? createdAt,
  String? nameType,
  String? categoryName,
}) => Data(  id: id ?? _id,
  userId: userId ?? _userId,
  type: type ?? _type,
  categories: categories ?? _categories,
  price: price ?? _price,
  description: description ?? _description,
  createdAt: createdAt ?? _createdAt,
  nameType: nameType ?? _nameType,
  categoryName: categoryName ?? _categoryName,
);
  String? get id => _id;
  String? get userId => _userId;
  String? get type => _type;
  String? get categories => _categories;
  String? get price => _price;
  String? get description => _description;
  String? get createdAt => _createdAt;
  String? get nameType => _nameType;
  String? get categoryName => _categoryName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['userId'] = _userId;
    map['type'] = _type;
    map['categories'] = _categories;
    map['price'] = _price;
    map['description'] = _description;
    map['createdAt'] = _createdAt;
    map['nameType'] = _nameType;
    map['categoryName'] = _categoryName;
    return map;
  }

}