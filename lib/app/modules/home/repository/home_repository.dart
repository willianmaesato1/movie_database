import 'package:flutter_modular/flutter_modular.dart';
import 'package:dio/dio.dart';
import 'package:movie_database/share/models/genre_model.dart';
import 'package:movie_database/share/models/movie_model.dart';
import 'package:movie_database/share/utils/consts.dart';

class HomeRepository extends Disposable {
  final Dio dio;

  HomeRepository(this.dio);

  Future<List<MovieModel>> getMovies(String nameMovie) async {
   try{
     final response =
     await dio.get('$search_movies?api_key=$token&query=$nameMovie');
     List<dynamic> listMap = response.data['results'];
     final response2 =
     await dio.get('$get_genres?api_key=$token&language=en-US');
     List<dynamic> listMap2 = response2.data['genres'];
     List<GenreModel> listGenre =
     listMap2.map((genre) => GenreModel.fromJson(genre)).toList();

     List<String> auxGenre = List<String>();
     for (var movies in listMap) {
       for (var genreId in movies['genre_ids']) {
         var index = listGenre.indexWhere((genere) => genere.id == genreId);
         if (index != -1) {
           auxGenre.add(listGenre[index].name);
         }
       }
       movies['name_genres'] = auxGenre;
       auxGenre = List<String>();
     }
     List<MovieModel> listMovies =
     listMap.map((movie) => MovieModel.fromJson(movie)).toList();

     return listMovies;
   }catch(e){
     print("error - $e");
     return List<MovieModel>();
   }
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
