import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marcha/views/landingScreen/landingPage.dart';
import '../../state/DataBase.dart';
import 'package:marcha/views/home/home.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(
      const Duration(seconds: 2),
      () => Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (BuildContext context) => LandingPage(),
        ),
      ),
    );
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Text('مارڇه', style: TextStyle(color: Colors.white, fontSize: 48)),
            // SizedBox(
            //   height: 20,
            // ),
            Image(
              height: 150,
              width: 150,
              image: AssetImage(
                "assets/images/playstore.png",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
