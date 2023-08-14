// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:flutter_ecatalog/data/models/request/product_request_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_ecatalog/data/datasource/product_datasource.dart';
import 'package:flutter_ecatalog/data/models/response/product_response_model.dart';

part 'update_product_cubit.freezed.dart';
part 'update_product_state.dart';

class UpdateProductCubit extends Cubit<UpdateProductCubitState> {
  final ProductDataSource dataSource;
  UpdateProductCubit(
    this.dataSource,
  ) : super(UpdateProductCubitState.initial());

  void addProduct(ProductRequestModel model) async {
    emit(_Loading());
    final result = await dataSource.createProduct(model);
    result.fold((l) => emit(_Error(l)), (r) => emit(_Loaded(r)));
  }
}
