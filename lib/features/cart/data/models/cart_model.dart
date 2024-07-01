import 'dart:convert';

import '../../domain/entity/cart_entity.dart';

class CartModel extends CartEntity {
  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
        postId: json['post_id'],
        quantity: json['quantity'],
        listId: json['list_id'],
        color: json['color'],
        size: json['size'],
      );

  CartModel({
    required super.postId,
    required super.quantity,
    required super.listId,
    required super.color,
    required super.size,
  });

  factory CartModel.fromRawJson(String str) =>
      CartModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  Map<String, dynamic> toJson() => <String, dynamic>{
        'post_id': postId,
        'quantity': quantity,
        'list_id': listId,
        'color': color,
        'size': size,
      };
}
