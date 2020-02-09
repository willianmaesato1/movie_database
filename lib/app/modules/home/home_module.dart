import 'package:dio/dio.dart';
import 'package:movie_database/app/modules/home/home_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:movie_database/app/modules/home/home_page.dart';
import 'package:movie_database/app/modules/home/repository/home_repository.dart';
import 'package:movie_database/share/utils/custom_dio/custom_dio.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => HomeController(i.get<HomeRepository>())),
        Bind((i) => HomeRepository(i.get<CustomDio>())),
        Bind((i) => Dio()),
        Bind((i) => CustomDio()),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => HomePage()),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
