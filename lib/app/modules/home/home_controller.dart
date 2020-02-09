import 'package:mobx/mobx.dart';
import 'package:movie_database/app/modules/home/repository/home_repository.dart';
import 'package:movie_database/share/models/movie_model.dart';

part 'home_controller.g.dart';

class HomeController = _HomeBase with _$HomeController;

abstract class _HomeBase with Store {
  final HomeRepository homeRepositor;

  _HomeBase(this.homeRepositor);

  @observable
  ObservableFuture<List<MovieModel>> movies;

  @action
  Future<void> searchMovies(String nameMovie) async {
    nameMovie != "" ?
    movies = homeRepositor.getMovies(nameMovie).asObservable() : movies = ObservableFuture.value(List<MovieModel>());
    print(movies);
  }


}
