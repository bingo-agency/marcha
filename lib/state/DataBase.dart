import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../models/product.dart';

class DataBase extends GetxController {
  var counter = 0.obs;

  String initial_city = 'Select City';

  var tabIndex = 0.obs;

  void changeTabIndex(int index) {
    tabIndex.value = index;
  }

  @override
  void onInit() {
    super.onInit();
    fetchCategories();
    fetchProducts();
    fetchTopSellers();
    // fetchCities();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void incrementCounter() {
    counter++;
    update();
  }

  void getPermission() {
    update();
  }

  void getCurrentlocation() {
    update();
  }

  void setCity(city) {
    update();
  }

  List<dynamic> _products = [];
  List<dynamic> get products {
    return _products;
  }

  bool isLoading = false;
  void fetchProducts() async {
    isLoading = true;
    try {
      final response = await http.get(Uri.parse(
          'https://bingo-agency.com/marcha.com/api/homeProducts.php'));
      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonMap = jsonDecode(response.body);
        final List<dynamic> jsonList = jsonMap['homeProducts'];
        print(jsonList.length);
        _products = jsonList;
        isLoading = false;
        update();
      } else {
        throw Exception('Failed to fetch products: ${response.statusCode}');
      }
    } catch (e) {
      print(e);
    }
  }

  List<dynamic> _categories = [];
  List<dynamic> get categories {
    return _categories;
  }

  void fetchCategories() async {
    isLoading = true;
    try {
      final response = await http.get(
          Uri.parse('https://bingo-agency.com/marcha.com/api/categories.php'));
      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonMap = jsonDecode(response.body);
        final List<dynamic> jsonList = jsonMap['categories'];
        print(jsonList.length);
        _categories = jsonList;
        isLoading = false;
        update();
      } else {
        throw Exception('Failed to fetch products: ${response.statusCode}');
      }
    } catch (e) {
      print(e);
    }
  }

  List<dynamic> _topSellers = [];
  List<dynamic> get topSellers {
    return _topSellers;
  }

  void fetchTopSellers() async {
    isLoading = true;
    try {
      final response = await http.get(
          Uri.parse('https://bingo-agency.com/marcha.com/api/topSellers.php'));
      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonMap = jsonDecode(response.body);
        final List<dynamic> jsonList = jsonMap['topSellers'];
        print(jsonList.length);
        _topSellers = jsonList;
        isLoading = false;
        update();
      } else {
        throw Exception('Failed to fetch products: ${response.statusCode}');
      }
    } catch (e) {
      print(e);
    }
  }
}
