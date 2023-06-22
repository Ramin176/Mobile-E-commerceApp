import 'package:flutter/material.dart';
import 'package:ecommerce/productDtails/details.dart';
import 'package:ecommerce/screens/home/model/phoneModel.dart';
// import 'package:sqflite/sqflite.dart';
// import '../../sqflite.dart';
import '../../brain/constantData.dart';
import 'header/head.dart';
import 'package:get/get.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 237, 229, 229),
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          // appbar of the screen from head file consist: profile image and Stack wedget
          const Expanded(
            flex: 1,
            child: homeHead(),
          ),

// dynamic list of phones in home page
          Expanded(
            flex: 2,
            child: DefaultTabController(
              length: 3,
              child: Scaffold(
                appBar: AppBar(
                  flexibleSpace: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(255, 233, 210, 65),
                          Color.fromARGB(255, 195, 150, 28)
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                  ),
                  title: TextFormField(
                    cursorColor: Colors.white,
                    initialValue: 'Input text',
                    maxLength: 20,
                    decoration: const InputDecoration(
                      labelText: 'Search',
                      labelStyle: TextStyle(
                        color: Color(0xFF6200EE),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF6200EE)),
                      ),
                    ),
                  ),
                  bottom: TabBar(
                    labelColor: Colors.black,
                    tabs: [
                      Tab(
                        icon: Image.network(
                          'https://static.thenounproject.com/png/866250-200.png',
                          height: 50,
                          fit: BoxFit.cover,
                        ),
                        text: "SUMSUNG",
                        iconMargin: EdgeInsets.zero,
                      ),
                      Tab(
                        icon: Image.network(
                          'https://static.thenounproject.com/png/866250-200.png',
                          height: 50,
                          fit: BoxFit.cover,
                        ),
                        text: "IPHONE",
                        iconMargin: EdgeInsets.zero,
                      ),
                      Tab(
                        icon: Image.network(
                          'https://static.thenounproject.com/png/866250-200.png',
                          height: 50,
                          fit: BoxFit.cover,
                        ),
                        text: "HUAWEI",
                        iconMargin: EdgeInsets.zero,
                      ),
                    ],
                  ),
                ),
                body: TabBarView(
                  children: [
                    uiListofproduct(
                        constantData().SUMSUNG, constantData().SumsungDetails),
                    uiListofproduct(
                        constantData().IPHONE, constantData().iphoneDetails),
                    uiListofproduct(
                        constantData().HUAEI, constantData().HUEWIDetails),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  ListView uiListofproduct(List<phones> product, List<phones> productDetail) {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: product.length,
        itemBuilder: (BuildContext context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                Get.to(() => productDetails(product: productDetail),
                    arguments: index);
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: Row(
                    children: [
                      Expanded(
                          child: Image(
                        image: NetworkImage(product[index].imgUrl.toString()),
                        fit: BoxFit.cover,
                      )),
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product[index].phoneName,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            product[index].description,
                            style: const TextStyle(
                                fontSize: 12, color: Colors.grey),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          // this section is about const and add to card button
                        ],
                      ))
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
