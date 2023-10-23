/// id : "21"
/// userId : "1"
/// type : "3"
/// categories : 1
/// description : "ăn cơm"
/// price : "15000"

class PutUpdateTransactionBody {
  PutUpdateTransactionBody({
      String? id, 
      String? userId, 
      String? type, 
      num? categories, 
      String? description, 
      String? price,}){
    _id = id;
    _userId = userId;
    _type = type;
    _categories = categories;
    _description = description;
    _price = price;
}

  PutUpdateTransactionBody.fromJson(dynamic json) {
    _id = json['id'];
    _userId = json['userId'];
    _type = json['type'];
    _categories = json['categories'];
    _description = json['description'];
    _price = json['price'];
  }
  String? _id;
  String? _userId;
  String? _type;
  num? _categories;
  String? _description;
  String? _price;
PutUpdateTransactionBody copyWith({  String? id,
  String? userId,
  String? type,
  num? categories,
  String? description,
  String? price,
}) => PutUpdateTransactionBody(  id: id ?? _id,
  userId: userId ?? _userId,
  type: type ?? _type,
  categories: categories ?? _categories,
  description: description ?? _description,
  price: price ?? _price,
);
  String? get id => _id;
  String? get userId => _userId;
  String? get type => _type;
  num? get categories => _categories;
  String? get description => _description;
  String? get price => _price;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['userId'] = _userId;
    map['type'] = _type;
    map['categories'] = _categories;
    map['description'] = _description;
    map['price'] = _price;
    return map;
  }

}