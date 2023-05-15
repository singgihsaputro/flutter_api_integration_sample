class Restaurant {
  const Restaurant(
      {required this.id,
      required this.name,
      required this.city,
      required this.rating,
      required this.picture,
      required this.description,
      required this.menus});

  final String id;
  final String name;
  final String city;
  final String rating;
  final String picture;
  final String description;
  final List<Menu> menus;

  factory Restaurant.fromJson(Map<String, dynamic> data) {
    final id = (data['id'] as String) ?? "";
    final name = data['name'] as String;
    final city = data['city'] as String;
    final rating = (data['rating'] as num).toString();
    final picture = data["pictureId"] as String;
    final description = data["description"] as String;
    final foods =
        (data["menus"]["foods"] as List).map((e) => (e["name"] as String));
    final drinks =
        (data["menus"]["drinks"] as List).map((e) => (e["name"] as String));
    final menus = [
      Menu(type: "Food", menuName: foods.toList()),
      Menu(type: "Drink", menuName: drinks.toList())
    ];
    return Restaurant(
        id: id,
        name: name,
        city: city,
        rating: rating,
        picture: picture,
        description: description,
        menus: menus);
  }
}

class Menu {
  const Menu({required this.type, required this.menuName});

  final String type;
  final List<String> menuName;
}
