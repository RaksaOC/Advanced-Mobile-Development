import 'package:flutter/material.dart';

import '../../../../data/dummy_data.dart';
import '../../../../model/ride/locations.dart';
import '../../../../model/ride_pref/ride_pref.dart';
import '../../../../services/ride_prefs_service.dart';
import '../../../../ui/theme/theme.dart';
import '../../../../utils/date_time_utils.dart';

class RidePrefForm extends StatefulWidget {
  final RidePref? initRidePref;
  final void Function(RidePref) onSearch;

  const RidePrefForm({super.key, this.initRidePref, required this.onSearch});

  @override
  State<RidePrefForm> createState() => _RidePrefFormState();
}

class _RidePrefFormState extends State<RidePrefForm> {
  Location? departure;
  late DateTime departureDate;
  Location? arrival;
  late int requestedSeats;

  @override
  void initState() {
    super.initState();
    // can be init if null we get the selectedridepref from service which can also be null which we check below
    final initial = widget.initRidePref ?? RidePrefsService.selectedRidePref;
    if (initial != null) {
      // if somehow its not null we get these value
      departure = initial.departure;
      arrival = initial.arrival;
      departureDate = initial.departureDate;
      requestedSeats = initial.requestedSeats;
    } else {
      // if its null then init the data form the fake dummy data so it should be like london cuz first and manchester cuz its second in the array
      departure = fakeLocations.isNotEmpty ? fakeLocations.first : null;
      arrival = fakeLocations.length > 1 ? fakeLocations[1] : null;
      departureDate = DateTime.now(); // will display today
      requestedSeats = 1;
    }
  }

  Future<void> _pickDate() async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: departureDate,
      firstDate: DateTime(now.year, now.month, now.day),
      lastDate: now.add(const Duration(days: 365)),
    );
    if (picked != null) {
      setState(() {
        departureDate = picked;
      });
    }
  }

  void _onSearch() {
    if (departure == null || arrival == null) {
      return;
    }
    final pref = RidePref(
      departure: departure!,
      departureDate: departureDate,
      arrival: arrival!,
      requestedSeats: requestedSeats,
    );
    widget.onSearch(pref);
    setState(() {}); // refresh the screen to show the new data
  }

  Widget _buildLocationField({
    required String label,
    required Location? value,
    required ValueChanged<Location?> onChanged,
  }) {
    return DropdownButtonFormField<Location>(
      value: value,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
      items: fakeLocations
          .map(
            (l) => DropdownMenuItem<Location>(
              value: l,
              child: Text(l.name, style: BlaTextStyles.body),
            ),
          )
          .toList(),
      onChanged: onChanged,
    );
  }

  Widget _buildDateField() {
    return GestureDetector(
      onTap: _pickDate, // handled up there
      child: InputDecorator(
        decoration: const InputDecoration(
          labelText: 'Today',
          border: OutlineInputBorder(),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              DateTimeUtils.formatDateTime(departureDate),
              style: BlaTextStyles.body,
            ),
            const Icon(Icons.calendar_today, size: 18),
          ],
        ),
      ),
    );
  }

  Widget _buildSeatsField() {
    return DropdownButtonFormField<int>(
      value: requestedSeats,
      decoration: const InputDecoration(
        labelText: '1',
        border: OutlineInputBorder(),
      ),
      items: List<int>.generate(8, (i) => i + 1)
          .map(
            (v) => DropdownMenuItem<int>(
              value: v,
              child: Row(
                children: [
                  const Icon(Icons.person, size: 18),
                  const SizedBox(width: 8),
                  Text(v.toString(), style: BlaTextStyles.body),
                ],
              ),
            ),
          )
          .toList(),
      onChanged: (v) {
        if (v == null) return;
        setState(() {
          requestedSeats = v;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(BlaSpacings.l),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildLocationField(
            label: 'Leaving from',
            value: departure,
            onChanged: (l) {
              setState(() {
                departure = l;
              });
            },
          ),
          const SizedBox(height: BlaSpacings.m),
          _buildLocationField(
            label: 'Going to',
            value: arrival,
            onChanged: (l) {
              setState(() {
                arrival = l;
              });
            },
          ),
          const SizedBox(height: BlaSpacings.m),
          _buildDateField(),
          const SizedBox(height: BlaSpacings.m),
          _buildSeatsField(),
          const SizedBox(height: BlaSpacings.m),
          SizedBox(
            height: 48,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: BlaColors.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(BlaSpacings.radius),
                ),
              ),
              onPressed: _onSearch,
              child: Text(
                'Search',
                style: BlaTextStyles.button.copyWith(color: BlaColors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
