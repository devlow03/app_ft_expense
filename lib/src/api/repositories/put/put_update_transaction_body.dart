class PutUpdateTransactionBody {
  PutUpdateTransactionBody({
      this.id, 
      this.type, 
      this.categories, 
      this.description, 
      this.price,});

  PutUpdateTransactionBody.fromJson(dynamic json) {
    id = json['id'];
    type = json['type'];
    categories = json['categories'];
    description = json['description'];
    price = json['price'];
  }
  String? id;
  String? type;
  String? categories;
  String? description;
  String? price;
PutUpdateTransactionBody copyWith({  String? id,
  String? type,
  String? categories,
  String? description,
  String? price,
}) => PutUpdateTransactionBody(  id: id ?? this.id,
  type: type ?? this.type,
  categories: categories ?? this.categories,
  description: description ?? this.description,
  price: price ?? this.price,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['type'] = type;
    map['categories'] = categories;
    map['description'] = description;
    map['price'] = price;
    return map;
  }

}