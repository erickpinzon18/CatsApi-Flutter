import 'package:Gatitos/providers/breed_provider.dart';
import 'package:Gatitos/widgets/card_breed_widget.dart';
import 'package:flutter/material.dart';
import 'package:Gatitos/models/cat_model.dart';
import 'package:Gatitos/widgets/card_cat_widget.dart';
import 'package:Gatitos/widgets/movie_horizontal.dart';

import '../models/breed_model.dart';
import '../providers/cat_fav_provider.dart';

class BreedInfo extends StatelessWidget {
  // const HomePage({super.key});

  final breedProvider = BreedProvider();

  @override
  Widget build(BuildContext context) {
    final Cat cat = ModalRoute.of(context)!.settings.arguments as Cat;

    return Scaffold(
      appBar: AppBar(
        title: Text('Raza'),
      ),
      body: _crearInfoRaza(cat),
    );
  }

  // Crear lista
  Widget _crearInfoRaza(Cat cat) {
    return FutureBuilder(
      future: breedProvider.getCatBreed(cat),
      builder: (context, AsyncSnapshot<CatBreed> snapshot) {
        if (snapshot.hasData) {
          return CardBreed(catBreed: snapshot.data!, cat: cat,);
        } else {
          return Container(
            height: 400,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}