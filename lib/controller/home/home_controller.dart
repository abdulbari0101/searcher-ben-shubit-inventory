
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/constant/app_lables.dart';
import '../../core/constant/app_pages.dart';

class HomeController extends GetxController {
  goToPage(String page) {
    switch (page) {
      case AppLabels.tires_page_tilte:
      // Get.toNamed(AppPage.page_tires);
        break;
      case AppLabels.oil_page_title:
      //  Get.toNamed(AppPage.page_oils);
        break;
      case AppLabels.inventory_page_title:
        Get.toNamed(AppPage.page_inventory);

    }
  }
  Future<void> openWebPage(String url) async {
    Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $url');
    }
  }
}