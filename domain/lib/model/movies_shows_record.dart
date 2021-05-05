class MoviesShowsRecord {
  int? page;
  List<Results>? results;
  int? totalPages;
  int? totalResults;

  MoviesShowsRecord({this.page, this.results, this.totalPages, this.totalResults});

  MoviesShowsRecord.fromJson(Map<String, dynamic> json) {
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
  String? title;
  String? originalLanguage;
  String? originalTitle;
  String? posterPath;
  bool? video;
  double? voteAverage;
  String? overview;
  int? id;
  int? voteCount;
  bool? adult;
  String? backdropPath;
  String? releaseDate;
  List<int>? genreIds;
  double? popularity;
  String? mediaType;
  String? firstAirDate;
  List<String>? originCountry;
  String? name;
  String? originalName;

  Results(
      {this.title,
      this.originalLanguage,
      this.originalTitle,
      this.posterPath,
      this.video,
      this.voteAverage,
      this.overview,
      this.id,
      this.voteCount,
      this.adult,
      this.backdropPath,
      this.releaseDate,
      this.genreIds,
      this.popularity,
      this.mediaType,
      this.firstAirDate,
      this.originCountry,
      this.name,
      this.originalName});

  Results.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    if(json['poster_path'] != null) {
      posterPath = json['poster_path'];
    }
    video = json['video'];
    if(json['vote_average'] != null) {
      voteAverage = json['vote_average'].toDouble();
    }
    overview = json['overview'];
    id = json['id'];
    voteCount = json['vote_count'];
    adult = json['adult'];
    if(json['backdrop_path'] != null) {
      backdropPath = json['backdrop_path'];
    }
    releaseDate = json['release_date'];
    if(json['genre_ids'] != null) {
      genreIds = json['genre_ids'].cast<int>();
    }
    popularity = json['popularity'].toDouble();
    if (json['media_type'] != null) {
      mediaType = json['media_type'];
    }
    if (json['first_air_date'] != null) {
      firstAirDate = json['first_air_date'];
    }
    if (json['origin_country'] != null) {
      originCountry = json['origin_country'].cast<String>();
    }
    if (json['name'] != null) {
      name = json['name'];
    }
    if (json['original_name'] != null) {
      originalName = json['original_name'];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['original_language'] = this.originalLanguage;
    data['original_title'] = this.originalTitle;
    data['poster_path'] = this.posterPath;
    data['video'] = this.video;
    data['vote_average'] = this.voteAverage;
    data['overview'] = this.overview;
    data['id'] = this.id;
    data['vote_count'] = this.voteCount;
    data['adult'] = this.adult;
    data['backdrop_path'] = this.backdropPath;
    data['release_date'] = this.releaseDate;
    data['genre_ids'] = this.genreIds;
    data['popularity'] = this.popularity;
    data['media_type'] = this.mediaType;
    data['first_air_date'] = this.firstAirDate;
    data['origin_country'] = this.originCountry;
    data['name'] = this.name;
    data['original_name'] = this.originalName;
    return data;
  }
}
