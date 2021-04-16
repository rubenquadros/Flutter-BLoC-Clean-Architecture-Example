import 'package:flutter/widgets.dart';

class PersonCreditsRecord {
  List<Cast>? cast;
  List<Crew>? crew;
  int? id;

  PersonCreditsRecord({this.cast, this.crew, this.id});

  PersonCreditsRecord.fromJson(Map<String, dynamic> json) {
    if (json['cast'] != null) {
      cast = <Cast>[];
      try {
        json['cast'].forEach((v) {
          cast?.add(new Cast.fromJson(v));
        });
      } catch (_) {
        debugPrint('Data inconsistency');
      }
    }
    if (json['crew'] != null) {
      crew = <Crew>[];
      try {
        json['crew'].forEach((v) {
          crew?.add(new Crew.fromJson(v));
        });
      } catch (_) {
        debugPrint('Data inconsistency');
      }
    }
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.cast != null) {
      data['cast'] = this.cast!.map((v) => v.toJson()).toList();
    }
    if (this.crew != null) {
      data['crew'] = this.crew!.map((v) => v.toJson()).toList();
    }
    data['id'] = this.id;
    return data;
  }
}

class Cast {
  int? id;
  bool? video;
  int? voteCount;
  double? voteAverage;
  String? title;
  String? releaseDate;
  String? originalLanguage;
  String? originalTitle;
  List<int>? genreIds;
  String? backdropPath;
  bool? adult;
  String? overview;
  String? posterPath;
  double? popularity;
  String? character;
  String? creditId;
  int? order;
  String? mediaType;
  String? originalName;
  List<String>? originCountry;
  String? name;
  String? firstAirDate;
  int? episodeCount;

  Cast(
      {this.id,
      this.video,
      this.voteCount,
      this.voteAverage,
      this.title,
      this.releaseDate,
      this.originalLanguage,
      this.originalTitle,
      this.genreIds,
      this.backdropPath,
      this.adult,
      this.overview,
      this.posterPath,
      this.popularity,
      this.character,
      this.creditId,
      this.order,
      this.mediaType,
      this.originalName,
      this.originCountry,
      this.name,
      this.firstAirDate,
      this.episodeCount});

  Cast.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    video = json['video'];
    voteCount = json['vote_count'];
    voteAverage = json['vote_average'].toDouble();
    title = json['title'];
    releaseDate = json['release_date'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    genreIds = json['genre_ids'].cast<int>();
    backdropPath = json['backdrop_path'];
    adult = json['adult'];
    overview = json['overview'];
    posterPath = json['poster_path'];
    popularity = json['popularity'].toDouble();
    character = json['character'];
    creditId = json['credit_id'];
    order = json['order'];
    mediaType = json['media_type'];
    originalName = json['original_name'];
    if(json['origin_country'] != null) {
      originCountry = json['origin_country'].cast<String>();
    }
    if(json['name'] != null) {
      name = json['name'];
    }
    if(json['first_air_date'] != null) {
      firstAirDate = json['first_air_date'];
    }
    if(json['episode_count'] != null) {
      episodeCount = json['episode_count'];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['video'] = this.video;
    data['vote_count'] = this.voteCount;
    data['vote_average'] = this.voteAverage;
    data['title'] = this.title;
    data['release_date'] = this.releaseDate;
    data['original_language'] = this.originalLanguage;
    data['original_title'] = this.originalTitle;
    data['genre_ids'] = this.genreIds;
    data['backdrop_path'] = this.backdropPath;
    data['adult'] = this.adult;
    data['overview'] = this.overview;
    data['poster_path'] = this.posterPath;
    data['popularity'] = this.popularity;
    data['character'] = this.character;
    data['credit_id'] = this.creditId;
    data['order'] = this.order;
    data['media_type'] = this.mediaType;
    data['original_name'] = this.originalName;
    data['origin_country'] = this.originCountry;
    data['name'] = this.name;
    data['first_air_date'] = this.firstAirDate;
    data['episode_count'] = this.episodeCount;
    return data;
  }
}

class Crew {
  int? id;
  bool? video;
  int? voteCount;
  double? voteAverage;
  String? title;
  String? releaseDate;
  String? originalLanguage;
  String? originalTitle;
  List<int>? genreIds;
  String? backdropPath;
  bool? adult;
  String? overview;
  String? posterPath;
  double? popularity;
  String? creditId;
  String? department;
  String? job;
  String? mediaType;
  String? firstAirDate;
  String? name;
  List<String>? originCountry;
  String? originalName;
  int? episodeCount;

  Crew(
      {this.id,
      this.video,
      this.voteCount,
      this.voteAverage,
      this.title,
      this.releaseDate,
      this.originalLanguage,
      this.originalTitle,
      this.genreIds,
      this.backdropPath,
      this.adult,
      this.overview,
      this.posterPath,
      this.popularity,
      this.creditId,
      this.department,
      this.job,
      this.mediaType,
      this.firstAirDate,
      this.name,
      this.originCountry,
      this.originalName,
      this.episodeCount});

  Crew.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    video = json['video'];
    voteCount = json['vote_count'];
    voteAverage = json['vote_average'].toDouble();
    title = json['title'];
    releaseDate = json['release_date'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    genreIds = json['genre_ids'].cast<int>();
    backdropPath = json['backdrop_path'];
    adult = json['adult'];
    overview = json['overview'];
    posterPath = json['poster_path'];
    popularity = json['popularity'].toDouble();
    creditId = json['credit_id'];
    department = json['department'];
    job = json['job'];
    mediaType = json['media_type'];
    firstAirDate = json['first_air_date'];
    name = json['name'];
    originCountry = json['origin_country'].cast<String>();
    originalName = json['original_name'];
    episodeCount = json['episode_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['video'] = this.video;
    data['vote_count'] = this.voteCount;
    data['vote_average'] = this.voteAverage;
    data['title'] = this.title;
    data['release_date'] = this.releaseDate;
    data['original_language'] = this.originalLanguage;
    data['original_title'] = this.originalTitle;
    data['genre_ids'] = this.genreIds;
    data['backdrop_path'] = this.backdropPath;
    data['adult'] = this.adult;
    data['overview'] = this.overview;
    data['poster_path'] = this.posterPath;
    data['popularity'] = this.popularity;
    data['credit_id'] = this.creditId;
    data['department'] = this.department;
    data['job'] = this.job;
    data['media_type'] = this.mediaType;
    data['first_air_date'] = this.firstAirDate;
    data['name'] = this.name;
    data['origin_country'] = this.originCountry;
    data['original_name'] = this.originalName;
    data['episode_count'] = this.episodeCount;
    return data;
  }
}
