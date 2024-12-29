import 'package:flutter/material.dart';
import "package:newsly/home_page.dart";
import "package:newsly/search_page.dart";
import "package:newsly/saved_page.dart";


void main() {
  runApp(NewsApp());
}

class NewsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'News App',
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.red[600],
        scaffoldBackgroundColor: Colors.red[100],

        appBarTheme: AppBarTheme(
          backgroundColor: Colors.red[500],
          titleTextStyle: TextStyle(color: Colors.white),
          iconTheme: IconThemeData(color: Colors.white),
        ),

        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.black),
          titleMedium: TextStyle(color: Colors.black87),
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: const BorderSide(color: Colors.red), // Border color
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: const BorderSide(color: Colors.redAccent), // Focused border color
          ),
          labelStyle: const TextStyle(color: Colors.red), // Label color
          hintStyle: const TextStyle(color: Colors.grey), // Hint text color
        ),
      ),
      home: AppNavigator(),
    );
  }
}

class AppNavigator extends StatefulWidget {
  @override
  _AppNavigatorState createState() => _AppNavigatorState();
}

class _AppNavigatorState extends State<AppNavigator> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    Home(),
    SearchScreen(),
    SavedScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: 'Saved'),
        ],
      ),
    );
  }
}

