import 'package:flutter/material.dart';
import 'package:math_web/provider/theme_provider.dart';
import 'package:math_web/screens/book_screen.dart';
import 'package:math_web/screens/home_screen.dart';
import 'package:math_web/screens/menu_screnn.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => ThemeProvider())
        ],
        builder: (context, child) {
          final themeProvider = Provider.of<ThemeProvider>(context);
          return MaterialApp(
              title: 'Flutter Demo',
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                brightness: themeProvider.brightness,
                colorSchemeSeed: Colors.deepPurple,
                useMaterial3: true,
              ),
              home: const MenuScreen());
        });
  }
}
