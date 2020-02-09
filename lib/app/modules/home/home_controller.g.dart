// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeBase, Store {
  final _$moviesAtom = Atom(name: '_HomeBase.movies');

  @override
  ObservableFuture<List<MovieModel>> get movies {
    _$moviesAtom.context.enforceReadPolicy(_$moviesAtom);
    _$moviesAtom.reportObserved();
    return super.movies;
  }

  @override
  set movies(ObservableFuture<List<MovieModel>> value) {
    _$moviesAtom.context.conditionallyRunInAction(() {
      super.movies = value;
      _$moviesAtom.reportChanged();
    }, _$moviesAtom, name: '${_$moviesAtom.name}_set');
  }

  final _$searchMoviesAsyncAction = AsyncAction('searchMovies');

  @override
  Future<void> searchMovies(String nameMovie) {
    return _$searchMoviesAsyncAction.run(() => super.searchMovies(nameMovie));
  }
}
