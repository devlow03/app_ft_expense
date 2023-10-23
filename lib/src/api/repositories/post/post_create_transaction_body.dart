/// type : "3"
/// categories : 1
/// description : "mua bún thịt xào"
/// price : "150000"

class PostCreateTransactionBody {
  PostCreateTransactionBody({
      String? type, 
      num? categories, 
      String? description, 
      String? price,}){
    _type = type;
    _categories = categories;
    _description = description;
    _price = price;
}

  PostCreateTransactionBody.fromJson(dynamic json) {
    _type = json['type'];
    _categories = json['categories'];
    _description = json['description'];
    _price = json['price'];
  }
  String? _type;
  num? _categories;
  String? _description;
  String? _price;
PostCreateTransactionBody copyWith({  String? type,
  num? categories,
  String? description,
  String? price,
}) => PostCreateTransactionBody(  type: type ?? _type,
  categories: categories ?? _categories,
  description: description ?? _description,
  price: price ?? _price,
);
  String? get type => _type;
  num? get categories => _categories;
  String? get description => _description;
  String? get price => _price;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['type'] = _type;
    map['categories'] = _categories;
    map['description'] = _description;
    map['price'] = _price;
    return map;
  }

}