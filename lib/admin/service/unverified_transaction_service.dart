import 'package:dio/dio.dart';
import 'package:my_flutter_app/admin/model/unverified_transaction.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UnverifiedTransactionService {
  static const String _baseUrl = 'https://hwx70h6x-8000.asse.devtunnels.ms';

  final Dio _dio = Dio();

  Future<List<Transaction>> fetchUnverifiedTransactions() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final String? token = prefs.getString('token');

      if (token == null) throw Exception('Token not found');

      final Response response = await _dio.get(
        '$_baseUrl/admin/unverified-transaction',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );

      if (response.statusCode == 200) {
        // Assuming the response structure aligns with UnverifiedTransaction model
        final UnverifiedTransactionResponse =
            UnverifiedTransaction.fromMap(response.data);

        // Utilizing the error field from the UnverifiedTransaction response
        if (UnverifiedTransactionResponse.error == true) {
          throw Exception(
              'Error fetching unverified transactions: ${UnverifiedTransactionResponse.message}');
        }

        return UnverifiedTransactionResponse.transactions ?? [];
      } else {
        throw Exception(
            'Failed to load unverified transactions. Status code: ${response.statusCode}');
      }
    } catch (e) {
      // Log the error or handle it in a way that's appropriate for your application
      throw Exception('Failed to connect to the server: $e');
    }
  }

  Future<void> verifyTransaction(String transactionId) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final String? token = prefs.getString('token');

      if (token == null) throw Exception('Token not found');

      final Response response = await _dio.patch(
        '$_baseUrl/admin/verify-transaction',
        data: {
          'transactionId': transactionId,
        },
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );

      if (response.statusCode != 200) {
        throw Exception(
            'Failed to verify transaction. Status code: ${response.statusCode}');
      }
    } catch (e) {
      // Log the error or handle it in a way that's appropriate for your application
      throw Exception('Failed to connect to the server: $e');
    }
  }

  Future<void> rejectTransaction(String transactionId) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final String? token = prefs.getString('token');

      if (token == null) throw Exception('Token not found');

      final Response response = await _dio.patch(
        '$_baseUrl/admin/reject-transaction',
        data: {
          'transactionId': transactionId,
        },
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );

      if (response.statusCode != 200) {
        throw Exception(
            'Failed to reject transaction. Status code: ${response.statusCode}');
      }
    } catch (e) {
      // Log the error or handle it in a way that's appropriate for your application
      throw Exception('Failed to connect to the server: $e');
    }
  }
}
