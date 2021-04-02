class ConfigRecord {
  Images? images;
  List<String>? changeKeys;

  ConfigRecord({this.images, this.changeKeys});

  ConfigRecord.fromJson(Map<String, dynamic> json) {
    images =
    json['images'] != null ? new Images.fromJson(json['images']) : null;
    changeKeys = json['change_keys'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.images != null) {
      data['images'] = this.images!.toJson();
    }
    data['change_keys'] = this.changeKeys;
    return data;
  }
}

class Images {
  String? baseUrl;
  String? secureBaseUrl;
  List<String>? backdropSizes;
  List<String>? logoSizes;
  List<String>? posterSizes;
  List<String>? profileSizes;
  List<String>? stillSizes;

  Images(
      {this.baseUrl,
        this.secureBaseUrl,
        this.backdropSizes,
        this.logoSizes,
        this.posterSizes,
        this.profileSizes,
        this.stillSizes});

  Images.fromJson(Map<String, dynamic> json) {
    baseUrl = json['base_url'];
    secureBaseUrl = json['secure_base_url'];
    backdropSizes = json['backdrop_sizes'].cast<String>();
    logoSizes = json['logo_sizes'].cast<String>();
    posterSizes = json['poster_sizes'].cast<String>();
    profileSizes = json['profile_sizes'].cast<String>();
    stillSizes = json['still_sizes'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['base_url'] = this.baseUrl;
    data['secure_base_url'] = this.secureBaseUrl;
    data['backdrop_sizes'] = this.backdropSizes;
    data['logo_sizes'] = this.logoSizes;
    data['poster_sizes'] = this.posterSizes;
    data['profile_sizes'] = this.profileSizes;
    data['still_sizes'] = this.stillSizes;
    return data;
  }
}