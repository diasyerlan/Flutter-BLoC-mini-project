import 'package:bloc_app/features/wishlist/bloc/wishlist_bloc.dart';
import 'package:bloc_app/models/grocery_data_model.dart';
import 'package:flutter/material.dart';

class WishlistTile extends StatefulWidget {
  final GroceryDataModel product;
  final WishlistBloc wishlistBloc;

  const WishlistTile(
      {super.key, required this.product, required this.wishlistBloc});

  @override
  State<WishlistTile> createState() => _CartTileState();
}

class _CartTileState extends State<WishlistTile> {
  @override
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(10),
        ),
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              width: double.maxFinite,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(widget.product.imageUrl))),
            ),
            SizedBox(height: 20),
            Text(
              widget.product.name,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(widget.product.description),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text(
                '\$' + widget.product.price.toString(),
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              ElevatedButton(
                  onPressed: () {
                    widget.wishlistBloc.add(WishlistRemoveFromWishlistEvent(
                        product: widget.product));
                  },
                  child: Text(
                    'Remove',
                    style: TextStyle(color: Colors.red),
                  ))
            ])
          ],
        ),
      ),
    );
  }
}
