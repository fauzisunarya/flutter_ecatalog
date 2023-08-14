// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:flutter_ecatalog/data/models/request/product_request_model.dart';
import 'package:flutter_ecatalog/data/models/response/product_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_ecatalog/data/datasource/product_datasource.dart';

part 'update_product_bloc.freezed.dart';
part 'update_product_event.dart';
part 'update_product_state.dart';

class UpdateProductBloc extends Bloc<UpdateProductEvent, UpdateProductState> {
  final ProductDataSource dataSource;
  UpdateProductBloc(
    this.dataSource,
  ) : super(const _Initial()) {
    on<_DoUpdate>((event, emit) async {
      emit(const _Loading());
      final result = await dataSource.createProduct(event.requestData);
      result.fold((l) => emit(_Error(l)), (r) => emit(_Loaded(r)));
    });
  }
}
