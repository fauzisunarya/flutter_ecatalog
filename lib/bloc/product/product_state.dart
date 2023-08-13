// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'product_bloc.dart';

abstract class ProductState {}

class ProductInitial extends ProductState {}

class ProductLoading extends ProductState {}

class ProductLoaded extends ProductState {
  final List<ProductResponseModel> data;
  final int offset;
  final int limit;
  final bool isNext;

  ProductLoaded({
    required this.data,
    this.offset = 0,
    this.limit = 10,
    this.isNext = false,
  });
}

class ProductError extends ProductState {
  final String message;

  ProductError({required this.message});
}
