import 'package:flutter/material.dart';

import '../widget/restaurant_list.dart';

class RestaurantListPage extends StatelessWidget {
  const RestaurantListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          title: const Text(
            "Kulineran",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Container(
            color: Colors.white12,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(6),
                  child: Container(
                    padding: const EdgeInsets.all(4),
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
                ),
                const RestaurantList()
              ],
            )));
  }
}
