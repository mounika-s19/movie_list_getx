// To parse this JSON data, do
//
//     final latestMovie = latestMovieFromJson(jsonString);

import 'dart:convert';

LatestMovie latestMovieFromJson(String str) => LatestMovie.fromJson(json.decode(str));



class LatestMovie {
    LatestMovie({
        required this.adult,
        this.backdropPath,
        this.belongsToCollection,
        required this.budget,
        required this.genres,
        required this.homepage,
        required this.id,
        this.imdbId,
        required this.originalLanguage,
        required this.originalTitle,
        required this.overview,
        // required this.popularity,
         this.posterPath,
        required this.productionCompanies,
        required this.productionCountries,
        required this.releaseDate,
        // required this.revenue,
        // required this.runtime,
        required this.spokenLanguages,
        required this.status,
        required this.tagline,
        required this.title,
        required this.video,
        // required this.voteAverage,
        // required this.voteCount,
    });

    bool adult;
    dynamic backdropPath;
    dynamic belongsToCollection;
    int budget;
    List<dynamic> genres;
    String homepage;
    int id;
    dynamic imdbId;
    String originalLanguage;
    String originalTitle;
    String overview;
    // int popularity;
    String? posterPath;
    List<dynamic> productionCompanies;
    List<dynamic> productionCountries;
    String releaseDate;
    // int revenue;
    // int runtime;
    List<SpokenLanguage> spokenLanguages;
    String status;
    String tagline;
    String title;
    bool video;
    // int voteAverage;
    // int voteCount;

    factory LatestMovie.fromJson(Map<String, dynamic> json) => LatestMovie(
        adult: json["adult"],
        backdropPath: json["backdrop_path"],
        belongsToCollection: json["belongs_to_collection"],
        budget: json["budget"],
        genres: List<dynamic>.from(json["genres"].map((x) => x)),
        homepage: json["homepage"],
        id: json["id"],
        imdbId: json["imdb_id"],
        originalLanguage: json["original_language"],
        originalTitle: json["original_title"],
        overview: json["overview"],
        // popularity: json["popularity"],
       posterPath: json["poster_path"],
        productionCompanies: List<dynamic>.from(json["production_companies"].map((x) => x)),
        productionCountries: List<dynamic>.from(json["production_countries"].map((x) => x)),
        releaseDate: json["release_date"],
        // revenue: json["revenue"],
        // runtime: json["runtime"],
        spokenLanguages: List<SpokenLanguage>.from(json["spoken_languages"].map((x) => SpokenLanguage.fromJson(x))),
        status: json["status"],
        tagline: json["tagline"],
        title: json["title"],
        video: json["video"],
        // voteAverage: json["vote_average"],
        // voteCount: json["vote_count"],
    );

  
}

class SpokenLanguage {
    SpokenLanguage({
        required this.englishName,
        required this.iso6391,
        required this.name,
    });

    String englishName;
    String iso6391;
    String name;

    factory SpokenLanguage.fromJson(Map<String, dynamic> json) => SpokenLanguage(
        englishName: json["english_name"],
        iso6391: json["iso_639_1"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "english_name": englishName,
        "iso_639_1": iso6391,
        "name": name,
    };
}
