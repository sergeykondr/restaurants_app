class InstView {
  String name;
  String address;
  String lat;
  String lon;
  String metros;
  String capacity;
  String phones;
  String operationTime;
  String minBanquetPrice;
  String kitchens;
  PrimaryAttributes primaryAttributes;
  PrimaryAttributes additionalAttributes;
  PrimaryAttributes technicalAttribuets;
  List<Promotions> promotions;
  List<Halls> halls;
  InstView(
      {this.name,
      this.address,
      this.lat,
      this.lon,
      this.metros,
      this.capacity,
      this.phones,
      this.operationTime,
      this.minBanquetPrice,
      this.kitchens,
      this.primaryAttributes,
      this.additionalAttributes,
      this.technicalAttribuets,
      this.promotions,
      this.halls});
  InstView.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    address = json['address'];
    lat = json['lat'];
    lon = json['lon'];
    metros = json['metros'];
    capacity = json['capacity'];
    phones = json['phones'];
    operationTime = json['operation_time'];
    minBanquetPrice = json['min_banquet_price'];
    kitchens = json['kitchens'];
    primaryAttributes = json['primary_attributes'] != null
        ? new PrimaryAttributes.fromJson(json['primary_attributes'])
        : null;
    additionalAttributes = json['additional_attributes'] != null
        ? new PrimaryAttributes.fromJson(json['additional_attributes'])
        : null;
    technicalAttribuets = json['technical_attribuets'] != null
        ? new PrimaryAttributes.fromJson(json['technical_attribuets'])
        : null;
    if (json['promotions'] != null) {
      promotions = new List<Promotions>();
      json['promotions'].forEach((v) {
        promotions.add(new Promotions.fromJson(v));
      });
    }
    if (json['halls'] != null) {
      halls = new List<Halls>();
      json['halls'].forEach((v) {
        halls.add(new Halls.fromJson(v));
      });
    }
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['address'] = this.address;
    data['lat'] = this.lat;
    data['lon'] = this.lon;
    data['metros'] = this.metros;
    data['capacity'] = this.capacity;
    data['phones'] = this.phones;
    data['operation_time'] = this.operationTime;
    data['min_banquet_price'] = this.minBanquetPrice;
    data['kitchens'] = this.kitchens;
    if (this.primaryAttributes != null) {
      data['primary_attributes'] = this.primaryAttributes.toJson();
    }
    if (this.additionalAttributes != null) {
      data['additional_attributes'] = this.additionalAttributes.toJson();
    }
    if (this.technicalAttribuets != null) {
      data['technical_attribuets'] = this.technicalAttribuets.toJson();
    }
    if (this.promotions != null) {
      data['promotions'] = this.promotions.map((v) => v.toJson()).toList();
    }
    if (this.halls != null) {
      data['halls'] = this.halls.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PrimaryAttributes {
  List<Attributes> attributes;
  PrimaryAttributes({this.attributes});
  PrimaryAttributes.fromJson(Map<String, dynamic> json) {
    if (json['attributes'] != null) {
      attributes = new List<Attributes>();
      json['attributes'].forEach((v) {
        attributes.add(new Attributes.fromJson(v));
      });
    }
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.attributes != null) {
      data['attributes'] = this.attributes.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Attributes {
  String name;
  String label;
  String value;
  Attributes({this.name, this.label, this.value});
  Attributes.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    label = json['label'];
    value = json['value'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['label'] = this.label;
    data['value'] = this.value;
    return data;
  }
}

class Promotions {
  String type;
  String name;
  Promotions({this.type, this.name});
  Promotions.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    name = json['name'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['name'] = this.name;
    return data;
  }
}

class Halls {
  String name;
  String minCapacityBanquetCloser;
  String maxCapacityBanquetCloser;
  String rent;
  String totalCostBanquet;
  List<String> image;
  Halls(
      {this.name,
      this.minCapacityBanquetCloser,
      this.maxCapacityBanquetCloser,
      this.rent,
      this.totalCostBanquet,
      this.image});
  Halls.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    minCapacityBanquetCloser = json['min_capacity_banquet_closer'];
    maxCapacityBanquetCloser = json['max_capacity_banquet_closer'];
    rent = json['rent'];
    totalCostBanquet = json['total_cost_banquet'];
    image = json['image'].cast<String>();
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['min_capacity_banquet_closer'] = this.minCapacityBanquetCloser;
    data['max_capacity_banquet_closer'] = this.maxCapacityBanquetCloser;
    data['rent'] = this.rent;
    data['total_cost_banquet'] = this.totalCostBanquet;
    data['image'] = this.image;
    return data;
  }
}
