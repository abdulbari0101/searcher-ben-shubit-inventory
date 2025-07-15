import 'dart:developer';
import 'dart:io';
import 'package:excel/excel.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory/data/database/localDatabase/sqlite_database.dart';
import '../../core/constant/app_lables.dart';

class UploadDatabaseController extends GetxController {
  FilePickerResult? file;
  LocalDB mydb = LocalDB();
  goToUploadPage() async {
    //Get.toNamed(AppPage.page_uploadDatabase);
    await getExeclFile();
    if (file != null) {
      Get.snackbar('Info', 'جاري تحميل البيانات',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.blue.withOpacity(0.8),
          colorText: Colors.white);
      if (await loadData()) {
        Get.snackbar('Success', 'تم تحميل البيانات بنجاح',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green.withOpacity(0.8),
            colorText: Colors.white);
      } else {
        Get.snackbar('Error', 'فشل تحميل البيانات',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red.withOpacity(0.8),
            colorText: Colors.white);
      }
    }
  }

  getExeclFile() async {
    file = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: FileType.custom,
      allowedExtensions: ['xlsx'],
    );
    return file;
  }

  loadData() async {
    final bytes = File(file!.files.single.path!).readAsBytesSync();
    var excel = Excel.decodeBytes(bytes);
    await deleteDataTable(AppLabels.inventory_page_title);
    return await loadInventoryData(excel);
  }

  loadInventoryData(var excel) async {
    bool updateStatus = false;
    int indexProId = 0,
        indexInvId = 1,
        indexProName = 2,
        indexProUtil = 3,
        indexProQuantity = 4,
        indexProPrice = 5;
    int rowNum = 0;
    for (var table in excel.tables.keys) {
      for (var row in excel.tables[table].rows) {
        List<dynamic> dataRecord = [];
        for (var cell in row) {
          try {
            if (cell != null) {
              var value = cell.value;
              dataRecord.add(value);
            }
          } catch (e) {
            print("My Error1: $e");
          }
        }
        try {
          if (rowNum == 0) {
            indexProId = dataRecord.indexWhere(
                (element) => element.toString().contains("رقم الصنف"));
            indexInvId = dataRecord
                .indexWhere((element) => element.toString().contains("المخزن"));
            indexProName = dataRecord.indexWhere(
                (element) => element.toString().contains('اسم الصنف'));
            indexProUtil = dataRecord
                .indexWhere((element) => element.toString().contains('الوحدة'));
            indexProQuantity = dataRecord.indexWhere(
                (element) => element.toString().contains('المتوفرة'));
            indexProPrice = dataRecord.indexWhere(
                (element) => element.toString().contains('التكلفة'));
            if ([
              indexProId,
              indexProName,
              indexProUtil,
              indexProQuantity,
              indexProPrice
            ].contains(-1)) return false; // If any index is -1, return false
          }
          if (rowNum > 0) {
            if (dataRecord.isEmpty)
              continue; // Skip empty rows
            else if (dataRecord[indexProId] == null ||
                dataRecord[indexProId] == "" ||
                dataRecord[indexInvId] == null ||
                dataRecord[indexInvId] == "" ||
                dataRecord[indexProName] == null ||
                dataRecord[indexProName] == "" ||
                dataRecord[indexProUtil] == null ||
                dataRecord[indexProUtil] == "" ||
                dataRecord[indexProQuantity] == null ||
                dataRecord[indexProQuantity] == "" ||
                dataRecord[indexProPrice] == null ||
                dataRecord[indexProPrice] == "") {
              continue; // Skip rows with null values
            }
            int respons = await mydb.insertData(
                "INSERT INTO ${LocalDB.INVENTORY_TABLE}("
                "${LocalDB.INVENTORY_PRODUCT_ID},"
                "${LocalDB.INVENTORY_ID},"
                "${LocalDB.INVENTORY_PRODUCT_NAME},"
                " ${LocalDB.INVENTORY_PRODUCT_UTIL}, "
                "${LocalDB.INVENTORY_PRODUCT_QUANTITY}, "
                "${LocalDB.INVENTORY_PRODUCT_PRICE})"
                " VALUES(\"${dataRecord[indexProId]}\",\"${dataRecord[indexInvId]}\",\"${dataRecord[indexProName].toString().trim()}\",\"${dataRecord[indexProUtil].toString().trim().split(' ').length > 1 ? dataRecord[indexProUtil].toString().trim().split(' ').last : dataRecord[indexProUtil].toString().trim()}\",\"${dataRecord[indexProQuantity]}\",\"${dataRecord[indexProPrice]}\")");
            print("respons: " + respons.toString());
            if (respons > 0) {
              updateStatus = true;
              mydb.insertDate(
                  "INSERT INTO ${LocalDB.LAST_UPDATE_TABLE}(${LocalDB.LAST_UPDATE})"
                      " VALUES(\"${DateTime.now().toIso8601String()}\")"
              );
            }
          }
        } catch (e) {
          print("My Error2: $e");
        }
        rowNum++;
        dataRecord.clear();
      }
    }
    return updateStatus;
  }

  deleteDataTable(String table) async {
    switch (table) {
      case AppLabels.tires_page_tilte:
        //  await mydb.deleteData("${LocalDB.TIRE_TABLE}");
        break;
      case AppLabels.oil_page_title:
        //await mydb.deleteData("${LocalDB.OIL_TABLE}");
        break;
      case AppLabels.inventory_page_title:
        await mydb.deleteData(LocalDB.INVENTORY_TABLE);
        break;
    }
  }
}
