import 'package:get/get.dart';

class NavBarController extends GetxController{
  var currentIdx = 0.obs;

  switchToHome() => currentIdx = RxInt(0);
  switchToPosts() => currentIdx = RxInt(1);
  switchToHistory() => currentIdx = RxInt(2);
  switchToProfile() => currentIdx = RxInt(3);
}