
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/constant/app_lables.dart';
import '../../core/constant/app_pages.dart';
import '../../core/helpers/multi_use_data.dart';
import '../../data/database/localDatabase/sqlite_database.dart';
import '../../data/models/date_model.dart';

class HomeController extends GetxController {
  DateTime ? updateData = null;
  RxBool foundNewUpdate = false.obs;
  LocalDB mydb = LocalDB();
  RxBool isLoading = true.obs;
  Rxn<List<DateModel>> dateList = Rxn<List<DateModel>>([]);

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
        break;


    }
  }

  Future<void> openWebPage(String url) async {
    Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $url');
    }
  }
  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
  }
  checkForNewUpdate() async {
    try {
      final lastUpdateData = await MultiUseData.supabaseClient.from(
          'LAST_UPDATE_TABLE')
          .select('*')
          .order('LAST_UPDATE', ascending: false)
          .limit(1);
      dateList.value =
          lastUpdateData.map((dynamic map) => DateModel.fromJson(map)).toList();
      if (dateList.value!.isNotEmpty) {
        updateData = DateTime.parse(dateList.value![0].date!);
        DateTime? currentDate = await readCurrentDate();
        print("currentDate: $currentDate");
        print("updateData: $updateData");
        if (currentDate != null) {
          if (updateData!.isAfter(currentDate)) {
            foundNewUpdate.value = true;
          } else {
            foundNewUpdate.value = false;
          }
        } else if(updateData!=null){
          foundNewUpdate.value = true;
        }
      }
    }catch(e){
      Get.snackbar("Error", "حدث خطأ أثناء التحقق من التحديثات الجديدة لان الانترنت مقطوع ",
          snackPosition: SnackPosition.TOP,backgroundColor: Colors.red,colorText: Colors.white);
    }
  }
  Future<DateTime?> readCurrentDate() async{
    List<Map> response = await mydb.readDate(
        "SELECT * FROM '${LocalDB.LAST_UPDATE_TABLE}' ORDER BY id DESC LIMIT 1"
    );
    if (response.isNotEmpty) {
      return DateTime.parse(response[0][LocalDB.LAST_UPDATE].toString());

    } else {
      return null;
    }
  }
  @override
  void onReady() async{
    // TODO: implement onReady
    super.onReady();
    await checkForNewUpdate();
    isLoading.value = false;
  }
}