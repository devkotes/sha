import 'dart:convert';

import 'package:sha/models/tips_model.dart';
import 'package:sha/services/auth_service.dart';
import 'package:http/http.dart' as http;
import 'package:sha/shared/values.dart';

class TipsService {
  Future<List<TipsModel>> getTips() async {
    try {
      final token = await AuthService().getToken();

      final res = await http.get(
        Uri.parse('$baseUrl/tips'),
        headers: {
          'Authorization': token,
        },
      );

      if (res.statusCode == 200) {
        return List<TipsModel>.from(
          jsonDecode(res.body)['data'].map((tips) => TipsModel.fromJson(tips)),
        ).toList();
      } else {
        throw jsonDecode(res.body)['message'];
      }
    } catch (e) {
      rethrow;
    }
  }
}
