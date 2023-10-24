class GetSumTypeTransactionResponse {
  GetSumTypeTransactionResponse({
      this.data,});

  GetSumTypeTransactionResponse.fromJson(dynamic json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  Data? data;
GetSumTypeTransactionResponse copyWith({  Data? data,
}) => GetSumTypeTransactionResponse(  data: data ?? this.data,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

}

class Data {
  Data({
      this.income, 
      this.expense,});

  Data.fromJson(dynamic json) {
    income = json['income'].toString();
    expense = json['expense'].toString();
  }
  String? income;
  String? expense;
Data copyWith({  String? income,
  String? expense,
}) => Data(  income: income ?? this.income,
  expense: expense ?? this.expense,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['income'] = income;
    map['expense'] = expense;
    return map;
  }

}