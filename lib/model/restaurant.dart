
class Restaurant {
  Restaurant({required this.id, required this.name, required this.city, required this.rating, required this.picture});

  final String id;

  final String name;

  final String city;

  final String rating;

  final String picture;

  factory Restaurant.fromJson(Map<String, dynamic> data) {
    final id = (data['id'] as String) ?? "";
    final name = data['name'] as String;
    final city = data['city'] as String;
    final rating = (data['rating'] as num).toString();
    final picture = data["pictureId"] as String;
    return Restaurant(id: id, name: name, city: city, rating: rating, picture: picture);
  }
}