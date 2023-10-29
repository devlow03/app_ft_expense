class GetTransactionQuery {
  GetTransactionQuery({
      this.date, 
      this.description,});

  GetTransactionQuery.fromJson(dynamic json) {
    date = json['date'];
    description = json['description'];
  }
  String? date;
  String? description;
GetTransactionQuery copyWith({  String? date,
  String? description,
}) => GetTransactionQuery(  date: date ?? this.date,
  description: description ?? this.description,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['date'] = date;
    map['description'] = description;
    return map;
  }

}