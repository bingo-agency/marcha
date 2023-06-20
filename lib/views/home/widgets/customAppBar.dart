import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import '../../../helper/cityHelper.dart';
import '../../../state/DataBase.dart';
import '../../search/search.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

customAppBar(context) {
  final TextEditingController typeAheadController2 = TextEditingController();
  return AppBar(
    automaticallyImplyLeading: true,
    centerTitle: false,

    backgroundColor: Colors.transparent,
    // leading: const Icon(FeatherIcons.alignCenter),
    title: Card(
      margin: const EdgeInsets.all(0.0),
      clipBehavior: Clip.hardEdge,
      elevation: 5.0,
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () async {
          print('cool');
          // searchBottomSheet(context);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const SearchScreen(),
            ),
          );
        },
        child: SizedBox(
          height: 51.0,
          // width: MediaQuery.of(context).size.width * 2,
          child: ListTile(
            leading: Icon(FeatherIcons.search,
                color: Theme.of(context).primaryColor),
            title: AnimatedTextKit(
              animatedTexts: [
                TyperAnimatedText(
                  'Search here ... ',
                ),
                TyperAnimatedText(
                  'iPhone ...',
                ),
                TyperAnimatedText(
                  'Laptops ...',
                ),
                TyperAnimatedText(
                  'Honda Civic ...',
                ),
                TyperAnimatedText(
                  'Plots ...',
                ),
                TyperAnimatedText(
                  'Clothes ...',
                ),
                TyperAnimatedText(
                  'Shops ...',
                ),
                TyperAnimatedText(
                  'ID # ',
                ),
                TyperAnimatedText(
                  'Search here ... ',
                )
              ],
              // child: Text(
              //   'Search here ...',
              //   style: GoogleFonts.ubuntu(fontSize: 16.0),
              // ),
            ),
            trailing: ElevatedButton(
                onPressed: () {
                  // print('cities were tapped !!!');
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text(
                          'Select City',
                          style: GoogleFonts.poppins(
                              color: Theme.of(context).primaryColor),
                        ),
                        content: SingleChildScrollView(
                          child: ListBody(
                            children: [
                              ListTile(
                                title: const Text('Get City From Gps'),
                                leading: Icon(
                                  Icons.gps_fixed_outlined,
                                  color: Theme.of(context).primaryColor,
                                ),
                                onTap: () async {
                                  Get.find<DataBase>().getPermission();
                                  // await dbclass.getPermission();
                                  Get.find<DataBase>().getCurrentlocation();
                                  Navigator.of(context).pop();
                                },
                              ),
                              Container(
                                padding: const EdgeInsets.all(10),
                                child: TypeAheadFormField<String>(
                                  hideSuggestionsOnKeyboardHide: false,
                                  textFieldConfiguration:
                                      TextFieldConfiguration(
                                    focusNode: FocusScopeNode(),
                                    enableSuggestions: false,
                                    autofocus: false,
                                    controller: typeAheadController2,
                                    decoration: InputDecoration(
                                      hintStyle: GoogleFonts.montserrat(),
                                      border: const OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.black12),
                                      ),
                                      focusedBorder: InputBorder.none,
                                      hintText: 'Search City...',
                                    ),
                                  ),
                                  suggestionsCallback: (query) {
                                    return CityHelper.getSuggestions(query);
                                  },
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please Enter City Name';
                                    }
                                    return null;
                                  },
                                  itemBuilder: (context, suggestion) {
                                    final city = suggestion as String;

                                    return ListTile(
                                      title: Text(city),
                                    );
                                  },
                                  noItemsFoundBuilder: (context) =>
                                      const SizedBox(
                                    height: 10,
                                    child: Center(
                                      child: Text(
                                        'No City Found.',
                                        style: TextStyle(fontSize: 16),
                                      ),
                                    ),
                                  ),
                                  onSuggestionSelected: (suggestion) {
                                    final city = suggestion as String;

                                    typeAheadController2.text = city;
                                    Get.find<DataBase>().setCity(city);
                                    Navigator.pop(context);
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
                child: const Icon(FeatherIcons.sliders)),
          ),
        ),
      ),
    ),
  );

  // AppBar(
  //   title: const Text('This is the customer app bar'),
  // );
}
