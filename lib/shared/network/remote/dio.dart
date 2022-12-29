// ignore_for_file: non_constant_identifier_names, camel_case_types

import 'package:dio/dio.dart';

class Dio_Helper {
  static Dio? dio;
  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://api.openai.com/v1',
        receiveDataWhenStatusError: true,
        headers: {
          'Content-Type': 'application/json',
        },
      ),
    );
  }
  static Future<Response> postData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
    var api_key = "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",
  }) async {
    dio!.options.headers = {
      'Authorization': "Bearer $api_key",
      'Content-Type': 'application/json'
    };
    return dio!.post(url, queryParameters: query, data: data);
  }
}
