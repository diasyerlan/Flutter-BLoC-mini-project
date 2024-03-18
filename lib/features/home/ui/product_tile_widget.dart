import 'package:bloc_app/features/home/bloc/home_bloc.dart';
import 'package:bloc_app/models/grocery_data_model.dart';
import 'package:flutter/material.dart';

class ProductTile extends StatefulWidget {
  final GroceryDataModel product;
  final HomeBloc homeBloc;

  const ProductTile({super.key, required this.product, required this.homeBloc});

  @override
  State<ProductTile> createState() => _ProductTileState();
}

class _ProductTileState extends State<ProductTile> {
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
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        widget.homeBloc.add(HomeWishlistButtonClickedEvent(
                            clickedProduct: widget.product));
                        setState(() {
                          isWishlisted = !isWishlisted;
                        });
                      },
                      icon: Icon(!isWishlisted
                          ? Icons.favorite_border
                          : Icons.favorite)),
                  IconButton(
                      onPressed: () {
                        widget.homeBloc.add(HomeCartButtonClickedEvent(
                            clickedProduct: widget.product));
                        setState(() {
                          isCarted = !isCarted;
                        });
                      },
                      icon: Icon(!isCarted
                          ? Icons.shopping_bag_outlined
                          : Icons.shopping_bag))
                ],
              )
            ])
          ],
        ),
      ),
    );
  }
}
