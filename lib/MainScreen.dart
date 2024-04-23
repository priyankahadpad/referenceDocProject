import 'package:demoproject/BottomNavigationbar/MainController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final MainController mainController = Get.put(MainController());

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        body: mainController.currentTab[mainController.selectedIndex.value],
      );
    });
  }
}
