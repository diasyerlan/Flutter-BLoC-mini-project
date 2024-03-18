import 'package:bloc_app/features/cart/bloc/cart_bloc.dart';
import 'package:bloc_app/features/cart/ui/cart_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  void initState() {
    cartBloc.add(CartInitialEvent());
    super.initState();
  }

  final CartBloc cartBloc = CartBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart Products'),
      ),
      body: BlocConsumer<CartBloc, CartState>(
        bloc: cartBloc,
        listenWhen: (previous, current) => current is CartActionState,
        buildWhen: (previous, current) => current is! CartActionState,
        listener: (context, state) {
          if (state is CartRemovefromCartState) {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Product is removed Successfully!')));
          }
        },
        builder: (context, state) {
          switch (state.runtimeType) {
            case CartLoadingSuccessState:
              final successState = state as CartLoadingSuccessState;
              return ListView.builder(
                  itemCount: successState.cartProducts.length,
                  itemBuilder: (context, index) {
                    return CartTile(
                        product: successState.cartProducts[index],
                        cartBloc: cartBloc);
                  });
            default:
              return SizedBox();
          }
        },
      ),
    );
  }
}
