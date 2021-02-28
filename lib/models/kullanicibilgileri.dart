class Channel {
  String ID;
  String NAME;
  String LATITUDE;
  String LONGITUDE;
  String FIELD1;
  String FIELD2;
  String CREATED_AT;
  String UPDATED_AT;
  String LAST_ENTRY_ID;

  Channel.fromJsonMap(Map<String, dynamic> map)
      : ID = map["ID"],
        NAME = map["NAME"],
        LATITUDE = map["LATITUDE"],
        LONGITUDE = map["LONGITUDE"],
        FIELD1 = map["FIELD1"],
        FIELD2 = map["FIELD2"],
        CREATED_AT = map["CREATED_AT"],
        UPDATED_AT = map["UPDATED_AT"],
        LAST_ENTRY_ID = map["LAST_ENTRY_ID"];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = ID;
    data['NAME'] = NAME;
    data['LATITUDE'] = LATITUDE;
    data['LONGITUDE'] = LONGITUDE;
    data['FIELD1'] = FIELD1;
    data['FIELD2'] = FIELD2;
    data['CREATED_AT'] = CREATED_AT;
    data['UPDATED_AT'] = UPDATED_AT;
    data['LAST_ENTRY_ID'] = LAST_ENTRY_ID;
    return data;
  }
}
