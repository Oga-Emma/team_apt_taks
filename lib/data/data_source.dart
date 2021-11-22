import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:team_apt_taks/data/model/category.dart';
import 'package:team_apt_taks/data/model/shoe.dart';

class DataSource {
  var categories = [
    "All",
    StoreCategory.Air,
    StoreCategory.Presto,
    StoreCategory.Basket,
    StoreCategory.Tennis,
    StoreCategory.Football
  ];

  var shoes = [
    Shoe(
        "Alpha Savage",
        "",
        1299,
        [
          StoreCategory.Air,
          StoreCategory.Presto,
          StoreCategory.Basket,
        ],
        "_1",
        Colors.grey),
    Shoe(
      "Air Max 97",
      "",
      1299,
      [
        StoreCategory.Air,
        StoreCategory.Basket,
        StoreCategory.Football,
      ],
      "_2",
      Colors.blueGrey,
    ),
    Shoe(
        "KD13 EP",
        "",
        1299,
        [StoreCategory.Tennis, StoreCategory.Presto, StoreCategory.Football],
        "_3",
        Colors.redAccent,
        textColor: Colors.black),
    // Shoe(
    //     "Jordan Air 1",
    //     "",
    //     1299,
    //     [StoreCategory.Football, StoreCategory.Presto, StoreCategory.Basket],
    //     "_4",
    //     Colors.pink.shade700),
    // Shoe(
    //     "Dunk High",
    //     "",
    //     1299,
    //     [
    //       StoreCategory.Basket,
    //       StoreCategory.Presto,
    //       StoreCategory.Basket,
    //     ],
    //     "_5",
    //     Colors.blue.shade700),
    Shoe(
        "x Vaporfly",
        "",
        1299,
        [StoreCategory.Basket, StoreCategory.Presto, StoreCategory.Tennis],
        "_6",
        Colors.blue.shade700),
    Shoe(
        "x Supreme",
        "",
        1299,
        [
          StoreCategory.Air,
          StoreCategory.Tennis,
          StoreCategory.Football,
        ],
        "_7",
        Colors.brown.shade200),
    Shoe(
        "Dunk Low",
        "",
        1299,
        [
          StoreCategory.Air,
          StoreCategory.Basket,
          StoreCategory.Football,
        ],
        "_8",
        Colors.green.shade300),
    Shoe(
        "x Clot",
        "",
        1299,
        [StoreCategory.Air, StoreCategory.Football, StoreCategory.Presto],
        "_9",
        Colors.yellowAccent.shade700,
        textColor: Colors.black),
    Shoe(
        "Air Max 270",
        "",
        1299,
        [StoreCategory.Air, StoreCategory.Football, StoreCategory.Presto],
        "_10",
        Colors.orange,
        textColor: Colors.black),
  ]..shuffle();
}

var dataSource = DataSource();
//
// final dataSourceProvider = StateNotifierProvider((ref) {
//   return DataSource();
// });
