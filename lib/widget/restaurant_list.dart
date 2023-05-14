import 'package:flutter/cupertino.dart';
import 'package:restaurant_app/util/json.dart';
import 'package:restaurant_app/widget/restaurant_item.dart';

import '../model/restaurant.dart';

class RestaurantList extends StatefulWidget {
  const RestaurantList({
    super.key,
  });

  @override
  State<StatefulWidget> createState() => _RestaurantListState();
}

class _RestaurantListState extends State<RestaurantList> {
  var restaurantList = [];

  @override
  Widget build(BuildContext context) {
    JSON().loadJsonData((value) {
      setState(() {
        restaurantList = value;
      });
    });
    return Expanded(
        child: Container(
      alignment: Alignment.centerLeft,
      child: ListView.builder(
        itemCount: restaurantList.length,
        itemBuilder: (context, index) => RestaurantItem(
            restaurant: Restaurant.fromJson(restaurantList[index])),
      ),
    ));
  }
}
