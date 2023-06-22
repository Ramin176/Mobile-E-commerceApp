// ignore: file_names, unused_import
import 'package:flutter/material.dart';

class phones {
  String? imgUrl;
  String? ImgeUrl1;
  String? ImgeUrl2;
  String? ImgeUrl3;
  String? ImgeUrl4;
  String? available;
  String? memorize;
  String? ram;
  String? core;
  String phoneName;
  String description;
  double cost;

  phones(
      {this.imgUrl,
      required this.phoneName,
      required this.description,
      required this.cost,
      this.ImgeUrl1,
      this.ImgeUrl2,
      this.ImgeUrl3,
      this.ImgeUrl4,
      this.available,
      this.memorize,
      this.core,
      this.ram});
}
