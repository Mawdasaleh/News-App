import 'package:get/get.dart';

import '../controller/news_controller.dart';

class NewsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(NewsController());
  }
}
