part of 'update_product_cubit.dart';

@freezed
class UpdateProductCubitState with _$UpdateProductCubitState {
  const factory UpdateProductCubitState.initial() = _Initial;
  const factory UpdateProductCubitState.loading() = _Loading;
  const factory UpdateProductCubitState.loaded(ProductResponseModel model) =
      _Loaded;
  const factory UpdateProductCubitState.error(String message) = _Error;
}
