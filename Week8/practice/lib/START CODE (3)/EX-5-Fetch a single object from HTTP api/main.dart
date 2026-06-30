import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

// void main() async {
//   Uri url = Uri.parse('https://fooapi.com/api/products');

//   // 1- Get the request response
//   Response response = await http.get(url);

//   // 2- Check the responsae status
//   if (response.statusCode != 200) {
//     throw Exception('Failed to fetch products (HTTP ${response.statusCode})');
//   }

//   // 3- Parse the response
//   Map<String, dynamic> json = jsonDecode(response.body);
//   List<dynamic> jsonItems = json["data"];

//   Map<String, dynamic> jsonItem = jsonItems[0];

//   Product product = Product.fromJson(jsonItem);
//   print(product);
// }

// class Product {
//   final String title;
//   final double price;

//   Product({required this.title, required this.price});

//   static Product fromJson(Map<String, dynamic> json) {
//     const String titleKey = 'title';
//     const String priceKey = 'price';

//     assert(json[titleKey] is String);
//     assert(json[priceKey] is double);

//     String title = json[titleKey];
//     double price = json[priceKey];

//     return Product(title: title, price: price);
//   }

//   @override
//   String toString() {
//     return "Product $title - price= $price";
//   }
// }

void main() async {
  Uri url = Uri.parse('https://jsonplaceholder.typicode.com/users/1');

  Response response = await http.get(url);

  if (response.statusCode != 200) {
    throw Exception('Failed to fetch products  (HTTP ${response.statusCode})');
  }

  Map<String, dynamic> json = jsonDecode(response.body);

  User user = User.fromJson(json);
  print(user);
}

class User {
  final int id;
  final String name;
  final String username;
  final String email;

  User({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
  });

  static User fromJson(Map<String, dynamic> json) {
    const String idKey = 'id';
    const String nameKey = 'name';
    const String usernameKey = 'username';
    const String emailKey = 'email';

    assert(json[idKey] is int);
    assert(json[nameKey] is String);
    assert(json[usernameKey] is String);
    assert(json[emailKey] is String);

    int id = json[idKey];
    String name = json[nameKey];
    String username = json[usernameKey];
    String email = json[emailKey];

    return User(id: id, name: name, username: username, email: email);
  }

  @override
  String toString() {
    return 'id: $id\nname: $name\nusername: $username\nemail: $email';
  }
}


// {
//   "id": 1,
//   "name": "Leanne Graham",
//   "username": "Bret",
//   "email": "Sincere@april.biz",
//   "address": {
//     "street": "Kulas Light",
//     "suite": "Apt. 556",
//     "city": "Gwenborough",
//     "zipcode": "92998-3874",
//     "geo": {
//       "lat": "-37.3159",
//       "lng": "81.1496"
//     }
//   },
//   "phone": "1-770-736-8031 x56442",
//   "website": "hildegard.org",
//   "company": {
//     "name": "Romaguera-Crona",
//     "catchPhrase": "Multi-layered client-server neural-net",
//     "bs": "harness real-time e-markets"
//   }
// }