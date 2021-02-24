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
}
