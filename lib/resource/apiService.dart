import 'package:dio/dio.dart';
import 'package:suitmedia/models/user.dart';

class ApiServices {
  Dio dio = Dio();

  Future<Map<String, dynamic>> getUser({int page = 1}) async {
    final String url = 'https://reqres.in/api/users';
    final int perPage = 4;

    try {
      Response response = await dio.get(
        url,
        queryParameters: {'page': page, 'per_page': perPage},
      );
      return response.data;

    } on DioException catch (error, trace) {
      print('DIO error: $error, on: $trace');
      return error.response!.data;
    }
  }
}
