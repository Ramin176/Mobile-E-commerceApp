import 'package:flutter/material.dart';

class homeHead extends StatelessWidget {
  const homeHead({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          height: 300,
          width: double.infinity,
          color: const Color.fromARGB(255, 233, 210, 65),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 55, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/image/profile.jpeg'),
                      radius: 30,
                    ),
                    Icon(
                      Icons.menu,
                      color: Colors.white,
                      size: 35,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Hello, Ramin",
                  style: TextStyle(fontSize: 28, color: Colors.black),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "What do you want to buy?",
                  style: TextStyle(fontSize: 20, color: Colors.black),
                )
              ],
            ),
          ),
        ),
        Positioned(
          top: -20,
          left: -40,
          child: Container(
            height: 300,
            width: 300,
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(130)),
          ),
        ),
        Positioned(
          top: -20,
          right: -30,
          child: Container(
            height: 200,
            width: 200,
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
                borderRadius: BorderRadius.circular(130)),
          ),
        ),
      ],
    );
  }
}
