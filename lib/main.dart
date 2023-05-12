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

class RestaurantList extends StatelessWidget {
  const RestaurantList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      alignment: Alignment.centerLeft,
      child: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) => RestaurantItem(),
      ),
    ));
  }
}

class RestaurantItem extends StatelessWidget {
  const RestaurantItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
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
                  "https://restaurant-api.dicoding.dev/images/medium/25",
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
                          "Nama Resto",
                          style: TextStyle(color: Colors.black, fontSize: 18),
                        )),
                    Row(children: [
                      new Icon(MdiIcons.googleMaps),
                      Padding(
                        padding: EdgeInsets.all(4),
                        child: Text(
                          "Kota",
                          style: TextStyle(color: Colors.black, fontSize: 18),
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
                          child: new Icon(MdiIcons.star),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 4, top: 0, right: 0, bottom: 0),
                          child: Text(
                            "Rating",
                            style: TextStyle(color: Colors.black, fontSize: 18),
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
