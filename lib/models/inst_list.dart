class Inst {
  List<Insts> insts;

  Inst({this.insts});

  Inst.fromJson(Map<String, dynamic> json) {
    if (json['insts'] != null) {
      insts = new List<Insts>();
      json['insts'].forEach((v) {
        insts.add(new Insts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.insts != null) {
      data['insts'] = this.insts.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Insts {
  String id;
  String latitude;
  String longitude;
  String name;
  String address;
  String instMainPhoto;
  String url;
  String minBanquetPrice;
  String minFuneralPrice;
  String capacity;

  Insts(
      {this.id,
      this.latitude,
      this.longitude,
      this.name,
      this.address,
      this.instMainPhoto,
      this.url,
      this.minBanquetPrice,
      this.minFuneralPrice,
      this.capacity});

  Insts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    name = json['name'];
    address = json['address'];
    instMainPhoto = json['inst_main_photo'];
    url = json['url'];
    minBanquetPrice = json['min_banquet_price'];
    minFuneralPrice = json['min_funeral_price'];
    capacity = json['capacity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['name'] = this.name;
    data['address'] = this.address;
    data['inst_main_photo'] = this.instMainPhoto;
    data['url'] = this.url;
    data['min_banquet_price'] = this.minBanquetPrice;
    data['min_funeral_price'] = this.minFuneralPrice;
    data['capacity'] = this.capacity;
    return data;
  }
}
