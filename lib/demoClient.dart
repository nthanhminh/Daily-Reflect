import 'package:daily_reflect/repository/networking/http_service.dart';

void main() async {
  List<dynamic> map = await HttpService.instance().getList(endPoint: '/entry/getAllEntries');
  print(map);
}