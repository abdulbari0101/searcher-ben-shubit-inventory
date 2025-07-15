import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory/core/constant/app_lables.dart';
import 'package:inventory/data/models/product_model.dart';
import 'package:shimmer/shimmer.dart';

import '../../data/database/localDatabase/sqlite_database.dart';

class InventoryController extends GetxController {
  List<ProductModel> inventoryList = [];
  List<String> searchOptions = [];
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
  DateTime? updateDate = null;
  @override
  void onInit() async {
    super.onInit();
    await readDateQuery();
    await readQuery(searchUsingQuery());
    await fillSearchOptions();
    //print("Date: "+updateDate.toString());
   inventoryIds = inventoryList.map((item) => item.inventoryId).toSet();
    units = inventoryList.map((item) => item.unit).toSet();
   // print('SetIDs: $inventoryIds');

  }
  fillSearchOptions() async{
    searchOptions.clear();
    //fill searchOptions with each words from inventroryList components
    for (ProductModel e in inventoryList) {
      if (e.productId != null && e.productId!.isNotEmpty) {
        searchOptions.add(e.productId!);
      }
      if (e.name != null && e.name!.isNotEmpty) {
        List<String> words = e.name!.split(' ');
        //searchOptions.add(e.name!);
        for (String word in words) {
          if (word.isNotEmpty && !searchOptions.contains(word)) {
            searchOptions.add(word);
          }
        }
      }

    }
  }
  readDateQuery() async{
    List<Map> response = await mydb.readDate(
      "SELECT * FROM '${LocalDB.LAST_UPDATE_TABLE}' ORDER BY id DESC LIMIT 1"
    );
    if (response.isNotEmpty) {
      updateDate = DateTime.parse(response[0][LocalDB.LAST_UPDATE].toString());
      print('Last Update: $updateDate');
    } else {
      updateDate = null;
      print('No last update found.');
    }
  }
  readQuery(String query) async{
    inventoryList.clear();
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
searchWord(String word) async{
    await readQuery(searchUsingQuery(word: word.trim()));

}
  searchUsingQuery({String word = ''}) {
      if (int.tryParse(word) != null) {
        word = int.parse(word).toString();
      }

    // Split the search query into individual words
    List<String> searchTerms = word.trim().split(' ').where((term) => term.isNotEmpty).toList();

    String baseQuery;
    if(selectedInventoryId != 'الكل') {
      baseQuery = "SELECT * FROM '${LocalDB.INVENTORY_TABLE}' WHERE \"${LocalDB.INVENTORY_ID}\" = \"${selectedInventoryId}\"";
    } else {
      baseQuery = "SELECT * FROM '${LocalDB.INVENTORY_TABLE}'";
    }

    if(selectedUnit != 'الكل') {
      baseQuery = "SELECT * FROM ($baseQuery) WHERE \"${LocalDB.INVENTORY_PRODUCT_UTIL}\" = \"${selectedUnit}\"";
    }

    // If no search terms, return the base query
    if (searchTerms.isEmpty) {
      return applySorting(baseQuery);
    }

    // Create a query that requires ALL search terms to match
    String searchConditions = searchTerms.map((term) {
      try {
        if (int.tryParse(term) != null) {
          return "(\"${LocalDB.INVENTORY_PRODUCT_NAME}\" LIKE \"%$term%\" OR \"${LocalDB.INVENTORY_PRODUCT_ID}\" LIKE \"%$term%\")";
        }
        return "(\"${LocalDB.INVENTORY_PRODUCT_NAME}\" LIKE \"%$term%\" OR \"${LocalDB.INVENTORY_PRODUCT_ID}\" LIKE \"%$term%\")";
      } catch(e) {
        print('Error parsing term: $e');
        return "";
      }
    }).join(" AND ");

    String finalQuery = "SELECT * FROM ($baseQuery) WHERE $searchConditions";

    return applySorting(finalQuery);
  }

  String applySorting(String query) {
    if(pressAvailableQuantity) {
      query = "SELECT * FROM ($query) WHERE \"${LocalDB.INVENTORY_PRODUCT_QUANTITY}\" != 0 ";
    }

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

    return query;
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
