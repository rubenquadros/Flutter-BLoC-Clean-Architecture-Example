import 'package:flutter/cupertino.dart';

class TrendingPeopleRecord {
  int? page;
  List<Results>? results;
  int? totalPages;
  int? totalResults;

  TrendingPeopleRecord(
      {this.page, this.results, this.totalPages, this.totalResults});

  TrendingPeopleRecord.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results?.add(new Results.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['page'] = this.page;
    if (this.results != null) {
      data['results'] = this.results?.map((v) => v.toJson()).toList();
    }
    data['total_pages'] = this.totalPages;
    data['total_results'] = this.totalResults;
    return data;
  }
}

class Results {
  String? profilePath;
  List<KnownFor>? knownFor;
  String? knownForDepartment;
  bool? adult;
  String? name;
  int? gender;
  int? id;
  double? popularity;
  String? mediaType;

  Results(
      {this.profilePath,
      this.knownFor,
      this.knownForDepartment,
      this.adult,
      this.name,
      this.gender,
      this.id,
      this.popularity,
      this.mediaType});

  Results.fromJson(Map<String, dynamic> json) {
    profilePath = json['profile_path'];
    if (json['known_for'] != null) {
      knownFor = <KnownFor>[];
      try {
        json['known_for'].forEach((v) {
          knownFor?.add(new KnownFor.fromJson(v));
        });
      } catch (_) {
        debugPrint('Data inconsistency');
      }
    }
    knownForDepartment = json['known_for_department'];
    adult = json['adult'];
    name = json['name'];
    gender = json['gender'];
    id = json['id'];
    popularity = json['popularity'].toDouble();
    mediaType = json['media_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['profile_path'] = this.profilePath;
    if (this.knownFor != null) {
      data['known_for'] = this.knownFor?.map((v) => v.toJson()).toList();
    }
    data['known_for_department'] = this.knownForDepartment;
    data['adult'] = this.adult;
    data['name'] = this.name;
    data['gender'] = this.gender;
    data['id'] = this.id;
    data['popularity'] = this.popularity;
    data['media_type'] = this.mediaType;
    return data;
  }
}

class KnownFor {
  String? originalLanguage;
  String? originalTitle;
  String? posterPath;
  String? title;
  bool? video;
  double? voteAverage;
  double? popularity;
  String? overview;
  String? releaseDate;
  bool? adult;
  String? backdropPath;
  String? mediaType;
  String? firstAirDate;
  List<String>? originCountry;
  String? originalName;
  String? name;

  KnownFor(
      {this.originalLanguage,
      this.originalTitle,
      this.posterPath,
      this.title,
      this.video,
      this.voteAverage,
      this.popularity,
      this.overview,
      this.releaseDate,
      this.adult,
      this.backdropPath,
      this.mediaType,
      this.firstAirDate,
      this.originCountry,
      this.originalName,
      this.name});

  KnownFor.fromJson(Map<String, dynamic> json) {
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    posterPath = json['poster_path'];
    title = json['title'];
    video = json['video'];
    voteAverage = json['vote_average'].toDouble();
    popularity = json['popularity'].toDouble();
    overview = json['overview'];
    releaseDate = json['release_date'];
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    mediaType = json['media_type'];
    if (json['first_air_date'] != null) {
      firstAirDate = json['first_air_date'];
    }
    if (json['origin_country'] != null) {
      originCountry = json['origin_country'].cast<String>();
    }
    if (json['original_name'] != null) {
      originalName = json['original_name'];
    }
    if (json['name'] != null) {
      name = json['name'];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['original_language'] = this.originalLanguage;
    data['original_title'] = this.originalTitle;
    data['poster_path'] = this.posterPath;
    data['title'] = this.title;
    data['video'] = this.video;
    data['vote_average'] = this.voteAverage;
    data['popularity'] = this.popularity;
    data['overview'] = this.overview;
    data['release_date'] = this.releaseDate;
    data['adult'] = this.adult;
    data['backdrop_path'] = this.backdropPath;
    data['media_type'] = this.mediaType;
    data['first_air_date'] = this.firstAirDate;
    data['origin_country'] = this.originCountry;
    data['original_name'] = this.originalName;
    data['name'] = this.name;
    return data;
  }
}
