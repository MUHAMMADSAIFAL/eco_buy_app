import 'package:carousel_slider/carousel_slider.dart';
import 'package:eco_buy_app/eco_buy_app/services/firebase_services.dart';
import 'package:eco_buy_app/eco_buy_app/utils/colors.dart';
import 'package:eco_buy_app/eco_buy_app/widgets/home_card.dart';
import 'package:flutter/material.dart';

List catigories = [
  "Grosery",
  "Electornics",
  "Cosmatices",
  "Pharmacy",
  "Garmantes",
];

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final List images = [
    "assets/images/th.jpeg",
    "assets/images/vigi.jpeg",
    "assets/images/th.jpeg",
    "assets/images/vigi.jpeg",
    "assets/images/th.jpeg",
    "assets/images/vigi.jpeg",
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Home Screen"),
          actions: [
            IconButton(
              onPressed: () {
                FirebaseServices.logOut();
              },
              icon: Icon(
                Icons.logout,
                size: 30,
                color: Appcolor.red,
              ),
            ),
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CarouselSlider(
              items: images
                  .map(
                    (e) => Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(25),
                            child: Image(
                              image: AssetImage(e),
                              height: 200,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 200,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              gradient: LinearGradient(
                                colors: [
                                  Colors.blueAccent.withOpacity(0.3),
                                  Colors.redAccent.withOpacity(0.3),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 20,
                          left: 20,
                          child: Container(
                            height: 30,
                            width: 60,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Appcolor.black.withOpacity(0.7)),
                            child: Text(
                              "TITLE",
                              style: TextStyle(
                                  color: Appcolor.white, fontSize: 20),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                  .toList(),
              options: CarouselOptions(
                height: 200,
                autoPlay: true,
              ),
            ),
            HomeCard(
              title: catigories[0],
            ),
            HomeCard(
              title: catigories[1],
            ),
            HomeCard(
              title: catigories[2],
            ),
            HomeCard(
              title: catigories[3],
            ),
            HomeCard(
              title: catigories[4],
            ),
          ],
        ),
      ),
    );
  }
}
