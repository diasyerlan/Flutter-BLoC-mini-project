import 'package:bloc_app/features/cart/bloc/cart_bloc.dart';
import 'package:bloc_app/features/home/bloc/home_bloc.dart';
import 'package:bloc_app/models/grocery_data_model.dart';
import 'package:flutter/material.dart';

class CartTile extends StatefulWidget {
  final GroceryDataModel product;
  final CartBloc cartBloc;

  const CartTile({super.key, required this.product, required this.cartBloc});

  @override
  State<CartTile> createState() => _CartTileState();
}

class _CartTileState extends State<CartTile> {
  bool isWishlisted = false;
  bool isCarted = false;
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
                    widget.cartBloc
                        .add(CartRemoveFromCartEvent(product: widget.product));
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
