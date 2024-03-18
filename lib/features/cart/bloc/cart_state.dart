part of 'cart_bloc.dart';

@immutable
sealed class CartState {}

final class CartInitial extends CartState {}

sealed class CartActionState extends CartState {}

class CartLoadingSuccessState extends CartState {
  final List<GroceryDataModel> cartProducts;

  CartLoadingSuccessState({required this.cartProducts});
}

class CartRemovefromCartState extends CartActionState {}
