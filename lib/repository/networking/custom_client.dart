import 'package:daily_reflect/repository/networking/config.dart';
import 'package:http/http.dart' as http;

class CustomClient extends http.BaseClient {
  final http.Client _inner;

  CustomClient(this._inner);

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) {
    request.headers['Authorization'] = Config.accessToken;
    return _inner.send(request);
  }
}