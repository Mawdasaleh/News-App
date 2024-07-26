import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/services/news_services.dart';
import 'package:get/get.dart';

import '../../controller/news_controller.dart';

class Technology extends StatelessWidget {
  Technology({super.key});
  final controller = Get.find<NewsController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("News App"),
          backgroundColor: Colors.red,
        ),
        body: Obx(() {
          if (controller.isloading.value) {
            return const Center(
                child: CircularProgressIndicator(
              color: Colors.red,
            ));
          } else {
            return FutureBuilder(
              future: controller.getnewsbycategory("technology"),
              builder: (context, AsyncSnapshot snapshot) {
                return ListView.builder(
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 10,
                      shadowColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        children: [
                          Container(
                            width: double.infinity,
                            height: 150,
                            child: Image.network(controller
                                .listBycategory.value[index].urlToImage
                                .toString()),
                          ),
                          Text(
                            controller.listBycategory.value[index].title
                                .toString(),
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),
                            textDirection: TextDirection.rtl,
                          ),
                          Text(
                            controller.listBycategory.value[index].description
                                .toString(),
                            style: const TextStyle(
                              fontSize: 15,
                              color: Colors.grey,
                            ),
                            textDirection: TextDirection.rtl,
                          ),
                        ],
                      ),
                    );
                  },
                  itemCount: controller.listBycategory.value.length,
                );
              },
            );
          }
        }));
  }
}
