class GetTransactionQuery {
  GetTransactionQuery({
      this.date,});

  GetTransactionQuery.fromJson(dynamic json) {
    date = json['date'];
  }
  String? date;
GetTransactionQuery copyWith({  String? date,
}) => GetTransactionQuery(  date: date ?? this.date,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['date'] = date;
    return map;
  }

}