import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
// import 'package:ecommerce/screens/home/constantData.dart';
// import 'package:ecommerce/screens/home/model/phoneModel.dart';

// ignore: camel_case_types, must_be_immutable
class constant extends StatefulWidget {
  String ImgUrl;
  String phoneType;
  constant({required this.ImgUrl, required this.phoneType});
  //  List<phones> selectType = [];

  @override
  State<constant> createState() => _constantState();
}

class _constantState extends State<constant> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: 100,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: Column(children: [
        Image(image: NetworkImage(widget.ImgUrl)),
        Text(
          widget.phoneType,
          style: const TextStyle(color: Colors.black, fontSize: 11),
        )
      ]),
    );
  }
}
