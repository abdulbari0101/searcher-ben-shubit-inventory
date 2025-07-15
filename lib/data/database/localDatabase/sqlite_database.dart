import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class LocalDB {
  //VERSION OF DATABASE
  static const int VERSION = 4;

  //Inventory table
  static const String INVENTORY_TABLE = 'INVENTORY_TABLE';
  static const String INVENTORY_PRODUCT_ID = 'INVENTORY_PRODUCT_ID';
  static const String INVENTORY_ID = 'INVENTORY_ID';
  static const String INVENTORY_PRODUCT_NAME = 'INVENTORY_PRODUCT_NAME';
  static const String INVENTORY_PRODUCT_UTIL = 'IVENTORY_PRODUCT_UTIL';
  static const String INVENTORY_PRODUCT_QUANTITY = 'IVENTORY_PRODUCT_QUANTITY';
  static const String INVENTORY_PRODUCT_PRICE = 'IVENTORY_PRODUCT_PRICE';
  static const String LAST_UPDATE_TABLE = 'LAST_UPDATE_TABLE';
  static const String LAST_UPDATE = 'LAST_UPDATE';

  static Database? _database;

  Future<Database?> get database async {
    _database ??= await initialDB();

    return _database;
  }

  initialDB() async {
    String databasepath = await getDatabasesPath();
    String path = join(databasepath, 'inventory.db');
    Database myDatabase = await openDatabase(path,
        onCreate: _onCreate, version: VERSION, onUpgrade: _onUpgrade);
    return myDatabase;
  }

  _onCreate(Database db, int version) async {
    await db.execute('''
    CREATE TABLE "$INVENTORY_TABLE" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "$INVENTORY_PRODUCT_ID" TEXT,
    "$INVENTORY_ID" TEXT,
    "$INVENTORY_PRODUCT_NAME" TEXT,
    "$INVENTORY_PRODUCT_UTIL" TEXT ,
    "$INVENTORY_PRODUCT_QUANTITY" INTEGER ,
    "$INVENTORY_PRODUCT_PRICE" REAL
)
    ''');
    await db.execute('''
    CREATE TABLE "$LAST_UPDATE_TABLE" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "$LAST_UPDATE" TIMESTAMP DEFAULT CURRENT_TIMESTAMP)
    ''');

    print("Oncreate.................");
  }

  _onUpgrade(Database db, int oldVersion, int newVersion) async {}

  readData(String sql) async {
    Database? mydb = await database;
    List<Map> response = await mydb!.rawQuery(sql);
    return response;
  }
  readDate(String sql) async {
    Database? mydb = await database;
    List<Map> response = await mydb!.rawQuery(sql);
    return response;
  }
  insertDate(String sql) async {
    Database? mydb = await database;
    int response = await mydb!.rawInsert(sql);
    return response;
  }



  insertData(String sql) async {
    Database? mydb = await database;
    int response = await mydb!.rawInsert(sql);
    return response;
  }

  updateData(String sql) async {
    Database? mydb = await database;
    int response = await mydb!.rawUpdate(sql);
    return response;
  }

  deleteData(String table) async {
    try{
      Database? mydb = await database;
      int response = await mydb!.delete(table);
      return response;
    }catch(e){
      print("Error deleting data from table $table: $e");
    }

  }
}
