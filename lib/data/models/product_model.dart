class ProductModel{
  String? productId;
  String? inventoryId;
  String? name;
  String? quantity;
  String? price;
  String? unit;

  ProductModel();

  ProductModel.Parameterized(
      {this.productId,this.inventoryId, this.name, this.quantity, this.price, this.unit});

factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel.Parameterized(
      productId: json['INVENTORY_PRODUCT_ID'].toString(),
      inventoryId: json['INVENTORY_ID'].toString(),
      name: json['INVENTORY_PRODUCT_NAME'],
      quantity: json['INVENTORY_PRODUCT_QUANTITY'].toString(),
      price: json['INVENTORY_PRODUCT_PRICE'].toString(),
      unit: json['INVENTORY_PRODUCT_UTIL'],
    );
  }

  Map<String, dynamic> toJson() => {
        'INVENTORY_PRODUCT_ID': productId,
        'INVENTORY_ID': inventoryId,
        'INVENTORY_PRODUCT_NAME': name,
        'INVENTORY_PRODUCT_QUANTITY': quantity,
        'INVENTORY_PRODUCT_PRICE': price,
        'INVENTORY_PRODUCT_UTIL': unit,
      };
}