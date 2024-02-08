import 'package:dating_app/app/modules/partner/partner_model.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class ApiServices extends GetConnect {
  final Dio _dio = Dio();

  Future<List<dynamic>> getUser() async {
    try {
      final response = await _dio.get('https://randomuser.me/api/');

      if (response.statusCode != 200) {
        // if not successful
        throw Exception('Failed to load data !..');
      }

      final results = response.data['results'];

      final users = results
          .map((result) => User.fromJson(result))
          .toList(); //create User List

      return users;
    } catch (e) {
      throw Exception('Failed to load data !..');
    }
  }
}
