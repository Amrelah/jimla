import 'package:flutter/material.dart';
import 'package:jimla/components/favorite/fav_item_tile.dart';
import '../path/path_provider.dart';

class Favorite extends StatefulWidget {
  const Favorite({super.key});

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (context, index) {
          return FavItemTile(
              productName: 'Product Name ${index+1}',
              category: 'Electronics',
              price: '100.00 Br',
              image: Images.sunflowerP,
          );
        },
        itemCount: 30,),
    );
  }
}
