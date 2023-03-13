import 'package:Gatitos/providers/cat_fav_provider.dart';
import 'package:Gatitos/providers/cat_provider.dart';
import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:Gatitos/models/cat_model.dart';

class CardFavCat extends StatefulWidget {
  final List<Cat> cats;

  CardFavCat({super.key, required this.cats});

  @override
  State<CardFavCat> createState() => _CardFavCatState();

}

class _CardFavCatState extends State<CardFavCat> {

  final _catFavProvider = CatFavProvider();
  final _scrollController = ScrollController();
  int _globalIndex = 0;
  
  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    //int _limit = widget.cats.length - 10;

    return ListView(
      children: _crearLista(_screenSize)
    );
    
    /*
    return Container(
      padding: EdgeInsets.only(top: 5),
      width: double.infinity,
      //height: 300,
      child: Swiper(
        onTap: (index) {
          Navigator.pushNamed(context, 'detail', arguments: widget.cats[index]);
        },
        controller: _swiperController,
        layout: SwiperLayout.TINDER,
        itemWidth: _screenSize.width * 0.9,
        itemHeight: _screenSize.height * 0.5,
        itemBuilder: (BuildContext context, int index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: FadeInImage(
              image: NetworkImage(widget.cats[index].getCatImage()),
              placeholder: AssetImage('assets/images/no-image.jpg'),
              fit: BoxFit.cover,
            ),
          );
        },
        onIndexChanged: (index) {
          setState(() {
            _globalIndex = index;
          });
          
          print(_globalIndex);
          if (_globalIndex == _limit) {
            print('llegaste al límite');
            getMoreCats();
            _limit = widget.cats.length - 10;
          }
          print('limit $_limit');

        },
        itemCount: widget.cats.length,
        // pagination: SwiperPagination(),
        // control: SwiperControl(),
      ),
    );*/
  }

  List<Widget> _crearLista(Size screenSize) {
    List<Widget> lista = []; 

    widget.cats.forEach((cat) { 
      lista.add(_crearCardGato(cat, screenSize));
    });

    return lista;
  }

  Widget _crearCardGato(Cat cat, Size screenSize) {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: Column(
        children: [
          Text(cat.breedName!),
          ClipRRect(
            borderRadius: BorderRadius.circular(5.0),
            child: Container(
              height: screenSize.height * 0.4,
              child: FadeInImage(
                image: NetworkImage(cat.url!),
                placeholder: AssetImage('assets/images/no-image.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: (() {
                  Navigator.pushNamed(context, 'detail', arguments: cat);
                }), 
                child: Text('Información')
              )
            ],
          )
        ],
      ),
    );
  }
}
