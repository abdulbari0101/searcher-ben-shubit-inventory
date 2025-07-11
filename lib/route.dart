
import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:inventory/view/screen/home/home_page.dart';
import 'package:inventory/view/screen/home/web_page.dart';
import 'package:inventory/view/screen/inventory/inventory_page.dart';

import 'core/constant/app_pages.dart';

List<GetPage<dynamic>>? getPages = [
  GetPage(
    name: AppPage.page_home,
    page: () => const HomePage(),
    transition: Transition.fadeIn,
    curve: Curves.easeInOut,
    transitionDuration: const Duration(milliseconds: 300),
  ),
  
  GetPage(
    name: AppPage.page_inventory,
    page: () => const InventoryPage(),
    transition: Transition.fadeIn,
    curve: Curves.easeInOut,
    transitionDuration: const Duration(milliseconds: 300),
  ),
  GetPage(
    name: AppPage.page_web,
    page: () => const WebPage(),
    transition: Transition.fadeIn,
    curve: Curves.easeInOut,
    transitionDuration: const Duration(milliseconds: 300),
  ),
];