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
    fetchProducts();
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

  Product? product;
  List<dynamic> _products = [];
  // Map<String, dynamic> _products = {};

  // void addProduct(Product product) {
  //   _products.add(product);
  // }
  List<dynamic> get products {
    return _products;
  }

  // Map<String, dynamic> get products {
  //   return _products;
  // }

  bool isLoading = false;
  void fetchProducts() async {
    isLoading = true;
    try {
      final response =
          await http.get(Uri.parse('https://dummyjson.com/products'));
      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonMap = jsonDecode(response.body);
        final List<dynamic> jsonList = jsonMap['products'];
        print(jsonList.length);
        // _products = jsonList.map((json) => Product.fromJson(json)).toList();

        _products = jsonList;
        isLoading = false;
        update();

        // final List<Product> productList =
        //     jsonList.map((json) => Product.fromJson(json)).toList();
        // Do something with the productList
      } else {
        throw Exception('Failed to fetch products: ${response.statusCode}');
      }
    } catch (e) {
      print(e);
    }
  }
}
