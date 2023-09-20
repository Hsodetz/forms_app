

import 'package:flutter/material.dart';

class AppTheme {

  static const seedColor = Colors.deepOrange;

  
  ThemeData getTheme() => ThemeData(


    useMaterial3: true,
    colorSchemeSeed: seedColor,
    listTileTheme: const ListTileThemeData(
      iconColor: seedColor,
    ),
  );

}