import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

final options = BaseOptions(
  baseUrl: dotenv.env['BASE_API_URL'] ?? '',
  headers: {
    'Content-Type': 'application/json',
  },
  followRedirects: false,
);

Dio dio = Dio(options);
