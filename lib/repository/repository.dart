import 'dart:convert';
import 'package:http/http.dart' as http;

class Repository {

  final base_url = "https://private-0327f-restaurant38.apiary-mock.com";

  Future<List> loadRestaurantList() async {
    const pathRestaurant = "/restaurant";
    http.Response response = await http.get(Uri.parse(base_url + pathRestaurant));
    print("response status " +response.statusCode.toString());
    if(response.statusCode == 403) {
      throw Exception();
    }
    final decodeList = json.decode(response.body)['restaurants'];
    return decodeList;
  }

}