// ignore_for_file: constant_identifier_names, non_constant_identifier_names

import 'package:dio/dio.dart';
import 'package:heart_rate/core/config/env.dart';

mixin DioManagerMixin {
  final service = Dio(
    BaseOptions(
      baseUrl: BASE_URL,
      headers: <String, String>{
        'Authorization': BEAR_AUTH,
        'Content-Type': 'application/json',
      },
    ),
  );
}

String BASE_URL = Env.baseUrl;
String API_KEY = Env.apiKey;
String BEAR_AUTH = 'Bearer $API_KEY';
