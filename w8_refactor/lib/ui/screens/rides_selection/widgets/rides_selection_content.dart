import 'package:flutter/material.dart';

import '../../../theme/theme.dart';
import '../view_model/rides_selection_vm.dart';
import 'rides_selection_header.dart';
import 'rides_selection_tile.dart';

class RidesSelectionContent extends StatelessWidget {
  final RidesSelectionVM viewModel;
  final VoidCallback onBackTap;
  final VoidCallback onFilterPressed;
  final VoidCallback onPreferencePressed;
  final void Function(int index) onRidePressed;

  const RidesSelectionContent({
    super.key,
    required this.viewModel,
    required this.onBackTap,
    required this.onFilterPressed,
    required this.onPreferencePressed,
    required this.onRidePressed,
  });

  @override
  Widget build(BuildContext context) {
    final pref = viewModel.selectedPreference;
    if (pref == null) return const SizedBox.shrink();

    final rides = viewModel.matchingRides;

    return Padding(
      padding: const EdgeInsets.only(
        left: BlaSpacings.m,
        right: BlaSpacings.m,
        top: BlaSpacings.s,
      ),
      child: Column(
        children: [
          RideSelectionHeader(
            ridePreference: pref,
            onBackPressed: onBackTap,
            onFilterPressed: onFilterPressed,
            onPreferencePressed: onPreferencePressed,
          ),
          SizedBox(height: 100),
          Expanded(
            child: ListView.builder(
              itemCount: rides.length,
              itemBuilder: (ctx, index) => RideSelectionTile(
                ride: rides[index],
                onPressed: () => onRidePressed(index),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
