import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HelperFunctions {

  static double screenHeight({required double percentage}) {
    return MediaQuery.of(Get.context!).size.height * percentage;
  }

  static double screenWidth({required double percentage}) {
    return MediaQuery.of(Get.context!).size.width * percentage;
  }

}
