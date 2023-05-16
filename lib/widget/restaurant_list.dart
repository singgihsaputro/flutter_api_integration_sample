import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/repository/repository.dart';
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
  var _loading = true;

  Future<void> getRestaurantList(BuildContext context) async {
    try {
      var data = await Repository().loadRestaurantList();
      setState(() {
        _loading = false;
        restaurantList = data.toList();
      });
    } catch (error) {
      print(error);
      setState(() {
        _loading = false;
      });
      _showErrorToast(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    getRestaurantList(context);
    return _loading
        ? const CircularProgressIndicator()
        : Expanded(
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

void _showErrorToast(BuildContext context) {
  final scaffold = ScaffoldMessenger.of(context);
  scaffold.showSnackBar(
    SnackBar(
      content: const Text('Sistem sedang dalam perbaikan, coba sesaat lagi'),
      action: SnackBarAction(
          label: 'OK', onPressed: scaffold.hideCurrentSnackBar),
    ),
  );
}
