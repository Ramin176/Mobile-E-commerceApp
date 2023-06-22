import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/screens/home/model/phoneModel.dart';

// ignore: camel_case_types, must_be_immutable
class productDetails extends StatefulWidget {
  List<phones> product;
  productDetails({required this.product});

  @override
  State<productDetails> createState() => _productDetailsState();
}

class _productDetailsState extends State<productDetails> {
  List productImage = [
    // product[]
  ];

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as int;

    List<phones> a = widget.product;
//  Text(product[args].phoneName),
    // ignore: unused_local_variable
    int activeIndex1 = 0;
    final List<String> urlImages = [
      "${a[args].ImgeUrl1}",
      "${a[args].ImgeUrl2}",
      "${a[args].ImgeUrl3}",
      "${a[args].ImgeUrl4}",
    ];
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // header of details
            Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey,
                      spreadRadius: 1,
                      blurRadius: 15,
                      blurStyle: BlurStyle.outer,
                      offset: const Offset(0, 15))
                ],
              ),
              child: CarouselSlider.builder(
                  itemCount: urlImages.length,
                  itemBuilder: (context, index, realIndex) {
                    final urlImage = urlImages[index];
                    return buildImage(urlImage, index);
                  },
                  options: CarouselOptions(
                    height: 300,
                    enlargeCenterPage: true,
                    enlargeStrategy: CenterPageEnlargeStrategy.height,
                    autoPlayInterval: Duration(seconds: 1),
                    viewportFraction: 1,
                    onPageChanged: (index, reason) {
                      setState(() {
                        activeIndex1 = index;
                      });
                    },
                  )),
            ),
            SizedBox(
              height: 32,
            ),
            Text(
              "${a[args].available}" + "  Peice ${a[args].cost}",
              style: TextStyle(color: Colors.grey.shade700),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "${a[args].phoneName}",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 34,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "${a[args].description}",
              style: TextStyle(color: Colors.black, fontSize: 16, height: 1.5),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "COLOR",
              style: TextStyle(color: Colors.black, fontSize: 16, height: 1.5),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.all(Radius.circular(34))),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade900,
                      borderRadius: BorderRadius.all(Radius.circular(34))),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.all(Radius.circular(34))),
                )
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              "DETAILS",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text(
                  "${a[args].memorize}",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  "${a[args].ram}",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  "${a[args].core}",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () {
                print("successfully");
              },
              child: Container(
                height: 70,
                width: double.infinity,
                child: Center(
                    child: Text(
                  "Add to Cart",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                )),
                decoration:
                    BoxDecoration(color: Color.fromARGB(255, 233, 210, 65)),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildImage(String urlImage, int index) => Container(
        margin: EdgeInsets.symmetric(horizontal: 12),
        color: Colors.grey,
        child: Image.network(
          urlImage,
          fit: BoxFit.cover,
        ),
      );

  //Widget buildIndicator()=>AnimatedSmoothIndicator(activeIndex: widget.activeIndex1, count: count)
}
