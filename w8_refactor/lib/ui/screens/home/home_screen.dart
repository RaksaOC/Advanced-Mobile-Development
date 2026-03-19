import 'package:blabla/model/ride_pref/ride_pref.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../utils/animations_util.dart';
import '../../states/ride_preference_state.dart';
import '../rides_selection/rides_selection_screen.dart';
import 'view_model/home_vm.dart';
import 'widgets/home_content.dart';

///
/// This screen allows user to:
/// - Enter his/her ride preference and launch a search on it
/// - Or select a last entered ride preferences and launch a search on it
///
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final HomeVM vm;

  @override
  void initState() {
    super.initState();
    vm = HomeVM(ridePreferenceState: context.read<RidePreferenceState>());
  }

  @override
  void dispose() {
    vm.dispose();
    super.dispose();
  }

  // -------

  void onRidePrefSelected(RidePreference pref) async {
    vm.selectPreference(pref);
    await Navigator.of(
      context,
    ).push(AnimationUtils.createBottomToTopRoute(RidesSelectionScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: vm,
      builder: (context, _) =>
          HomeContent(viewModel: vm, onRidePrefSelected: onRidePrefSelected),
    );
  }
}
