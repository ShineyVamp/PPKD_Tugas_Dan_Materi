import 'package:dio/dio.dart';
import 'package:flutterday6/TugasFlutter/tugas15disini/models/market_models.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'api_services_tugas.g.dart';

@RestApi(baseUrl: 'https://fakestoreapi.com')
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;
  @GET('/products')
  Future<List<Market>> getAllPosts();
}
