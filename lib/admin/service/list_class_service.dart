import 'package:dio/dio.dart';
import 'package:my_flutter_app/admin/model/list_class_model.dart';
import 'package:my_flutter_app/style/baseURl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ListClassService {
  final Dio _dio = Dio();

  Future<List<Class>> fetchClassesByEducationLevel(
      String educationLevel) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final String? token = prefs.getString('token');

      if (token == null) throw Exception('Token not found');

      final Response response = await _dio.get(
        '$baseUrl/admin/list-class/$educationLevel',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );

      if (response.statusCode == 200) {
        final listClassResponse = ListClass.fromMap(response.data);

        if (listClassResponse.error == true) {
          throw Exception(
              'Error fetching classes: ${listClassResponse.message}');
        }

        return listClassResponse.classes ?? [];
      } else {
        throw Exception(
            'Failed to load classes. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to connect to the server: $e');
    }
  }
}
