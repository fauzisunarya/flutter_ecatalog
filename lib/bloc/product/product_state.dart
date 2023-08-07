part of 'product_bloc.dart';

abstract class ProductState {}

class ProductInitial extends ProductState {}

class ProductLoading extends ProductState {}

class ProductLoaded extends ProductState {
  final List<ProductResponseModel> data;

  ProductLoaded({required this.data});
}

class ProductError extends ProductState {
  final String message;

  ProductError({required this.message});
}
