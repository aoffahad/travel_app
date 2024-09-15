import 'dart:ui';

import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:travel_app/models/destination_model.dart';
import 'package:travel_app/screens/travel_details_page.dart';
import 'package:travel_app/utils/color_const.dart';

class TravelHomePage extends StatefulWidget {
  const TravelHomePage({super.key});

  @override
  State<TravelHomePage> createState() => _TravelHomePageState();
}

class _TravelHomePageState extends State<TravelHomePage> {
  int selectedIndex = 0;
  String category = "Popular";
  List<Destination> myDestination = destinations;
  List<IconData> icons = [
    Icons.home_rounded,
    Icons.location_on_rounded,
    Icons.bookmark_outline_rounded,
    Icons.settings_outlined
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: primarycolor,
      body: SafeArea(
        child: Column(
          children: [
            headerPart(),
            SizedBox(
              height: size.height * 0.03,
            ),
            searchBar(),
            const SizedBox(
              height: 30,
            ),
            exploreCities(),
            categorySection(),
            cardSwiper(size),
          ],
        ),
      ),
      bottomSheet: BottomNavigationBar(
        backgroundColor: Colors.white,
        iconSize: 30,
        unselectedItemColor: Colors.black26,
        selectedItemColor: Colors.lightBlue,
        type: BottomNavigationBarType.fixed,
        onTap: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
        items: [
          ...List.generate(
              icons.length,
              (index) => BottomNavigationBarItem(
                    icon: Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Icon(icons[index]),
                        const SizedBox(
                          height: 5,
                        ),
                        selectedIndex == index
                            ? Container(
                                height: 5,
                                width: 5,
                                decoration: BoxDecoration(
                                    color: Colors.blue, shape: BoxShape.circle),
                              )
                            : Container()
                      ],
                    ),
                    label: "",
                  ))
        ],
      ),
    );
  }

  Container cardSwiper(Size size) {
    return Container(
      height: size.height * 0.52,
      padding: EdgeInsets.only(top: 10, bottom: 10, right: 60),
      child: Swiper(
        itemCount: myDestination.length,
        layout: SwiperLayout.STACK,
        itemWidth: size.width * 0.7,
        axisDirection: AxisDirection.right,
        onTap: (index) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => TravelDetailsPage(
                destination: myDestination[index],
              ),
            ),
          );
        },
        loop: true,
        itemBuilder: (context, index) {
          final travel = myDestination[index];
          return ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              color: Colors.white,
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(travel.image!))),
                    ),
                  ),
                  Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      popularImageSection(travel),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            height: 25,
                            width: 275,
                            child: Stack(
                              children: [
                                Positioned(
                                  left: -20,
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 25,
                                        width: 35,
                                        decoration: BoxDecoration(
                                            color:
                                                Colors.grey.withOpacity(0.15),
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                      ),
                                      SizedBox(
                                        width: 240,
                                        child: DottedLine(
                                          dashColor:
                                              Colors.grey.withOpacity(0.4),
                                        ),
                                      ),
                                      Container(
                                        height: 25,
                                        width: 35,
                                        decoration: BoxDecoration(
                                            color:
                                                Colors.grey.withOpacity(0.15),
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          children: [
                            Text.rich(TextSpan(children: [
                              TextSpan(
                                  text: "\$ ${travel.price} /",
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.black.withOpacity(0.4))),
                              TextSpan(
                                  text: "Person",
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.black.withOpacity(0.8))),
                            ])),
                            Spacer(),
                            Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.blue.shade50),
                              child: const Icon(
                                Icons.bookmark_border_outlined,
                                color: Colors.blue,
                                size: 23,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Padding popularImageSection(Destination travel) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            travel.name!,
            style: const TextStyle(
                fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
          ),
          Row(
            children: [
              Icon(
                Icons.location_on_outlined,
                size: 14,
                color: Colors.blue[300],
              ),
              Text(
                travel.location!,
                style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ],
          )
        ],
      ),
    );
  }

  SingleChildScrollView categorySection() {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 15),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          ...List.generate(
              categories.length,
              (index) => Padding(
                    padding: EdgeInsets.only(left: 15, right: 10),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          category = categories[index];
                          category == "Popular"
                              ? myDestination = destinations
                              : myDestination = destinations
                                  .where((element) =>
                                      element.category!.toLowerCase() ==
                                      categories[index].toLowerCase())
                                  .toList();
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: category == categories[index]
                                ? Colors.blue
                                : Colors.white),
                        child: Text(
                          categories[index],
                          style: TextStyle(
                              color: category == categories[index]
                                  ? Colors.white
                                  : Colors.grey[400],
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      ),
                    ),
                  ))
        ],
      ),
    );
  }

  Padding exploreCities() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Explore Cities",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          Row(
            children: [
              Text(
                "All",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.blue),
              ),
              Icon(
                Icons.arrow_right_outlined,
                size: 25,
                color: Colors.black,
              )
            ],
          )
        ],
      ),
    );
  }

  Padding headerPart() {
    return const Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hello Fahad 👋",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 22),
                ),
                Text(
                  "Explore Beautyful world!",
                  style: TextStyle(
                      color: Colors.black26,
                      fontWeight: FontWeight.w500,
                      fontSize: 16),
                ),
              ],
            ),
            Stack(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(
                      "https://images.pexels.com/photos/771742/pexels-photo-771742.jpeg?auto=compress&cs=tinysrgb&w=800"),
                ),
                Positioned(
                    right: 3,
                    top: 4,
                    child: CircleAvatar(
                      radius: 6,
                      backgroundColor: Colors.green,
                    )),
              ],
            )
          ],
        ));
  }

  Padding searchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                  hintText: "Search Place",
                  hintStyle: const TextStyle(
                    fontSize: 15,
                    color: Colors.black26,
                  ),
                  prefixIcon: Icon(Icons.search),
                  fillColor: Colors.white,
                  filled: true,
                  contentPadding: const EdgeInsets.all(20),
                  enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(15))),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: lightblue, borderRadius: BorderRadius.circular(15)),
            child: const Icon(
              Icons.tune,
              color: Colors.white,
              size: 30,
            ),
          )
        ],
      ),
    );
  }
}
