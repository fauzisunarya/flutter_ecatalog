// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:flutter_ecatalog/data/datasource/product_datasource.dart';
import 'package:flutter_ecatalog/data/models/response/product_response_model.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductDataSource dataSource;
  ProductBloc(
    this.dataSource,
  ) : super(ProductInitial()) {
    on<GetProductEvent>((event, emit) async {
      emit(ProductLoading());
      final result = await dataSource.getAllProduct();
      result.fold(
        (l) => emit(
          ProductError(message: l),
        ),
        (r) => emit(
          ProductLoaded(data: r),
        ),
      );
    });
  }
}
