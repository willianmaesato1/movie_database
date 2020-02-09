import 'package:movie_database/app/modules/details_movie/details_movie_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:movie_database/app/modules/details_movie/details_movie_page.dart';

class DetailsMovieModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => DetailsMovieController()),
      ];

  @override
  List<Router> get routers => [
        Router('/',
            child: (_, args) => DetailsMoviePage(movieModel: args.data)),
      ];

  static Inject get to => Inject<DetailsMovieModule>.of();
}
