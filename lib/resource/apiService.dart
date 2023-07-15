import 'package:dio/dio.dart';
import 'package:suitmedia/models/user.dart';

class ApiServices {
  Dio dio = Dio();

  Future<Map<String, dynamic>> getUser() async {
    const String url = 'https://reqres.in/api/users?page=1&per_page=10';
    try {
      Response response = await dio.get(url);
      return response.data;
    } on DioError catch (error, trace) {
      print('DIO error : $error, on : $trace');
      return error.response!.data;
    }
  }
  
  Future<List<Data>> userServices() async {
    List<Data> userList = [];
    var response = await getUser();
    if (response.containsKey('data') && response['data'] is List) {
      userList =
          (response['data'] as List).map((e) => Data.fromJson(e)).toList();
    }
    return userList;
  }
}
