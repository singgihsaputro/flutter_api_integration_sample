import 'package:flutter/material.dart';

import '../widget/restaurant_list.dart';

class RestaurantDetailPage extends StatefulWidget {
  const RestaurantDetailPage({super.key, required this.id});

  final String id;

  @override
  State<RestaurantDetailPage> createState() => _RestaurantDetailPage();
}

class _RestaurantDetailPage extends State<RestaurantDetailPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            color: Colors.white12,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(6),
                  child: Container(
                    padding: EdgeInsets.all(4),
                    alignment: Alignment.centerLeft,
                    child: const Padding(
                      padding: EdgeInsets.all(6),
                      child: Text(
                        "Silakan memilih kedai yang kamu suka",
                        style: TextStyle(fontSize: 18),
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ),
                )
              ],
            )));
  }
}
