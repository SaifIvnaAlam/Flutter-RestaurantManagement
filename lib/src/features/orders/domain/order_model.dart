import 'dart:convert';
import 'package:flutter/foundation.dart';
import '../../products/domain/item_model.dart';

class OrderModel {
  String id;
  String orderBy;
  String orderDate;
  String totalPrice;
  int? tableNo;

  List<ItemModel> itemsOrdered;
  OrderModel({
    required this.id,
    required this.orderBy,
    required this.orderDate,
    required this.totalPrice,
    this.tableNo,
    required this.itemsOrdered,
  });

  OrderModel copyWith({
    String? id,
    String? orderBy,
    String? orderDate,
    String? totalPrice,
    int? tableNo,
    List<ItemModel>? itemsOrdered,
  }) {
    return OrderModel(
      id: id ?? this.id,
      orderBy: orderBy ?? this.orderBy,
      orderDate: orderDate ?? this.orderDate,
      totalPrice: totalPrice ?? this.totalPrice,
      tableNo: tableNo ?? this.tableNo,
      itemsOrdered: itemsOrdered ?? this.itemsOrdered,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'orderBy': orderBy});
    result.addAll({'orderDate': orderDate});
    result.addAll({'totalPrice': totalPrice});
    if (tableNo != null) {
      result.addAll({'tableNo': tableNo});
    }
    result
        .addAll({'itemsOrdered': itemsOrdered.map((x) => x.toMap()).toList()});

    return result;
  }

  factory OrderModel.fromMap(Map<String, dynamic> map) {
    return OrderModel(
      id: map['id'] ?? '',
      orderBy: map['orderBy'] ?? '',
      orderDate: map['orderDate'] ?? '',
      totalPrice: map['totalPrice'] ?? '',
      tableNo: map['tableNo']?.toInt(),
      itemsOrdered: List<ItemModel>.from(
          map['itemsOrdered']?.map((x) => ItemModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderModel.fromJson(String source) =>
      OrderModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'OrderModel(id: $id, orderBy: $orderBy, orderDate: $orderDate, totalPrice: $totalPrice, tableNo: $tableNo, itemsOrdered: $itemsOrdered)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is OrderModel &&
        other.id == id &&
        other.orderBy == orderBy &&
        other.orderDate == orderDate &&
        other.totalPrice == totalPrice &&
        other.tableNo == tableNo &&
        listEquals(other.itemsOrdered, itemsOrdered);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        orderBy.hashCode ^
        orderDate.hashCode ^
        totalPrice.hashCode ^
        tableNo.hashCode ^
        itemsOrdered.hashCode;
  }
}
