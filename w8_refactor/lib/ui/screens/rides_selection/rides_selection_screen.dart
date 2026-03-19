import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../model/ride/ride.dart';
import '../../../model/ride_pref/ride_pref.dart';
import '../../../utils/animations_util.dart' show AnimationUtils;
import '../../states/ride_preference_state.dart';
import 'widgets/ride_preference_modal.dart';
import '../../../data/repositories/ride/ride_repository.dart';
import 'view_model/rides_selection_vm.dart';
import 'widgets/rides_selection_content.dart';

///
///  The Ride Selection screen allows user to select a ride, once ride preferences have been defined.
///  The screen also allow user to:
///   -  re-define the ride preferences
///   -  activate some filters.
///
class RidesSelectionScreen extends StatefulWidget {
  const RidesSelectionScreen({super.key});

  @override
  State<RidesSelectionScreen> createState() => _RidesSelectionScreenState();
}

class _RidesSelectionScreenState extends State<RidesSelectionScreen> {
  late final RidesSelectionVM vm;

  @override
  void initState() {
    super.initState();
    vm = RidesSelectionVM(
      ridePreferenceState: context.read<RidePreferenceState>(),
      rideRepository: context.read<RideRepository>(),
    );
  }

  @override
  void dispose() {
    vm.dispose();
    super.dispose();
  }

  void onBackTap() {
    Navigator.pop(context);
  }

  void onFilterPressed() {
    // TODO
  }

  void onRideSelected(Ride ride) {
    // Later
  }

  void onPreferencePressed() async {
    // 1 - Navigate to the rides preference picker
    RidePreference? newPreference = await Navigator.of(context)
        .push<RidePreference>(
          AnimationUtils.createRightToLeftRoute(
            RidePreferenceModal(initialPreference: vm.selectedPreference),
          ),
        );

    if (newPreference != null) {
      vm.selectPreference(newPreference);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListenableBuilder(
        listenable: vm,
        builder: (context, _) => RidesSelectionContent(
          viewModel: vm,
          onBackTap: onBackTap,
          onFilterPressed: onFilterPressed,
          onPreferencePressed: onPreferencePressed,
          onRidePressed: (index) => onRideSelected(vm.matchingRides[index]),
        ),
      ),
    );
  }
}
