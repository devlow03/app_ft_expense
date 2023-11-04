/// data : [{"categoryId":"1","categoryName":"Mua sắm thực phẩm","thumnailUrl":"assets/categories/food_shopping.png","hexColor":"0xFF0000FF"},{"categoryId":"2","categoryName":"Đồ ăn","thumnailUrl":"assets/categories/food.png","hexColor":"0xFF00FF00"},{"categoryId":"3","categoryName":"Đồ uống","thumnailUrl":"assets/categories/drink.png","hexColor":"0xFFFFA500"},{"categoryId":"4","categoryName":"Nhiên liệu","thumnailUrl":"assets/categories/fuel.png","hexColor":"0xFFFF0000"},{"categoryId":"17","categoryName":"Tăng ca","thumnailUrl":"assets/categories/overtime.png","hexColor":"0xFF800080"},{"categoryId":"5","categoryName":"Tiền vé","thumnailUrl":"assets/categories/ticket.png","hexColor":"0xFF008080"},{"categoryId":"7","categoryName":"Thể thao","thumnailUrl":"assets/categories/sports.png","hexColor":"0xFF4B0082"},{"categoryId":"8","categoryName":"Du lịch","thumnailUrl":"assets/categories/tourism.png","hexColor":"0xFFFF1493"},{"categoryId":"9","categoryName":"Sức khỏe","thumnailUrl":"assets/categories/healthcare.png","hexColor":"0xFFFFD700"},{"categoryId":"10","categoryName":"Thời trang","thumnailUrl":"assets/categories/fashion.png","hexColor":"0xFFA52A2A"},{"categoryId":"13","categoryName":"Trả nợ","thumnailUrl":"assets/categories/pay.png","hexColor":"0xFF00CED1"},{"categoryId":"14","categoryName":"Tiết kiệm","thumnailUrl":"assets/categories/saving_money.png","hexColor":"0xFF9400D3"},{"categoryId":"15","categoryName":"Tiền lương","thumnailUrl":"assets/categories/salary.png","hexColor":"0xFF800000"},{"categoryId":"16","categoryName":"Tiền thưởng","thumnailUrl":"assets/categories/bonus.png","hexColor":"0xFF00FF7F"},{"categoryId":"19","categoryName":"Kinh doanh","thumnailUrl":"assets/categories/business.png","hexColor":"0xFFADD8E6"},{"categoryId":"20","categoryName":"Vay mượn","thumnailUrl":"assets/categories/loan.png","hexColor":"0xFFFF6347"},{"categoryId":"21","categoryName":"Tiền thuế","thumnailUrl":"assets/categories/tax.png","hexColor":"0xFF8B0000"},{"categoryId":"22","categoryName":"Đầu tư","thumnailUrl":"assets/categories/invest.png","hexColor":"0xFF7B68EE"},{"categoryId":"23","categoryName":"Khác","thumnailUrl":"assets/categories/more.png","hexColor":"0xFF808080"}]

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

/// categoryId : "1"
/// categoryName : "Mua sắm thực phẩm"
/// thumnailUrl : "assets/categories/food_shopping.png"
/// hexColor : "0xFF0000FF"

class Data {
  Data({
      String? categoryId, 
      String? categoryName, 
      String? thumnailUrl, 
      String? hexColor,}){
    _categoryId = categoryId;
    _categoryName = categoryName;
    _thumnailUrl = thumnailUrl;
    _hexColor = hexColor;
}

  Data.fromJson(dynamic json) {
    _categoryId = json['categoryId'];
    _categoryName = json['categoryName'];
    _thumnailUrl = json['thumnailUrl'];
    _hexColor = json['hexColor'];
  }
  String? _categoryId;
  String? _categoryName;
  String? _thumnailUrl;
  String? _hexColor;
Data copyWith({  String? categoryId,
  String? categoryName,
  String? thumnailUrl,
  String? hexColor,
}) => Data(  categoryId: categoryId ?? _categoryId,
  categoryName: categoryName ?? _categoryName,
  thumnailUrl: thumnailUrl ?? _thumnailUrl,
  hexColor: hexColor ?? _hexColor,
);
  String? get categoryId => _categoryId;
  String? get categoryName => _categoryName;
  String? get thumnailUrl => _thumnailUrl;
  String? get hexColor => _hexColor;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['categoryId'] = _categoryId;
    map['categoryName'] = _categoryName;
    map['thumnailUrl'] = _thumnailUrl;
    map['hexColor'] = _hexColor;
    return map;
  }

}