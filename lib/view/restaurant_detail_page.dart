import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../model/restaurant.dart';
import '../widget/menu_item.dart';

class RestaurantDetailPage extends StatelessWidget {
  final Restaurant restaurant;

  const RestaurantDetailPage({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          title: const Text(
            "Detil Kedai",
            style: TextStyle(color: Colors.white),
          ),
          iconTheme: IconThemeData(color: Colors.white),
        ),
        body: SingleChildScrollView(
            child: Container(
                color: Colors.white12,
                child: Column(
                  children: <Widget>[
                    Image.network(
                      restaurant.picture,
                      fit: BoxFit.fitWidth,
                    ),
                    Container(
                      padding: const EdgeInsets.only(
                          left: 10, top: 10, right: 10, bottom: 0),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        restaurant.name,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 30),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(
                          left: 8, top: 0, right: 10, bottom: 10),
                      child: Row(children: [
                        const Icon(MdiIcons.googleMaps, color: Colors.red),
                        Padding(
                          padding: const EdgeInsets.all(4),
                          child: Text(
                            restaurant.city,
                            style: const TextStyle(
                                color: Colors.black, fontSize: 18),
                          ),
                        )
                      ]),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.only(
                          left: 10, top: 10, right: 10, bottom: 0),
                      child: const Text(
                        "Description",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.only(
                          left: 10, top: 0, right: 10, bottom: 0),
                      child: Text(
                        restaurant.description,
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                    for (var item in restaurant.menus) MenuItem(menus: item)
                  ],
                ))));
  }
}