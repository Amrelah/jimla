import 'package:flutter/cupertino.dart';
import 'package:jimla/shimmer/fav_and_cart/item_tile_shimmer.dart';

class FavoriteCartShimmer extends StatelessWidget {
  const FavoriteCartShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index) => const ItemTileShimmer(),),
    );
  }
}
