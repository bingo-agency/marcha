import 'dart:convert';

class CategoriesHelper {
  static final Map<String, dynamic> categories = {
    'categories': [
      {
        'id': '1',
        'name': 'Sale/Exchange',
        'imageUrl':
            'https://bingo-agency.com/marcha.com/images/saleExchange.png',
      },
      {
        'id': '2',
        'name': 'For Free',
        'imageUrl': 'https://bingo-agency.com/marcha.com/images/forFree.png'
      },
      {
        'id': '3',
        'name': 'Electronics',
        'imageUrl': 'https://bingo-agency.com/marcha.com/images/electronics.png'
      },
      {
        'id': '4',
        'name': 'Fashion',
        'imageUrl': 'https://bingo-agency.com/marcha.com/images/fashion.png'
      },
      {
        'id': '5',
        'name': 'Home & Garden',
        'imageUrl': 'https://bingo-agency.com/marcha.com/images/homeGarden.png'
      },
      {
        'id': '6',
        'name': 'Baby & Toddler',
        'imageUrl': 'https://bingo-agency.com/marcha.com/images/babyToddler.png'
      },
      {
        'id': '7',
        'name': 'Jewelry & Watches',
        'imageUrl':
            'https://bingo-agency.com/marcha.com/images/jewleryWatches.png'
      },
      {
        'id': '8',
        'name': 'Health & Beauty',
        'imageUrl':
            'https://bingo-agency.com/marcha.com/images/healthBeauty.png'
      },
      {
        'id': '9',
        'name': 'Sports & Leisure',
        'imageUrl':
            'https://bingo-agency.com/marcha.com/images/sportsLeisure.png'
      },
      {
        'id': '10',
        'name': 'Toys & Games',
        'imageUrl': 'https://bingo-agency.com/marcha.com/images/toysGames.png'
      },
      {
        'id': '11',
        'name': 'Media',
        'imageUrl': 'https://bingo-agency.com/marcha.com/images/media.png'
      },
      {
        'id': '12',
        'name': 'Motors',
        'imageUrl': 'https://bingo-agency.com/marcha.com/images/motors.png'
      },
      {
        'id': '13',
        'name': 'Property',
        'imageUrl': 'https://bingo-agency.com/marcha.com/images/property.png'
      },
      {
        'id': '14',
        'name': 'Services',
        'imageUrl': 'https://bingo-agency.com/marcha.com/images/services.png'
      },
      {
        'id': '15',
        'name': 'Other',
        'imageUrl': 'https://bingo-agency.com/marcha.com/images/other.png'
      }
    ]
  };

  static String getCategoriesJson() {
    return jsonEncode(categories);
  }
}

// class CategoriesHelper {
//   static final List<String> categories = [
//     "https://bingo-agency.com/marcha.com/images/sale.png",
//     "https://bingo-agency.com/marcha.com/images/forFree.png",
//     "https://bingo-agency.com/marcha.com/images/electronics.png",
//     "https://bingo-agency.com/marcha.com/images/fashion.png",
//     "https://bingo-agency.com/marcha.com/images/homeGarden.png",
//     "https://bingo-agency.com/marcha.com/images/babyToddler.png",
//     "https://bingo-agency.com/marcha.com/images/jewleryWatches.png",
//     "https://bingo-agency.com/marcha.com/images/healthBeauty.png",
//     "https://bingo-agency.com/marcha.com/images/sportsLeisure.png",
//     "https://bingo-agency.com/marcha.com/images/toysGames.png",
//     "https://bingo-agency.com/marcha.com/images/media.png",
//     "https://bingo-agency.com/marcha.com/images/motors.png",
//     "https://bingo-agency.com/marcha.com/images/property.png",
//     "https://bingo-agency.com/marcha.com/images/services.png",
//     "https://bingo-agency.com/marcha.com/images/other.png",
//   ];

//   // static List<String> getSuggestions(String query) {
//   //   List<String> matches = List<String>.from(categories);
//   //   matches.retainWhere((s) => s.toLowerCase().contains(query.toLowerCase()));
//   //   return matches;
//   // }
// }
