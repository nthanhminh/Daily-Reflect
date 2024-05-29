import 'dart:convert';
import 'dart:io';

import 'package:daily_reflect/repository/networking/config.dart';
import 'package:daily_reflect/repository/networking/http_client_factory.dart';
import 'package:http/http.dart';
import 'package:http/retry.dart';

import 'custom_client.dart';

typedef JSON = Map<String, dynamic>;

class HttpService {
  String baseUrl = Config.baseUrl;
  late final Client _inner = RetryClient(CustomClient(httpClient()));

  HttpService._();

  static HttpService instance() {
    return HttpService._();
  }

  Future<JSON?> get({required String endPoint, JSON? queryParams}) async {
    final url = Uri.https(baseUrl, endPoint, queryParams);
    Response response = await _inner.get(url);
    if(response.statusCode != 204 && response.statusCode != 200) {
      return null;
    }

    final JSON parsed = json.decode(response.body);
    return parsed;
  }

  Future<JSON?> post({required String endPoint, JSON? queryParams, Object? body}) async {
    final url = Uri.https(baseUrl, endPoint, queryParams);
    Response response = await _inner.post(url, body: body);
    if(response.statusCode != 204 && response.statusCode != 200) {
      return null;
    }

    final JSON parsed = json.decode(response.body);
    return parsed;
  }

  Future<JSON?> delete({required String endPoint, JSON? queryParams, Object? body}) async {
    final url = Uri.https(baseUrl, endPoint, queryParams);
    Response response = await _inner.delete(url, body: body);
    if(response.statusCode != 204 && response.statusCode != 200) {
      return null;
    }

    final JSON parsed = json.decode(response.body);
    return parsed;
  }

  Future<JSON?> put({required String endPoint, JSON? queryParams, Object? body}) async {
    final url = Uri.https(baseUrl, endPoint, queryParams);
    Response response = await _inner.put(url, body: body);
    if(response.statusCode != 204 && response.statusCode != 200) {
      return null;
    }

    final JSON parsed = json.decode(response.body);
    return parsed;
  }

  Future<JSON?> patch({required String endPoint, JSON? queryParams, Object? body}) async {
    final url = Uri.https(baseUrl, endPoint, queryParams);
    Response response = await _inner.patch(url, body: body);
    if(response.statusCode != 204 && response.statusCode != 200) {
      return null;
    }

    final JSON parsed = json.decode(response.body);
    return parsed;
  }
}