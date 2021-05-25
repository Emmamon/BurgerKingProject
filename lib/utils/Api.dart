import 'dart:convert';

import 'package:burgerking/models/Category.dart';
import 'package:burgerking/models/Tags.dart';
import 'package:burgerking/utils/Constants.dart';

class Api {
  static Future<List<Category>> getAllCats() async {
    await Future.delayed(Duration(seconds: 1));
    return cats;
  }

  static Future<List<Tags>> getAllTags() async {
    await Future.delayed(Duration(seconds: 1));
    return tags;
  }

  static Future<bool> userLogin(phone, password) async {
    var userData = {"phone": phone, "password": password};
    var encodeData = jsonEncode(userData);
    print(encodeData);
    return true;
  }

  static Future<bool> userRegister(name, email, phone, password) async {
    var userData = {
      "name": name,
      "email": email,
      "phone": phone,
      "password": password
    };
    var encodeData = jsonEncode(userData);
    print(encodeData);
    return true;
  }
}
