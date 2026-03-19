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
  HomeVM? _viewModel;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _viewModel?.dispose();
    _viewModel = HomeVM(
      ridePreferenceState: context.read<RidePreferenceState>(),
    );
  }

  @override
  void dispose() {
    _viewModel?.dispose();
    super.dispose();
  }

  void onRidePrefSelected(RidePreference selectedPreference) async {
    _viewModel!.selectPreference(selectedPreference);

    // 2 - Navigate to the rides screen
    await Navigator.of(
      context,
    ).push(AnimationUtils.createBottomToTopRoute(RidesSelectionScreen()));
  }

  @override
  Widget build(context) {
    final vm = _viewModel;
    if (vm == null) return const SizedBox.shrink();

    return AnimatedBuilder(
      animation: vm,
      builder: (context, _) =>
          HomeContent(viewModel: vm, onRidePrefSelected: onRidePrefSelected),
    );
  }
}
