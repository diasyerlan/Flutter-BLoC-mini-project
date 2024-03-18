part of 'wishlist_bloc.dart';

@immutable
sealed class WishlistState {}

final class WishlistInitial extends WishlistState {}

final class WishlistActionState extends WishlistInitial {}

final class WishlistLoadSuccessState extends WishlistState {
  final List<GroceryDataModel> wishlistItems;

  WishlistLoadSuccessState({required this.wishlistItems});
}

final class WishlistRemovedFromWishlistState extends WishlistActionState {}
