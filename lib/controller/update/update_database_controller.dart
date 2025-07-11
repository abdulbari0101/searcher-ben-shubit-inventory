import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory/data/models/product_model.dart';

import '../../core/helpers/multi_use_data.dart';
import '../../data/database/localDatabase/sqlite_database.dart';

class UpdateDatabaseController extends GetxController{
  Rxn<List<ProductModel>> productsList = Rxn<List<ProductModel>>([]);
  LocalDB mydb = LocalDB();
Future<void> updateDatabse() async{
  try{
    List<Map<String, dynamic>> data = await MultiUseData.supabaseClient
        .from(LocalDB.INVENTORY_TABLE)
        .select('*');

    productsList.value = data.map((dynamic map) => ProductModel.fromJson(map)).toList();
     if(productsList.value!.length > 0) {
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
                "${LocalDB.INVENTORY_PRODUCT_PRICE})"
                " VALUES(\"${product.productId}\",\"${product
                .name}\",\"${product.unit}\",\"${int.parse(
                product.quantity.toString())}\",\"${double.parse(
                product.price.toString())}\")");
      }
      Get.snackbar('Success', 'تم تحديث قاعدة البيانات بنجاح',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green.withOpacity(0.8),
          colorText: Colors.white);
    }else {
      Get.snackbar('Info', 'لا توجد بيانات لتحديث قاعدة البيانات',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.yellow.withOpacity(0.8),
          colorText: Colors.black);
    }
  }catch (e){
    Get.snackbar('Error', 'Error updating database: $e');
  }
    }
  }
