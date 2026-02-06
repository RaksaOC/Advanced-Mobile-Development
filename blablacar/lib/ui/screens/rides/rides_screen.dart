import 'package:blabla/model/ride_pref/ride_pref.dart';
import 'package:flutter/material.dart';

class RidesScreen extends StatelessWidget {
  final RidePref ridePref;
  const RidesScreen({super.key, required this.ridePref});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(ridePref.departure.name),
          Text(ridePref.arrival.name),
          Text(ridePref.departureDate.toString()),
          Text(ridePref.requestedSeats.toString()),
        ],
      ),
    );
  }
}
