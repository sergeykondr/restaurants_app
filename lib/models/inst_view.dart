class InstView {
  String name;
  String address;
  String lat;
  String lon;
  String minBanquetPrice;
  String metros;
  String capacity;
  String phones;
  String operationTime;
  String kitchens;
  List<Halls> halls;
  String kitPriceEquipment;
  String ownEquipment;
  String plasmaPanelsExistYesNo;
  String projectionScreenExistYesNo;
  String soundEquipmentExistYesNo;
  String lightingEquipmentExistYesNo;
  String dimmingSystem;
  String smokeMachine;
  String confettiCannon;
  String karaokeBanquet;
  String wifiExistYesNo;
  String danceFloor;
  String conditionerExistYesNo;
  String wardrobe;
  String dressingRooms;
  List<Promotions> promotions;

  InstView(
      {this.name,
      this.address,
      this.lat,
      this.lon,
      this.metros,
      this.capacity,
      this.phones,
      this.operationTime,
      this.kitchens,
      this.halls,
      this.kitPriceEquipment,
      this.ownEquipment,
      this.plasmaPanelsExistYesNo,
      this.projectionScreenExistYesNo,
      this.soundEquipmentExistYesNo,
      this.lightingEquipmentExistYesNo,
      this.dimmingSystem,
      this.smokeMachine,
      this.confettiCannon,
      this.karaokeBanquet,
      this.wifiExistYesNo,
      this.danceFloor,
      this.conditionerExistYesNo,
      this.wardrobe,
      this.dressingRooms,
      this.promotions});

  InstView.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    address = json['address'];
    minBanquetPrice = json['min_banquet_price'];
    lat = json['lat'];
    lon = json['lon'];
    metros = json['metros'];
    capacity = json['capacity'];
    phones = json['phones'];
    operationTime = json['operation_time'];
    kitchens = json['kitchens'];
    if (json['halls'] != null) {
      halls = new List<Halls>();
      json['halls'].forEach((v) {
        halls.add(new Halls.fromJson(v));
      });
    }
    kitPriceEquipment = json['kit_price_equipment'];
    ownEquipment = json['own_equipment'];
    plasmaPanelsExistYesNo = json['plasma_panels_exist_yes_no'];
    projectionScreenExistYesNo = json['projection_screen_exist_yes_no'];
    soundEquipmentExistYesNo = json['sound_equipment_exist_yes_no'];
    lightingEquipmentExistYesNo = json['lighting_equipment_exist_yes_no'];
    dimmingSystem = json['dimming_system'];
    smokeMachine = json['smoke_machine'];
    confettiCannon = json['confetti_cannon'];
    karaokeBanquet = json['karaoke_banquet'];
    wifiExistYesNo = json['wifi_exist_yes_no'];
    danceFloor = json['dance_floor'];
    conditionerExistYesNo = json['conditioner_exist_yes_no'];
    wardrobe = json['wardrobe'];
    dressingRooms = json['dressing_rooms'];
    if (json['promotions'] != null) {
      promotions = new List<Promotions>();
      json['promotions'].forEach((v) {
        promotions.add(new Promotions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['address'] = this.address;
    data['min_banquet_price'] = this.minBanquetPrice;
    data['lat'] = this.lat;
    data['lon'] = this.lon;
    data['metros'] = this.metros;
    data['capacity'] = this.capacity;
    data['phones'] = this.phones;
    data['operation_time'] = this.operationTime;
    data['kitchens'] = this.kitchens;
    if (this.halls != null) {
      data['halls'] = this.halls.map((v) => v.toJson()).toList();
    }
    data['kit_price_equipment'] = this.kitPriceEquipment;
    data['own_equipment'] = this.ownEquipment;
    data['plasma_panels_exist_yes_no'] = this.plasmaPanelsExistYesNo;
    data['projection_screen_exist_yes_no'] = this.projectionScreenExistYesNo;
    data['sound_equipment_exist_yes_no'] = this.soundEquipmentExistYesNo;
    data['lighting_equipment_exist_yes_no'] = this.lightingEquipmentExistYesNo;
    data['dimming_system'] = this.dimmingSystem;
    data['smoke_machine'] = this.smokeMachine;
    data['confetti_cannon'] = this.confettiCannon;
    data['karaoke_banquet'] = this.karaokeBanquet;
    data['wifi_exist_yes_no'] = this.wifiExistYesNo;
    data['dance_floor'] = this.danceFloor;
    data['conditioner_exist_yes_no'] = this.conditionerExistYesNo;
    data['wardrobe'] = this.wardrobe;
    data['dressing_rooms'] = this.dressingRooms;
    if (this.promotions != null) {
      data['promotions'] = this.promotions.map((v) => v.toJson()).toList();
    }
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
