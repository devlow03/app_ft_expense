class GetTransactionResponse {
  GetTransactionResponse({
      this.data,});

  GetTransactionResponse.fromJson(dynamic json) {
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
  }
  List<Data>? data;
GetTransactionResponse copyWith({  List<Data>? data,
}) => GetTransactionResponse(  data: data ?? this.data,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Data {
  Data({
      this.id, 
      this.userId, 
      this.type, 
      this.categories, 
      this.price, 
      this.description, 
      this.createdAtDate, 
      this.createdAtTime, 
      this.nameType, 
      this.categoryName, 
      this.thumnailUrl,});

  Data.fromJson(dynamic json) {
    id = json['id'];
    userId = json['userId'];
    type = json['type'];
    categories = json['categories'];
    price = json['price'];
    description = json['description'];
    createdAtDate = json['createdAtDate'];
    createdAtTime = json['createdAtTime'];
    nameType = json['nameType'];
    categoryName = json['categoryName'];
    thumnailUrl = json['thumnailUrl'];
  }
  String? id;
  String? userId;
  String? type;
  String? categories;
  String? price;
  String? description;
  String? createdAtDate;
  String? createdAtTime;
  String? nameType;
  String? categoryName;
  String? thumnailUrl;
Data copyWith({  String? id,
  String? userId,
  String? type,
  String? categories,
  String? price,
  String? description,
  String? createdAtDate,
  String? createdAtTime,
  String? nameType,
  String? categoryName,
  String? thumnailUrl,
}) => Data(  id: id ?? this.id,
  userId: userId ?? this.userId,
  type: type ?? this.type,
  categories: categories ?? this.categories,
  price: price ?? this.price,
  description: description ?? this.description,
  createdAtDate: createdAtDate ?? this.createdAtDate,
  createdAtTime: createdAtTime ?? this.createdAtTime,
  nameType: nameType ?? this.nameType,
  categoryName: categoryName ?? this.categoryName,
  thumnailUrl: thumnailUrl ?? this.thumnailUrl,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['userId'] = userId;
    map['type'] = type;
    map['categories'] = categories;
    map['price'] = price;
    map['description'] = description;
    map['createdAtDate'] = createdAtDate;
    map['createdAtTime'] = createdAtTime;
    map['nameType'] = nameType;
    map['categoryName'] = categoryName;
    map['thumnailUrl'] = thumnailUrl;
    return map;
  }

}