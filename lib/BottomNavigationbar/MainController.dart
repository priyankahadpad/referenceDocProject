import 'package:demoproject/FaqScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  var selectedIndex = 0.obs;

  var currentTab = [
    const FAQScreen(),
    // const TabBa(),
    // const HomeScreen(),
  ].obs;

  void updateTab(int index) {
    selectedIndex.value = index;
  }
}
