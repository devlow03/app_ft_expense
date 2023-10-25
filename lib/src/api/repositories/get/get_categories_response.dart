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
      this.id, 
      this.categoryName, 
      this.thumnailUrl,});

  Data.fromJson(dynamic json) {
    id = json['id'];
    categoryName = json['categoryName'];
    thumnailUrl = json['thumnailUrl'];
  }
  String? id;
  String? categoryName;
  String? thumnailUrl;
Data copyWith({  String? id,
  String? categoryName,
  String? thumnailUrl,
}) => Data(  id: id ?? this.id,
  categoryName: categoryName ?? this.categoryName,
  thumnailUrl: thumnailUrl ?? this.thumnailUrl,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['categoryName'] = categoryName;
    map['thumnailUrl'] = thumnailUrl;
    return map;
  }

}