import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory/core/constant/app_lables.dart';
import 'package:inventory/data/models/product_model.dart';
import 'package:shimmer/shimmer.dart';

import '../../data/database/localDatabase/sqlite_database.dart';

class InventoryController extends GetxController {
  List<ProductModel> inventoryList = [];
  LocalDB mydb = LocalDB();
  bool isLoading = true,
      pressHighestPrice = false,
      pressSmallestPrice = false,
      pressAvailableQuantity = false,
      pressHighestQuantity = false,
      pressUnit = false,
      pressSmallestQuantity = false;

  String? selectedInventoryId = 'الكل'; // Default inventory ID, can be set dynamically
  String? selectedUnit = 'الكل';
  late Set<String?> inventoryIds = {};
  late Set<String?> units = {};
  @override
  void onInit() async {
    super.onInit();
    await searchUsingQuery();
    inventoryIds = inventoryList.map((item) => item.inventoryId).toSet();
    units = inventoryList.map((item) => item.unit).toSet();
   // print('SetIDs: $inventoryIds');
  }

  pressFilterButton(String buttonName) async{
    switch (buttonName) {
      case AppLabels.highest_price:
        pressHighestPrice = (pressHighestPrice) ? false : true;
        pressSmallestPrice = false;
        pressSmallestQuantity = false;
        pressHighestQuantity = false;
        break;
      case AppLabels.smallest_price:
        pressSmallestPrice = (pressSmallestPrice) ? false : true;
        pressHighestPrice = false;
        pressSmallestQuantity = false;
        pressHighestQuantity = false;
        break;
      case AppLabels.highest_quntity:
        pressHighestQuantity = (pressHighestQuantity) ? false : true;
        pressSmallestQuantity = false;
        pressHighestPrice = false;
        pressSmallestPrice = false;
        break;
      case AppLabels.smallest_quntity:
        pressSmallestQuantity = (pressSmallestQuantity) ? false : true;
        pressHighestQuantity = false;
        pressHighestPrice = false;
        pressSmallestPrice = false;
        break;
      case AppLabels.unit:
        pressUnit = (pressUnit)?false:true;
      case AppLabels.available_quntity:
        pressAvailableQuantity = (pressAvailableQuantity) ? false : true;

    }
    update();
  }

  getTotalPrice() {
    double totalPrice = 0.0;
    int count = 0;
    try {
      for (ProductModel e in inventoryList) {
        totalPrice += double.parse(e.price.toString()) *
            double.parse(e.quantity.toString());
        count++;
       // print('count $count : id: ${e.productId} price: ${e.price} quantity: ${e.quantity} ');
      }
    }catch (e){
      print('Error-> getTotalPrice: $e ');
    }
    return totalPrice.toStringAsFixed(2);
  }

  searchUsingQuery({var word = ''}) async {
    if (int.tryParse(word) != null) {
      word = int.parse(word).toString();
    }
    inventoryList.clear();
    String query;
    if(selectedInventoryId != 'الكل')
    query = "SELECT * FROM '${LocalDB.INVENTORY_TABLE}' WHERE \"${LocalDB.INVENTORY_ID}\" = \"${selectedInventoryId}\"";
    else
    query = "SELECT * FROM '${LocalDB.INVENTORY_TABLE}'";

    if(selectedUnit != 'الكل')
      query = "SELECT * FROM ($query) WHERE \"${LocalDB.INVENTORY_PRODUCT_UTIL}\" = \"${selectedUnit}\" ";
    else
      query = "SELECT * FROM ($query)";

    query =
    ("SELECT * FROM (${query}) WHERE \"${LocalDB.INVENTORY_PRODUCT_NAME}\" LIKE \"%$word%\" OR "
        " \"${LocalDB.INVENTORY_PRODUCT_ID}\" LIKE \"%$word%\" ");
    if(pressAvailableQuantity) {
      query = "SELECT * FROM ($query) WHERE \"${LocalDB.INVENTORY_PRODUCT_QUANTITY}\" != 0 ";
    }

    // if(pressUnit)
    //   query = "SELECT * FROM (${query}) WHERE \"${LocalDB.INVENTORY_PRODUCT_UTIL}\" != 0 ";

    if(pressHighestQuantity) {
      query = "SELECT * FROM ($query) ORDER BY \"${LocalDB.INVENTORY_PRODUCT_QUANTITY}\" DESC ";
    }

   if(pressSmallestQuantity) {
     query = "SELECT * FROM ($query) ORDER BY \"${LocalDB.INVENTORY_PRODUCT_QUANTITY}\" ASC ";
   }


 if(pressHighestPrice) {
   query = "SELECT * FROM ($query) ORDER BY \"${LocalDB.INVENTORY_PRODUCT_PRICE}\" DESC ";
 }

 if(pressSmallestPrice) {
   query = "SELECT * FROM ($query) ORDER BY \"${LocalDB.INVENTORY_PRODUCT_PRICE}\" ASC ";
 }


   List<Map> response = await mydb.readData(query);
    if (response.isNotEmpty) {
      for (var e in response) {
        inventoryList.add(
            ProductModel.Parameterized(
              productId: e[LocalDB.INVENTORY_PRODUCT_ID].toString(),
              inventoryId: e[LocalDB.INVENTORY_ID].toString(),
                name: e[LocalDB.INVENTORY_PRODUCT_NAME],
                quantity: e[LocalDB.INVENTORY_PRODUCT_QUANTITY].toString(),
                unit: e[LocalDB.INVENTORY_PRODUCT_UTIL],
                price: e[LocalDB.INVENTORY_PRODUCT_PRICE].toString()),
          );

      }
    }
    update();
    isLoading = false;
  }


  Shimmer getShimmerLoading() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 100,
            width: 100,
            color: Colors.white,
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: double.infinity,
                  height: 18.0,
                  color: Colors.white,
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: double.infinity,
                  height: 14.0,
                  color: Colors.white,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
