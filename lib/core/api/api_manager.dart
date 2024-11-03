import 'package:dio/dio.dart';

const baseUrl = 'https://ecommerce.routemisr.com';

class ApiManager {
  late Dio dio;
  ApiManager() {
    dio = Dio();
  }
  Future<Response> get(
      {required String endPoint,
      required Map<String, dynamic> param,
      Map<String, dynamic>? headers}) {
    return dio.get(baseUrl + endPoint,
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
