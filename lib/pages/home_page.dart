import 'package:flutter/material.dart';
import 'package:Gatitos/models/cat_model.dart';
import 'package:Gatitos/providers/cat_provider.dart';
import 'package:Gatitos/widgets/card_cat_widget.dart';
import 'package:Gatitos/widgets/movie_horizontal.dart';

class HomePage extends StatelessWidget {
  // const HomePage({super.key});

  final catProvider = CatProvider();

  @override
  Widget build(BuildContext context) {
    catProvider.getCats();
    return Scaffold(
      appBar: AppBar(
        title: Text('Gatos'),
        actions: [
          TextButton(onPressed: () => Navigator.pushNamed(context, 'fav'), child: Text('Favoritos'), style: ButtonStyle(foregroundColor: MaterialStateProperty.all<Color>(Colors.white)),)
        ],
      ),
      body: _crearLista(),
    );
  }

  // Crear lista
  Widget _crearLista() {
    
    return FutureBuilder(
      future: catProvider.getCats(),
      builder: (context, AsyncSnapshot<List<Cat>> snapshot) {
        if (snapshot.hasData) {
          return CardCat(cats: snapshot.data!);
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
