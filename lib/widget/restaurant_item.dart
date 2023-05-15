import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:restaurant_app/view/restaurant_detail_page.dart';

import '../model/restaurant.dart';

class RestaurantItem extends StatelessWidget {
  final Restaurant restaurant;

  const RestaurantItem({
    super.key,
    required this.restaurant,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 8, top: 3, right: 8, bottom: 3),
      child: Card(
        color: Colors.white,
        surfaceTintColor: Colors.white,
        elevation: 6,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      RestaurantDetailPage(restaurant: restaurant)),
            );
          },
          child: Row(
            children: [
              Container(
                height: 120,
                child: Image.network(
                  restaurant.picture,
                  width: 120,
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                  child: Container(
                height: 120,
                padding: EdgeInsets.all(6),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                        padding: EdgeInsets.only(
                            left: 4, top: 0, right: 0, bottom: 0),
                        child: Text(
                          restaurant.name,
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        )),
                    Row(children: [
                      const Icon(MdiIcons.googleMaps, color: Colors.red),
                      Padding(
                        padding: EdgeInsets.all(4),
                        child: Text(
                          restaurant.city,
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        ),
                      )
                    ]),
                  ],
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
