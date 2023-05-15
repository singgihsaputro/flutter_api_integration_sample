import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/restaurant.dart';

class MenuItem extends StatelessWidget {
  final Menu menus;

  const MenuItem({super.key, required this.menus});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 0),
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              menus.type,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
              alignment: Alignment.centerLeft,
              child: SizedBox(
                height: 150,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: menus.menuName.length,
                  itemBuilder: (context, index) => Container(
                    height: 180,
                    width: 140,
                    child: Card(
                        color: Colors.white,
                        surfaceTintColor: Colors.white,
                        elevation: 6,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: Column(
                          children: [
                            Expanded(child: Image.asset("assets/image/food_placeholder.png")),
                            Container(
                              padding: EdgeInsets.all(8),
                              child: Text(
                                menus.menuName[index],
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(fontSize: 14),
                              ),
                            )
                          ],
                        )),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
