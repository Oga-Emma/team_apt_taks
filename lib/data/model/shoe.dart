import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'category.dart';

class Shoe {
  final String name;
  final String description;
  final String image;
  final double price;
  final List<String> categories;
  final Color color;
  final Color textColor;

  Shoe(this.name, this.description, this.price, this.categories, this.image,
      this.color,
      {this.textColor = Colors.white});
}
