class Feeds {
  int created_at;
  String entry_id;
  String field1;
  String field2;

  Feeds.fromJsonMap(Map<String, dynamic> map)
      : created_at = map["CREATED_AT"],
        entry_id = map["ENTRY_ID"],
        field1 = map["FIELD1"],
        field2 = map["FIELD2"];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['CREATED_AT'] = created_at;
    data['ENTRY_ID'] = entry_id;
    data['FIELD1'] = field1;
    data['FIELD2'] = field2;
    return data;
  }
}
