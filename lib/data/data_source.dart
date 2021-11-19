import 'package:flutter/cupertino.dart';
import 'package:team_apt_taks/data/model/category.dart';

class DataSource {
  var categories = [
    "All",
    Category.Air,
    Category.Presto,
    Category.Basket,
    Category.Tennis,
    Category.Football
  ];
}

var dataSource = DataSource();
//
// final dataSourceProvider = StateNotifierProvider((ref) {
//   return DataSource();
// });
