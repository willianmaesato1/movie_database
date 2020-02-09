import 'package:dio/dio.dart';
import 'package:movie_database/share/utils/consts.dart';
import 'package:movie_database/share/utils/custom_dio/interceptors.dart';

class CustomDio extends Dio{

  CustomDio(){
    options.baseUrl = base_url;
    options.connectTimeout = 5000;
    interceptors.add(CustomIntercetors());
  }
}