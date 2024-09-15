import 'package:flutter/material.dart';
import 'package:travel_app/utils/color_const.dart';

import '../models/destination_model.dart';

class TravelDetailsPage extends StatelessWidget {
  const TravelDetailsPage({super.key, required this.destination});

  final Destination destination;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primarycolor,
      body: Column(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: Image.network(destination.image!),
              )
            ],
          )
        ],
      ),
    );
  }
}
