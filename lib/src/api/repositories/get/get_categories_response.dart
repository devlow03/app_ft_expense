class GetCategoriesResponse {
  GetCategoriesResponse({
      this.data,});

  GetCategoriesResponse.fromJson(dynamic json) {
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
  }
  List<Data>? data;
GetCategoriesResponse copyWith({  List<Data>? data,
}) => GetCategoriesResponse(  data: data ?? this.data,
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
      this.categoryId, 
      this.categoryName, 
      this.thumnailUrl,});

  Data.fromJson(dynamic json) {
    categoryId = json['categoryId'];
    categoryName = json['categoryName'];
    thumnailUrl = json['thumnailUrl'];
  }
  String? categoryId;
  String? categoryName;
  String? thumnailUrl;
Data copyWith({  String? categoryId,
  String? categoryName,
  String? thumnailUrl,
}) => Data(  categoryId: categoryId ?? this.categoryId,
  categoryName: categoryName ?? this.categoryName,
  thumnailUrl: thumnailUrl ?? this.thumnailUrl,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['categoryId'] = categoryId;
    map['categoryName'] = categoryName;
    map['thumnailUrl'] = thumnailUrl;
    return map;
  }

}