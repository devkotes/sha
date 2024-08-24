import 'dart:convert';

import 'package:sha/services/auth_service.dart';
import 'package:http/http.dart' as http;
import 'package:sha/shared/values.dart';

class WalletService {
  Future<void> updatePin({
    required String oldPin,
    required String newPin,
  }) async {
    try {
      final token = await AuthService().getToken();

      Map<String, String> data = {"previous_pin": oldPin, "new_pin": newPin};

      final res = await http.put(
        Uri.parse('$baseUrl/wallets'),
        body: data,
        headers: {
          'Authorization': token,
        },
      );

      if (res.statusCode != 200) {
        throw jsonDecode(res.body)['message'];
      }
    } catch (e) {
      rethrow;
    }
  }
}
