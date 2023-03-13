import 'package:flutter/material.dart';
import 'package:Gatitos/models/cat_model.dart';

class CatDetail extends StatelessWidget {
  const CatDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final Cat cat = ModalRoute.of(context)!.settings.arguments as Cat;

    return Scaffold(
      appBar: AppBar(
        title: Text('Información'),
      ),
      body: Center(
        child: ListView(
          children: [
            Text('Raza'),
            _getBreed(cat),
            Text('Temperamento'),
            _getTemperament(cat),
            Text('Origen'),
            _getOrigin(cat),
            Text('Esperanza de vida'),
            _getLifeSpan(cat),
            TextButton(onPressed: () => Navigator.pushNamed(context, 'breed', arguments: cat), child: Text('Ver información de la raza'))
          ],
        ),
      ),
    );
  }

  Widget _getBreed(Cat cat) {
    return Text(cat.breedName.toString());
  }
  Widget _getTemperament(Cat cat) {
    return Text(cat.temperament.toString());
  }
  Widget _getOrigin(Cat cat) {
    return Text(cat.origin.toString());
  }
  Widget _getLifeSpan(Cat cat) {
    return Text(cat.lifeSpan.toString());
  }
}
