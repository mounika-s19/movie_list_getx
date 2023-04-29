// To parse this JSON data, do
//
//     final movie = movieFromJson(jsonString);

import 'dart:convert';

List<Movie> movieFromJson(String str) => List<Movie>.from(json.decode(str).map((x) => Movie.fromJson(x)));


class Movie {
    Movie({
        this.name,
        this.realname,
        this.team,
        this.firstappearance,
        this.createdby,
        this.publisher,
        this.imageurl,
        this.bio,
    });

    String? name;
    String? realname;
    String? team;
    String? firstappearance;
    String? createdby;
    String? publisher;
    String? imageurl;
    String? bio;

    factory Movie.fromJson(Map<String, dynamic> json) => Movie(
        name: json["name"],
        realname: json["realname"],
        team: json["team"],
        firstappearance: json["firstappearance"],
        createdby: json["createdby"],
        publisher: json["publisher"],
        imageurl: json["imageurl"],
        bio: json["bio"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "realname": realname,
        "team": team,
        "firstappearance": firstappearance,
        "createdby": createdby,
        "publisher": publisher,
        "imageurl": imageurl,
        "bio": bio,
    };
}
