import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

const baseUrl = 'https://ecommerce.routemisr.com';

@injectable
class ApiManager {
  factory ApiManager() {
    return _instance;
  }

  late Dio dio;
  ApiManager._() {
    dio = Dio();
  }
   static final ApiManager _instance = ApiManager._();
  Future<Response> get(
      {required String endPoint,
      Map<String, dynamic>? param,
      Map<String, dynamic>? headers}) {
    return dio.get( endPoint,
        queryParameters: param, options: Options(headers: headers));
  }

  Future<Response> post(
      {required String endPoint,
      required Map<String, dynamic> body,
      Map<String, dynamic>? headers}) {
    return dio.post(endPoint,
        data: body,
        options: Options(
          headers: headers,
          validateStatus: (status) => true,
        ));
  }
}
