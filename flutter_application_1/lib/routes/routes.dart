import 'package:get/get.dart';
import '../binding/news_binding.dart';

import '../view/homePage.dart';

class AppRoutes {
  //initial Rote
  static const home = Routes.HomeScreen;

//getPages
  static final routes = [
    GetPage(
      name: Routes.HomeScreen,
      page: () => HomePage(),
      binding: NewsBinding(),
    ),
  ];
}

class Routes {
  static const HomeScreen = '/HomePage';
}
