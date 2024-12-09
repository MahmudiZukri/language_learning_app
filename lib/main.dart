import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'pages/pages.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return MaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.latoTextTheme(textTheme),
      ),
      home: const HomePage(),
    );
  }
}
