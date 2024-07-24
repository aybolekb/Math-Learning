import 'package:flutter/material.dart';
import 'package:math_web/config/sidebar_menu.dart';
import 'package:math_web/provider/theme_provider.dart';
import 'package:math_web/screens/about_screen.dart';
import 'package:math_web/screens/book_screen.dart';
import 'package:math_web/screens/favorite.dart';
import 'package:math_web/screens/home_screen.dart';
import 'package:math_web/screens/kafedra.dart';
import 'package:math_web/screens/learn_screen.dart';
import 'package:math_web/screens/quiz/quiz_main.dart';
import 'package:math_web/screens/test_screen.dart';
import 'package:provider/provider.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  String selectedItem = 'Home';
  String appTitle = "Matematika";
  Widget content = const BookScreen();
  void updateContent(String item) {
    setState(() {
      selectedItem = item;
      if (item == 'Learn') {
        appTitle = 'Owren';
        content = TeachScreen();
      } else if (item == 'Home') {
        content = const HomeScreen();
        appTitle = 'Matematika';
      } else if (item == 'Book') {
        appTitle = 'Kitaplar';
        content = const BookScreen();
      } else if (item == 'Test') {
        appTitle = 'Ozuni barla';
        content = const QuizMain();
      } else if (item == 'kafedra') {
        appTitle = 'Kafedra';
        content = const Kafedra(
          title: 'Kafedra',
        );
      } else if (item == 'About') {
        appTitle = 'Biz barada';
        content = const AboutScreen();
      } else if (item == 'Fav') {
        appTitle = 'Halanlarym';
        content = const FavoriteScreen();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    print(themeProvider.isDarkMode());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        title: Text(appTitle),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.person))],
      ),
      drawer: Drawer(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
          child: ListView(
            children: [
              const Text(
                'Math Learn',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 18,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(themeProvider.isDarkMode()
                      ? 'Garanky Tema'
                      : "Yagty tema"),
                  IconButton(
                    icon: themeProvider.isDarkMode()
                        ? const Icon(Icons.dark_mode)
                        : const Icon(
                            Icons.light_mode,
                            color: Colors.orange,
                          ),
                    onPressed: () {
                      themeProvider.changeBrightess();
                    },
                  )
                ],
              ),
              const Divider(
                height: 30,
                thickness: 0.5,
              ),
              ListTile(
                leading: const Icon(
                  Icons.info,
                  color: Colors.deepPurple,
                ),
                title: const Text('Owren'),
                onTap: () {
                  updateContent('Learn');
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.assignment,
                  color: Colors.deepPurple,
                ),
                title: const Text('Test'),
                onTap: () {
                  updateContent('Test');
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.book,
                  color: Colors.deepPurple,
                ),
                title: const Text('Kitaplar'),
                onTap: () {
                  updateContent('Book');
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.favorite,
                  color: Colors.deepPurple,
                ),
                title: const Text('Halanlarym'),
                onTap: () {
                  updateContent('Fav');
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.account_balance_sharp,
                  color: Colors.deepPurple,
                ),
                title: const Text('Kafedralar'),
                onTap: () {
                  updateContent('kafedra');
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.info,
                  color: Colors.deepPurple,
                ),
                title: const Text('Biz barada'),
                onTap: () {
                  updateContent('About');
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.settings,
                  color: Colors.deepPurple,
                ),
                title: const Text('Setting'),
                onTap: () {},
              )
            ],
          ),
        ),
      ),
      body: content,
    );
  }
}
