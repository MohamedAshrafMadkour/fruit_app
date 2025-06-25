part of 'item_cart_cubit.dart';

@immutable
sealed class ItemCartState {}

final class ItemCartInitial extends ItemCartState {}

final class ItemCartAdded extends ItemCartState {}

final class ItemCartRemoved extends ItemCartState {}
