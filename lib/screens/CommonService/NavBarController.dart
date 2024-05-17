import 'package:get/get.dart';

class NavBarController extends GetxController{
  var currentIdx = 0.obs;

  switchToHome() => currentIdx(0);
  switchToPosts() => currentIdx(1);
  switchToHistory() => currentIdx(2);
  switchToProfile() => currentIdx(3);
}