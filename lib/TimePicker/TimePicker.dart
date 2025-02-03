import 'package:flutter/material.dart';

Future<TimeOfDay?> showCustomTimePicker(BuildContext context,
    {TimeOfDay? initialTime}) {
  final ThemeData customTheme2 = Theme.of(context).copyWith(
      colorScheme: const ColorScheme.light(
        primary: Color(0xFFD90B2E),
        surfaceTint: Color(0xFF222935),
        surface: Color(0xFF222935),
        onPrimary: Colors.white,
        onSurface: Colors.white,
      ),
      textTheme: Theme.of(context).textTheme.copyWith(
            titleLarge:
                const TextStyle(color: Colors.blue), // Change the title color
          ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: const Color(0xFFD90B2E),
        ),
      ));
  return showTimePicker(
    context: context,
    initialTime: initialTime ?? TimeOfDay.now(),
    builder: (BuildContext context, Widget? child) {
      return Theme(
        data: customTheme2,
        child: child!,
      );
    },
  );
}
