import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/services/news_services.dart';
import 'package:get/get.dart';
import '../controller/news_controller.dart';
import 'botoom_nav_bar/health.dart';
import 'botoom_nav_bar/scince.dart';
import 'botoom_nav_bar/technology.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final controller = Get.find<NewsController>();
  List<Widget> screens = [
    Science(),
    Health(),
    Technology(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(() {
        return BottomNavigationBar(
          selectedItemColor: Colors.red,
          currentIndex: controller.currentIndex.value,
          onTap: (value) {
            controller.currentIndex.value = value;
          },
          items: const [
            BottomNavigationBarItem(
                label: "science", icon: Icon(Icons.science)),
            BottomNavigationBarItem(
                label: "health", icon: Icon(Icons.health_and_safety)),
            BottomNavigationBarItem(
                label: "technology", icon: Icon(Icons.wifi)),
          ],
        );
      }),
      body: Obx(() {
        return screens[controller.currentIndex.value];
      }),
    );
  }
}
//  body: Obx(() {
//         if (controller.isloading.value) {
//           return const Center(
//               child: CircularProgressIndicator(
//             color: Colors.red,
//           ));
//         } else {
//           return FutureBuilder(
//             future: controller.getnews(),
//             builder: (context, AsyncSnapshot snapshot) {
//               return ListView.builder(
//                   itemBuilder: (context, index) {
//                     return Card(
//                       elevation: 10,
//                       shadowColor: Colors.black,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(15),
//                       ),
//                       child: Column(
//                         children: [
//                           Container(
//                             width: double.infinity,
//                             height: 150,
//                             child: Image.network(controller
//                                 .newslist[index].urlToImage
//                                 .toString()),
//                           ),
//                           Text(
//                             controller.newslist[index].title.toString(),
//                             style: const TextStyle(
//                               fontSize: 20,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.grey,
//                             ),
//                             textDirection: TextDirection.rtl,
//                           ),
//                           Text(
//                             controller.newslist[index].description.toString(),
//                             style: const TextStyle(
//                               fontSize: 15,
//                               color: Colors.grey,
//                             ),
//                             textDirection: TextDirection.rtl,
//                           ),
//                         ],
//                       ),
//                     );
//                   },
//                   itemCount: controller.newslist.length);
//             },
//           );
//         }
//       })
