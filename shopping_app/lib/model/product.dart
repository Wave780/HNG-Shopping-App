
import 'package:flutter/material.dart';

class Product {
  final String id;
  final AssetImage image;
  final String name;
  final double cost;
  Product({
    required this.id,
    required this.name,
    required this.cost,
    required this.image,
  });
}
