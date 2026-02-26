import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:practice/ui/screens/library_screen.dart';

//
//  Launch the application with the given list of providers
//
void mainCommon(List<Provider> providers) {
  runApp(
    MultiProvider(
      providers: providers,
      child: MaterialApp(home: LibraryScreen()),
    ),
  );
}
