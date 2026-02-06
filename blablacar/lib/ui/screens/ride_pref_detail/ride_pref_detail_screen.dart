import 'package:blabla/model/ride/ride.dart';
import 'package:blabla/model/ride_pref/ride_pref.dart';
import 'package:blabla/services/rides_service.dart';
import 'package:flutter/material.dart';

class RidePrefDetailScreen extends StatelessWidget {
  final RidePref ridePref;

  const RidePrefDetailScreen({super.key, required this.ridePref});

  List<Ride> _getRides() {
    RidesService ridesService = RidesService();
    return ridesService.searchRides(ridePref);
  }

  Widget _buildRidesTiles() {
    List<Ride> rides = _getRides();
    return ListView.builder(
      itemCount: rides.length,
      itemBuilder: (context, index) => ListTile(
        leading: Icon(Icons.car_rental),
        title: Text(rides[index].departureLocation.name),
        subtitle: Text(rides[index].arrivalLocation.name),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: () {
          
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Text(ridePref.departure.name),
            Text(ridePref.arrival.name),
            Text(ridePref.departureDate.toString()),
            Text(ridePref.requestedSeats.toString()),
          ],
        ),
      ),
    );
  }
}
