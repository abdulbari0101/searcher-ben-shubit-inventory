import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';
import 'package:inventory/data/models/product_model.dart';

import '../../core/helpers/multi_use_data.dart';
import '../../data/database/localDatabase/sqlite_database.dart';
import '../../data/models/date_model.dart';

class UpdateDatabaseController extends GetxController{
  Rxn<List<ProductModel>> productsList = Rxn<List<ProductModel>>([]);
  Rxn<List<DateModel>> dateList = Rxn<List<DateModel>>([]);
  LocalDB mydb = LocalDB();
  RxInt progress = 0.obs;
  int totalRows = 0;
  int processedRows = 0;
  RxBool loading = false.obs;

Future<void> updateDatabse() async{
  loading.value = true;
  progress.value = 0;
  processedRows = 0;
  totalRows = 0;
  try{
    // Fetch data from Supabase
    List<Map<String, dynamic>> data = await MultiUseData.supabaseClient
        .from(LocalDB.INVENTORY_TABLE)
        .select('*');

    productsList.value = data.map((dynamic map) => ProductModel.fromJson(map)).toList();
     if(productsList.value!.isNotEmpty) {
       totalRows = productsList.value!.length;

      // Clear the existing data in the local database table
      await mydb.deleteData(LocalDB.INVENTORY_TABLE);
      // Insert the new data into the local database table
      for (var product in productsList.value!) {
        mydb.insertData(
            "INSERT INTO ${LocalDB.INVENTORY_TABLE}("
                "${LocalDB.INVENTORY_PRODUCT_ID},"
                "${LocalDB.INVENTORY_PRODUCT_NAME},"
                " ${LocalDB.INVENTORY_PRODUCT_UTIL}, "
                "${LocalDB.INVENTORY_PRODUCT_QUANTITY}, "
                "${LocalDB.INVENTORY_PRODUCT_PRICE},"
                "${LocalDB.INVENTORY_ID})"
                " VALUES(\"${product.productId}\",\"${product
                .name}\",\"${product.unit}\",\"${
                product.quantity}\",\"${
                product.price.toString()}\","
                "\"${product.inventoryId}\")");

        // Update progress
        processedRows++;
        progress.value = ((processedRows / totalRows) * 100).round();
      }

    }else{
      loading.value = false;
       Get.snackbar('Error', 'لا توجد بيانات لتحديث قاعدة البيانات',
           snackPosition: SnackPosition.BOTTOM,
           backgroundColor: Colors.red.withOpacity(0.8),
           colorText: Colors.white);
     }
  }catch (e){
    loading.value = false;
    Get.snackbar("Error", "حدث خطأ أثناء تنزيل الحديثات الجديدة لان الانترنت مقطوع ",
        snackPosition: SnackPosition.TOP,backgroundColor: Colors.red,colorText: Colors.white);

  }
  if(progress.value ==100){
    try{
      // Insert last update record
      final lastUpdateData = await MultiUseData.supabaseClient.from('LAST_UPDATE_TABLE')
          .select('*')
          .order('LAST_UPDATE', ascending: false)
          .limit(1);
      dateList.value = lastUpdateData.map((dynamic map) => DateModel.fromJson(map)).toList();
      // Insert the current date as the last update
      await mydb.insertDate(
          "INSERT INTO ${LocalDB.LAST_UPDATE_TABLE}(${LocalDB.LAST_UPDATE})"
              " VALUES(\"${dateList.value!.first.date}\")"
      );
      // Show success message
      loading.value = false;
      Get.snackbar('Success', 'تم تحديث قاعدة البيانات بنجاح',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green.withOpacity(0.8),
          colorText: Colors.white);
      productsList.refresh();
    }catch(e){
  loading.value = false;
      Get.snackbar('Error', 'Error updating database: $e');
  }
    }else{
  loading.value = false;
    Get.snackbar('Error', 'لم تكتمل عملية التحديث',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red.withOpacity(0.8),
          colorText: Colors.white);
  }
}
  }
