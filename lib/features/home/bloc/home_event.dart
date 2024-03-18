part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class HomeInitialEvent extends HomeEvent {}

class HomeWishlistButtonClickedEvent extends HomeEvent {
  final GroceryDataModel clickedProduct;

  HomeWishlistButtonClickedEvent({required this.clickedProduct});
}

class HomeCartButtonClickedEvent extends HomeEvent {
  final GroceryDataModel clickedProduct;

  HomeCartButtonClickedEvent({required this.clickedProduct});
}

class HomeWishlistButtonNavigateEvent extends HomeEvent {}

class HomeCartButtonNavigateEvent extends HomeEvent {}
