import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movie_database/app/modules/details_movie/details_movie_controller.dart';
import 'package:movie_database/app/modules/details_movie/details_movie_module.dart';

void main() {
  initModule(DetailsMovieModule());
  DetailsMovieController detailsmovie;

  setUp(() {
    detailsmovie = DetailsMovieModule.to.get<DetailsMovieController>();
  });

  group('DetailsMovieController Test', () {
    test("First Test", () {
      expect(detailsmovie, isInstanceOf<DetailsMovieController>());
    });

    test("Set Value", () {
      expect(detailsmovie.value, equals(0));
      detailsmovie.increment();
      expect(detailsmovie.value, equals(1));
    });
  });
}
