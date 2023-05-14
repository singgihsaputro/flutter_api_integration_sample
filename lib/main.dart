import 'package:flutter/material.dart';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kulineran',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
      ),
      home: const RestaurantListPage(title: 'Kulineran'),
    );
  }
}

class RestaurantListPage extends StatefulWidget {
  const RestaurantListPage({super.key, required this.title});

  final String title;

  @override
  State<RestaurantListPage> createState() => _RestaurantListPageState();
}

class _RestaurantListPageState extends State<RestaurantListPage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          title: Text(
            widget.title,
            style: const TextStyle(color: Colors.white),
          ),
        ),
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
                ),
                RestaurantList()
              ],
            )));
  }
}

class RestaurantList extends StatefulWidget {
  const RestaurantList({
    super.key,
  });

  @override
  State<StatefulWidget> createState() => _RestaurantListState();
}

class _RestaurantListState extends State<RestaurantList> {

  var restaurantList = [];

  Future<String> loadJsonData() async {
    var jsonText = await rootBundle.loadString('assets/resto.json');
    var jsonDecoded = json.decode(jsonText);
    restaurantList = jsonDecoded["restaurants"] as List;
    setState(() => restaurantList);
    return 'success';
  }

  @override
  Widget build(BuildContext context) {
    loadJsonData();
    return Expanded(
        child: Container(
          alignment: Alignment.centerLeft,
          child: ListView.builder(
            itemCount: restaurantList.length,
            itemBuilder: (context, index) => RestaurantItem(restaurant: Restaurant.fromJson(restaurantList[index])),
          ),
        ));
  }

}

class RestaurantItem extends StatelessWidget {

  final Restaurant restaurant;

  const RestaurantItem({
    super.key, required this.restaurant,
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
          onTap: () {},
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
                      new Icon(MdiIcons.googleMaps, color: Colors.red),
                      Padding(
                        padding: EdgeInsets.all(4),
                        child: Text(
                          restaurant.city,
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        ),
                      )
                    ]),
                    Expanded(
                        child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              left: 0, top: 0, right: 0, bottom: 2),
                          child: new Icon(MdiIcons.star, color: Colors.yellow,),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 4, top: 0, right: 0, bottom: 0),
                          child: Text(
                            restaurant.rating,
                            style: TextStyle(color: Colors.black, fontSize: 16),
                          ),
                        )
                      ],
                    ))
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

class Restaurant {
  Restaurant({required this.name, required this.city, required this.rating, required this.picture});

  final String name;

  final String city;

  final String rating;

  final String picture;

  factory Restaurant.fromJson(Map<String, dynamic> data) {
    final name = data['name'] as String;
    final city = data['city'] as String;
    final rating = (data['rating'] as num).toString();
    final picture = data["pictureId"] as String;
    return Restaurant(name: name, city: city, rating: rating, picture: picture);
  }
}