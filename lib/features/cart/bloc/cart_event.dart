part of 'cart_bloc.dart';

@immutable
sealed class CartEvent {}

class CartInitialEvent extends CartEvent {}

class CartRemoveFromCartEvent extends CartEvent {
  final GroceryDataModel product;

  CartRemoveFromCartEvent({required this.product});
}
