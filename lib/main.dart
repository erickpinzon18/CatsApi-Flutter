import 'package:Gatitos/pages/breed_info_page.dart';
import 'package:Gatitos/pages/fav_page.dart';
import 'package:flutter/material.dart';
import 'package:Gatitos/pages/home_page.dart';
import 'package:Gatitos/pages/cat_detail_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Peliculas',
      initialRoute: 'home',
      routes: {
        'home': (context) => HomePage(),
        'fav': (context) => FavPage(),
        'detail': (context) => CatDetail(),
        'breed': (context) => BreedInfo(),
      },
    );
  }
}
