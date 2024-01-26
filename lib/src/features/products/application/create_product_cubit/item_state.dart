part of 'item_cubit.dart';

@freezed
class CreateProductState with _$CreateProductState {
  const factory CreateProductState.initial() = _Initial;
  const factory CreateProductState.uploaded(bool isUploaded) = _Uploaded;
  const factory CreateProductState.error() = _Error;
}
