import 'package:mobx/mobx.dart';

part 'details_movie_controller.g.dart';

class DetailsMovieController = _DetailsMovieBase with _$DetailsMovieController;

abstract class _DetailsMovieBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
