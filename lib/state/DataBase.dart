import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../models/product.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DataBase extends GetxController {
  final firestore = FirebaseFirestore.instance;
  var counter = 0.obs;

  bool isDarkMode = true;

  void toggleDarkMode() {
    isDarkMode = !isDarkMode;
    if (isDarkMode) {
      Get.changeTheme(ThemeData.dark());
    } else {
      Get.changeTheme(ThemeData.light());
    }
    update();
  }

  Future<SharedPreferences> prefs = SharedPreferences.getInstance();

  List<XFile> image_Files = [];
  List<File> get imageFiles =>
      image_Files.map((file) => File(file.path)).toList();

  final picker = ImagePicker();

  Future<void> selectImages() async {
    final picker = ImagePicker();
    final pickedFiles = await picker.pickMultiImage(
      imageQuality: 50,
    );

    if (pickedFiles.isNotEmpty) {
      image_Files.addAll(pickedFiles);
      for (var i = 0; i < image_Files.length; i++) {
        print(image_Files[i]);
        print(i.toString());
      }
      update();
    }
  }

  Future<void> removeImage(int index) async {
    final file = File(image_Files[index].path);
    await file.delete();
    image_Files.removeAt(index);
    update();
  }

  //ends

  void pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    productImages.add(File(pickedFile!.path));
    update();
    // setState(() {
    // _propertyImages.add(File(pickedFile.path));
    // });
  }

  List<File> productImages = [];

  String initial_city = 'Select City';
  String sellerId = '1';
  double currentLocation = 00.00;

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

  // Future<List<Map<String, dynamic>>> fetchProducts() async {
  //   QuerySnapshot querySnapshot = await firestore.collection('products').get();
  //   List<Map<String, dynamic>> products = querySnapshot.docs
  //       .map((doc) => doc.data() as Map<String, dynamic>)
  //       .toList();
  //   _products = products;
  //   update();
  //   return products;
  // }

  List<dynamic> _products = [];
  List<dynamic> get products {
    return _products;
  }

  bool isLoading = false;

  void pushMultipleObjects() {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    List<Map<String, dynamic>> objects = [
      {
        "id": "15",
        "category_id": "3",
        "category": "Electronics",
        "title": "Razer Blade 15",
        "description": "Description of Razer Blade 15",
        "price": "150.99",
        "location": "",
        "city": "",
        "views": "0",
        "purpose": "Exchange",
        "thumbnail": "https://i.dummyjson.com/data/products/15/thumbnail.jpg",
        "product_images": [
          {
            "id": "47",
            "product_id": "15",
            "imageUrl": "https://i.dummyjson.com/data/products/15/1.jpg",
            "timestamp": "2023-06-26 20:13:05"
          },
          {
            "id": "48",
            "product_id": "15",
            "imageUrl": "https://i.dummyjson.com/data/products/15/2.jpg",
            "timestamp": "2023-06-26 20:13:05"
          },
          {
            "id": "49",
            "product_id": "15",
            "imageUrl": "https://i.dummyjson.com/data/products/15/3.jpg",
            "timestamp": "2023-06-26 20:13:05"
          }
        ],
        "seller_id": "1",
        "video_link": "",
        "status": "1",
        "featured": "0",
        "timestamp": "2023-06-26 23:28:48"
      },
      {
        "id": "14",
        "category_id": "3",
        "category": "Electronics",
        "title": "ASUS ROG Zephyrus G14",
        "description": "Description of ASUS ROG Zephyrus G14",
        "price": "140.99",
        "location": "",
        "city": "",
        "views": "0",
        "purpose": "Sale",
        "thumbnail": "https://i.dummyjson.com/data/products/14/thumbnail.jpg",
        "product_images": [
          {
            "id": "44",
            "product_id": "14",
            "imageUrl": "https://i.dummyjson.com/data/products/14/1.jpg",
            "timestamp": "2023-06-26 20:13:05"
          },
          {
            "id": "45",
            "product_id": "14",
            "imageUrl": "https://i.dummyjson.com/data/products/14/2.jpg",
            "timestamp": "2023-06-26 20:13:05"
          },
          {
            "id": "46",
            "product_id": "14",
            "imageUrl": "https://i.dummyjson.com/data/products/14/3.jpg",
            "timestamp": "2023-06-26 20:13:05"
          }
        ],
        "seller_id": "1",
        "video_link": "",
        "status": "1",
        "featured": "0",
        "timestamp": "2023-06-26 23:28:48"
      },
      {
        "id": "13",
        "category_id": "3",
        "category": "Electronics",
        "title": "Lenovo ThinkPad X1 Carbon",
        "description": "Description of Lenovo ThinkPad X1 Carbon",
        "price": "130.99",
        "location": "",
        "city": "",
        "views": "0",
        "purpose": "Exchange",
        "thumbnail": "https://i.dummyjson.com/data/products/16/thumbnail.jpg",
        "product_images": [
          {
            "id": "41",
            "product_id": "13",
            "imageUrl": "https://i.dummyjson.com/data/products/13/1.jpg",
            "timestamp": "2023-06-26 20:13:05"
          },
          {
            "id": "42",
            "product_id": "13",
            "imageUrl": "https://i.dummyjson.com/data/products/13/2.jpg",
            "timestamp": "2023-06-26 20:13:05"
          },
          {
            "id": "43",
            "product_id": "13",
            "imageUrl": "https://i.dummyjson.com/data/products/13/3.jpg",
            "timestamp": "2023-06-26 20:13:05"
          }
        ],
        "seller_id": "1",
        "video_link": "",
        "status": "1",
        "featured": "0",
        "timestamp": "2023-06-26 23:28:48"
      },
      {
        "id": "12",
        "category_id": "3",
        "category": "Electronics",
        "title": "HP Spectre x360",
        "description": "Description of HP Spectre x360",
        "price": "120.99",
        "location": "",
        "city": "",
        "views": "0",
        "purpose": "Sale",
        "thumbnail": "https://i.dummyjson.com/data/products/12/thumbnail.jpg",
        "product_images": [
          {
            "id": "38",
            "product_id": "12",
            "imageUrl": "https://i.dummyjson.com/data/products/12/1.jpg",
            "timestamp": "2023-06-26 20:13:05"
          },
          {
            "id": "39",
            "product_id": "12",
            "imageUrl": "https://i.dummyjson.com/data/products/12/2.jpg",
            "timestamp": "2023-06-26 20:13:05"
          },
          {
            "id": "40",
            "product_id": "12",
            "imageUrl": "https://i.dummyjson.com/data/products/12/3.jpg",
            "timestamp": "2023-06-26 20:13:05"
          }
        ],
        "seller_id": "1",
        "video_link": "",
        "status": "1",
        "featured": "0",
        "timestamp": "2023-06-26 23:28:48"
      },
      {
        "id": "11",
        "category_id": "3",
        "category": "Electronics",
        "title": "Dell XPS 13",
        "description": "Description of Dell XPS 13",
        "price": "110.99",
        "location": "",
        "city": "",
        "views": "0",
        "purpose": "Exchange",
        "thumbnail": "https://i.dummyjson.com/data/products/11/thumbnail.jpg",
        "product_images": [
          {
            "id": "35",
            "product_id": "11",
            "imageUrl": "https://i.dummyjson.com/data/products/11/1.jpg",
            "timestamp": "2023-06-26 20:13:05"
          },
          {
            "id": "36",
            "product_id": "11",
            "imageUrl": "https://i.dummyjson.com/data/products/11/2.jpg",
            "timestamp": "2023-06-26 20:13:05"
          },
          {
            "id": "37",
            "product_id": "11",
            "imageUrl": "https://i.dummyjson.com/data/products/11/3.jpg",
            "timestamp": "2023-06-26 20:13:05"
          }
        ],
        "seller_id": "1",
        "video_link": "",
        "status": "1",
        "featured": "0",
        "timestamp": "2023-06-26 23:28:48"
      },
      {
        "id": "10",
        "category_id": "3",
        "category": "Electronics",
        "title": "Sony WH-1000XM4",
        "description": "Description of Sony WH-1000XM4",
        "price": "100.99",
        "location": "",
        "city": "",
        "views": "0",
        "purpose": "Sale",
        "thumbnail": "https://i.dummyjson.com/data/products/17/thumbnail.jpg",
        "product_images": [
          {
            "id": "32",
            "product_id": "10",
            "imageUrl": "https://i.dummyjson.com/data/products/10/1.jpg",
            "timestamp": "2023-06-26 20:13:05"
          },
          {
            "id": "33",
            "product_id": "10",
            "imageUrl": "https://i.dummyjson.com/data/products/10/2.jpg",
            "timestamp": "2023-06-26 20:13:05"
          },
          {
            "id": "34",
            "product_id": "10",
            "imageUrl": "https://i.dummyjson.com/data/products/10/3.jpg",
            "timestamp": "2023-06-26 20:13:05"
          }
        ],
        "seller_id": "1",
        "video_link": "",
        "status": "1",
        "featured": "0",
        "timestamp": "2023-06-26 23:28:48"
      },
      {
        "id": "9",
        "category_id": "3",
        "category": "Electronics",
        "title": "Samsung Galaxy Buds Pro",
        "description": "Description of Samsung Galaxy Buds Pro",
        "price": "90.99",
        "location": "",
        "city": "",
        "views": "0",
        "purpose": "Exchange",
        "thumbnail": "https://i.dummyjson.com/data/products/9/thumbnail.jpg",
        "product_images": [
          {
            "id": "29",
            "product_id": "9",
            "imageUrl": "https://i.dummyjson.com/data/products/9/1.jpg",
            "timestamp": "2023-06-26 20:13:05"
          },
          {
            "id": "30",
            "product_id": "9",
            "imageUrl": "https://i.dummyjson.com/data/products/9/2.jpg",
            "timestamp": "2023-06-26 20:13:05"
          },
          {
            "id": "31",
            "product_id": "9",
            "imageUrl": "https://i.dummyjson.com/data/products/9/3.jpg",
            "timestamp": "2023-06-26 20:13:05"
          }
        ],
        "seller_id": "1",
        "video_link": "",
        "status": "1",
        "featured": "0",
        "timestamp": "2023-06-26 23:28:48"
      },
      {
        "id": "8",
        "category_id": "3",
        "category": "Electronics",
        "title": "Apple Watch Series 6",
        "description": "Description of Apple Watch Series 6",
        "price": "80.99",
        "location": "",
        "city": "",
        "views": "0",
        "purpose": "Sale",
        "thumbnail": "https://i.dummyjson.com/data/products/8/thumbnail.jpg",
        "product_images": [
          {
            "id": "26",
            "product_id": "8",
            "imageUrl": "https://i.dummyjson.com/data/products/8/1.jpg",
            "timestamp": "2023-06-26 20:13:05"
          },
          {
            "id": "27",
            "product_id": "8",
            "imageUrl": "https://i.dummyjson.com/data/products/8/2.jpg",
            "timestamp": "2023-06-26 20:13:05"
          },
          {
            "id": "28",
            "product_id": "8",
            "imageUrl": "https://i.dummyjson.com/data/products/8/3.jpg",
            "timestamp": "2023-06-26 20:13:05"
          }
        ],
        "seller_id": "1",
        "video_link": "",
        "status": "1",
        "featured": "0",
        "timestamp": "2023-06-26 23:28:48"
      },
      {
        "id": "7",
        "category_id": "3",
        "category": "Electronics",
        "title": "Xiaomi Mi 11 Ultra",
        "description": "Description of Xiaomi Mi 11 Ultra",
        "price": "70.99",
        "location": "",
        "city": "",
        "views": "0",
        "purpose": "Exchange",
        "thumbnail": "https://i.dummyjson.com/data/products/7/thumbnail.jpg",
        "product_images": [
          {
            "id": "23",
            "product_id": "7",
            "imageUrl": "https://i.dummyjson.com/data/products/7/1.jpg",
            "timestamp": "2023-06-26 20:13:05"
          },
          {
            "id": "24",
            "product_id": "7",
            "imageUrl": "https://i.dummyjson.com/data/products/7/2.jpg",
            "timestamp": "2023-06-26 20:13:05"
          },
          {
            "id": "25",
            "product_id": "7",
            "imageUrl": "https://i.dummyjson.com/data/products/7/3.jpg",
            "timestamp": "2023-06-26 20:13:05"
          }
        ],
        "seller_id": "1",
        "video_link": "",
        "status": "1",
        "featured": "0",
        "timestamp": "2023-06-26 23:28:48"
      },
      {
        "id": "6",
        "category_id": "3",
        "category": "Electronics",
        "title": "LG Wing",
        "description": "Description of LG Wing",
        "price": "60.99",
        "location": "",
        "city": "",
        "views": "0",
        "purpose": "Sale",
        "thumbnail": "https://i.dummyjson.com/data/products/5/thumbnail.jpg",
        "product_images": [
          {
            "id": "20",
            "product_id": "6",
            "imageUrl": "https://i.dummyjson.com/data/products/6/1.jpg",
            "timestamp": "2023-06-26 20:13:05"
          },
          {
            "id": "21",
            "product_id": "6",
            "imageUrl": "https://i.dummyjson.com/data/products/6/2.jpg",
            "timestamp": "2023-06-26 20:13:05"
          },
          {
            "id": "22",
            "product_id": "6",
            "imageUrl": "https://i.dummyjson.com/data/products/6/3.jpg",
            "timestamp": "2023-06-26 20:13:05"
          }
        ],
        "seller_id": "1",
        "video_link": "",
        "status": "1",
        "featured": "0",
        "timestamp": "2023-06-26 23:28:48"
      },
      {
        "id": "5",
        "category_id": "3",
        "category": "Electronics",
        "title": "Sony Xperia 1 III",
        "description": "Description of Sony Xperia 1 III",
        "price": "50.99",
        "location": "",
        "city": "",
        "views": "0",
        "purpose": "Exchange",
        "thumbnail": "https://i.dummyjson.com/data/products/5/thumbnail.jpg",
        "product_images": [
          {
            "id": "17",
            "product_id": "5",
            "imageUrl": "https://i.dummyjson.com/data/products/5/1.jpg",
            "timestamp": "2023-06-26 20:13:05"
          },
          {
            "id": "18",
            "product_id": "5",
            "imageUrl": "https://i.dummyjson.com/data/products/5/2.jpg",
            "timestamp": "2023-06-26 20:13:05"
          },
          {
            "id": "19",
            "product_id": "5",
            "imageUrl": "https://i.dummyjson.com/data/products/5/3.jpg",
            "timestamp": "2023-06-26 20:13:05"
          }
        ],
        "seller_id": "1",
        "video_link": "",
        "status": "1",
        "featured": "0",
        "timestamp": "2023-06-26 23:28:48"
      },
      {
        "id": "4",
        "category_id": "3",
        "category": "Electronics",
        "title": "OnePlus 9 Pro",
        "description": "Description of OnePlus 9 Pro",
        "price": "40.99",
        "location": "",
        "city": "",
        "views": "44",
        "purpose": "Sale",
        "thumbnail": "https://i.dummyjson.com/data/products/4/thumbnail.jpg",
        "product_images": [
          {
            "id": "14",
            "product_id": "4",
            "imageUrl": "https://i.dummyjson.com/data/products/4/1.jpg",
            "timestamp": "2023-06-26 20:13:05"
          },
          {
            "id": "15",
            "product_id": "4",
            "imageUrl": "https://i.dummyjson.com/data/products/4/2.jpg",
            "timestamp": "2023-06-26 20:13:05"
          },
          {
            "id": "16",
            "product_id": "4",
            "imageUrl": "https://i.dummyjson.com/data/products/4/3.jpg",
            "timestamp": "2023-06-26 20:13:05"
          }
        ],
        "seller_id": "1",
        "video_link": "",
        "status": "1",
        "featured": "0",
        "timestamp": "2023-06-26 23:28:48"
      },
      {
        "id": "3",
        "category_id": "3",
        "category": "Electronics",
        "title": "Google Pixel 5",
        "description": "Description of Google Pixel 5",
        "price": "30.99",
        "location": "",
        "city": "",
        "views": "33",
        "purpose": "Exchange",
        "thumbnail": "https://i.dummyjson.com/data/products/3/thumbnail.jpg",
        "product_images": [
          {
            "id": "11",
            "product_id": "3",
            "imageUrl": "https://i.dummyjson.com/data/products/3/1.jpg",
            "timestamp": "2023-06-26 20:13:05"
          },
          {
            "id": "12",
            "product_id": "3",
            "imageUrl": "https://i.dummyjson.com/data/products/3/2.jpg",
            "timestamp": "2023-06-26 20:13:05"
          },
          {
            "id": "13",
            "product_id": "3",
            "imageUrl": "https://i.dummyjson.com/data/products/3/3.jpg",
            "timestamp": "2023-06-26 20:13:05"
          }
        ],
        "seller_id": "1",
        "video_link": "",
        "status": "1",
        "featured": "0",
        "timestamp": "2023-06-26 23:28:48"
      },
      {
        "id": "2",
        "category_id": "3",
        "category": "Electronics",
        "title": "Samsung Galaxy S21",
        "description": "Description of Samsung Galaxy S21",
        "price": "20.99",
        "location": "",
        "city": "",
        "views": "22",
        "purpose": "Sale",
        "thumbnail": "https://i.dummyjson.com/data/products/2/thumbnail.jpg",
        "product_images": [
          {
            "id": "8",
            "product_id": "2",
            "imageUrl": "https://i.dummyjson.com/data/products/2/1.jpg",
            "timestamp": "2023-06-26 20:13:05"
          },
          {
            "id": "9",
            "product_id": "2",
            "imageUrl": "https://i.dummyjson.com/data/products/2/2.jpg",
            "timestamp": "2023-06-26 20:13:05"
          },
          {
            "id": "10",
            "product_id": "2",
            "imageUrl": "https://i.dummyjson.com/data/products/2/3.jpg",
            "timestamp": "2023-06-26 20:13:05"
          }
        ],
        "seller_id": "1",
        "video_link": "",
        "status": "1",
        "featured": "0",
        "timestamp": "2023-06-26 23:28:48"
      },
      {
        "id": "1",
        "category_id": "3",
        "category": "Electronics",
        "title": "iPhone 9",
        "description": "An apple mobile which is nothing like apple",
        "price": "549.00",
        "location": "",
        "city": "",
        "views": "1",
        "purpose": "Exchange",
        "thumbnail": "https://i.dummyjson.com/data/products/1/thumbnail.jpg",
        "product_images": [
          {
            "id": "1",
            "product_id": "1",
            "imageUrl": "https://i.dummyjson.com/data/products/1/1.jpg",
            "timestamp": "2023-06-26 19:52:43"
          },
          {
            "id": "2",
            "product_id": "1",
            "imageUrl": "https://i.dummyjson.com/data/products/1/2.jpg",
            "timestamp": "2023-06-26 19:52:43"
          },
          {
            "id": "3",
            "product_id": "1",
            "imageUrl": "https://i.dummyjson.com/data/products/1/3.jpg",
            "timestamp": "2023-06-26 19:52:43"
          },
          {
            "id": "4",
            "product_id": "1",
            "imageUrl": "https://i.dummyjson.com/data/products/1/4.jpg",
            "timestamp": "2023-06-26 19:52:43"
          },
          {
            "id": "5",
            "product_id": "1",
            "imageUrl": "https://i.dummyjson.com/data/products/1/1.jpg",
            "timestamp": "2023-06-26 20:13:05"
          },
          {
            "id": "6",
            "product_id": "1",
            "imageUrl": "https://i.dummyjson.com/data/products/1/2.jpg",
            "timestamp": "2023-06-26 20:13:05"
          },
          {
            "id": "7",
            "product_id": "1",
            "imageUrl": "https://i.dummyjson.com/data/products/1/3.jpg",
            "timestamp": "2023-06-26 20:13:05"
          }
        ],
        "seller_id": "1",
        "video_link": "",
        "status": "1",
        "featured": "0",
        "timestamp": "2023-06-26 23:28:48"
      }
    ];
    var batch = firestore.batch();
    objects.forEach((object) {
      DocumentReference documentReference =
          firestore.collection('products').doc();
      batch.set(documentReference, object);
    });
    batch.commit().then((_) {
      print('Objects pushed successfully');
    }).catchError((error) {
      print('Failed to push objects: $error');
    });
  }

  addCategories() async {
    // pushMultipleObjects();

    // DocumentReference documentReference =
    //     await firestore.collection('categories').add({
    //   "id": "12",
    //   "name": "Motors",
    //   "subCategories": [
    //     {"name": "Cars"},
    //     {"name": "Motorcycles & Scooters"},
    //     {"name": "Car Technology"},
    //     {"name": "Exterior Parts & Accessories"},
    //     {"name": "Interior Parts & Accessories"},
    //     {"name": "Engines & Components"},
    //     {"name": "Wheels, Tyres & Parts"},
    //     {"name": "Steering & Suspension"}
    //   ],
    //   "icon": "motors.svg",
    //   "imageUrl": "https://bingo-agency.com/marcha.com/images/motors.png",
    //   "timestamp": "2023-06-26 19:25:57"
    // }).whenComplete(() {
    //   print('Completed.');
    // });

    // String documentId = documentReference.id;
    // print('New document ID: $documentId');

    // print('done');
    update();
  }

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

  // Future<List<Map<String, dynamic>>> fetchCategories() async {
  //   QuerySnapshot querySnapshot = await firestore
  //       .collection('categories')
  //       .orderBy('id', descending: false)
  //       .get();
  //   List<Map<String, dynamic>> categories = querySnapshot.docs.map((doc) {
  //     Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
  //     data['id'] = int.parse(data['id']);
  //     return data;
  //   }).toList();
  //   categories.sort((a, b) => a['id'].compareTo(b['id']));
  //   _categories = categories;
  //   update();
  //   return categories;
  // }

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
