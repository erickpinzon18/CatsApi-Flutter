import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:Gatitos/models/cat_model.dart';

class CatProvider {
  String _url = 'api.thecatapi.com';
  String _api_key = 'live_mcwGebtrOoyL9hbpWE8Iin8EC0QpbzCjg3clI1Dj0pSUShpELIdmu6DhubWHH6Jt';
  int _limit = 5; 

  List<Cat> _cats = [];

  // Método que hace peticion a la api catApi
  Future<List<Cat>> getCats() async {
    // Creamos la URL de la peticion
    final url = Uri.https(_url, '/v1/images/search', {'api_key': _api_key, 'limit': _limit.toString(), 'has_breeds':'1'});

    // Obtenemos la resp
    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);
    final cats = Cats.fromJsonList(decodedData);

    // Obtener una lista de objetos Future<List<Cat>>
    final allCatsFutures = cats.items.map((cat) => getCatInfo(cat)).toList();

    // Esperar a que se completen todas las llamadas a getCatInfo()
    final allCatsLists = await Future.wait(allCatsFutures);

    return allCatsLists;
  }

  Future<Cat> getCatInfo(Cat cat) async {
    final allInfoUrl = Uri.https(_url, '/v1/images/${cat.id}');

    // Obtener resp
    final resp = await http.get(allInfoUrl);
    final decodedData = json.decode(resp.body);
    final catAllInfo = Cat.fromJsonMap(decodedData);

    return catAllInfo;
  }
}
