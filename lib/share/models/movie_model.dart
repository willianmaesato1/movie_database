class MovieModel {
  bool video;
  String posterPath;
  bool adult;
  String backdropPath;
  String originalLanguage;
  String originalTitle;
  List<String> nameGenres;
  String title;
  String overview;
  String releaseDate;

  MovieModel(
      {this.video,
      this.posterPath,
      this.adult,
      this.backdropPath,
      this.originalLanguage,
      this.originalTitle,
      this.nameGenres,
      this.title,
      this.overview,
      this.releaseDate});

  MovieModel.fromJson(Map<String, dynamic> json) {
    video = json['video'];
    posterPath = json['poster_path'];
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    nameGenres = json['name_genres'];
    title = json['title'];
    overview = json['overview'];
    releaseDate = json['release_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['video'] = this.video;
    data['poster_path'] = this.posterPath;
    data['adult'] = this.adult;
    data['backdrop_path'] = this.backdropPath;
    data['original_language'] = this.originalLanguage;
    data['original_title'] = this.originalTitle;
    data['name_genres'] = this.nameGenres;
    data['title'] = this.title;
    data['overview'] = this.overview;
    data['release_date'] = this.releaseDate;
    return data;
  }
}
