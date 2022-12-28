class Category {
  int? id;
  String? identity;
  String? name;
  String? type;
  String? location;
  String? description;
  String? shopNo;
  String? krapin;
  String? value;

  categoryMap() {
    var mapping = Map<String, dynamic>();
    mapping['id'] = id;
    mapping['identity'] = identity;
    mapping['name'] = name;
    mapping['type'] = type;
    mapping['location'] = location;
    mapping['shopNo'] = shopNo;
    mapping['krapin'] = krapin;
    mapping['value'] = value;
    mapping['description'] = description;

    return mapping;
  }
}
