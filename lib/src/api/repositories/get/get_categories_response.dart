/// data : [{"id":1,"categoryName":"Mua sắm thực phẩm"},{"id":2,"categoryName":"Ăn ngoài"},{"id":3,"categoryName":"Đồ uống"},{"id":4,"categoryName":"Nhiên liệu"},{"id":5,"categoryName":"Gửi xe"},{"id":6,"categoryName":"Tiền vé"},{"id":7,"categoryName":"Xem phim"},{"id":8,"categoryName":"Thể thao"},{"id":9,"categoryName":"Du lịch"},{"id":10,"categoryName":"Mua thuốc"},{"id":11,"categoryName":"Phí thăm khám bác sĩ"},{"id":12,"categoryName":"Mua sắm quần, áo"},{"id":13,"categoryName":"Mua sắm giày dép"},{"id":14,"categoryName":"Mua sắm đồ gia dụng"},{"id":15,"categoryName":"Trả nợ"},{"id":16,"categoryName":"Tiết kiệm"},{"id":17,"categoryName":"Tiền lương"},{"id":18,"categoryName":"Tiền lương thêm giờ"},{"id":19,"categoryName":"Thu nhập từ kinh doanh"},{"id":20,"categoryName":"Hỗ trợ gia đình"}]

class GetCategoriesResponse {
  GetCategoriesResponse({
      List<Data>? data,}){
    _data = data;
}

  GetCategoriesResponse.fromJson(dynamic json) {
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
  }
  List<Data>? _data;
GetCategoriesResponse copyWith({  List<Data>? data,
}) => GetCategoriesResponse(  data: data ?? _data,
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

/// id : 1
/// categoryName : "Mua sắm thực phẩm"

class Data {
  Data({
      num? id, 
      String? categoryName,}){
    _id = id;
    _categoryName = categoryName;
}

  Data.fromJson(dynamic json) {
    _id = json['id'] is int ? json['id'] : int.parse(json['id'].toString());
    _categoryName = json['categoryName'];
  }

  num? _id;
  String? _categoryName;
Data copyWith({  num? id,
  String? categoryName,
}) => Data(  id: id ?? _id,
  categoryName: categoryName ?? _categoryName,
);
  num? get id => _id;
  String? get categoryName => _categoryName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['categoryName'] = _categoryName;
    return map;
  }

}