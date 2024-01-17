part of 'item_cubit.dart';

@freezed
class ItemState with _$ItemState {
  const factory ItemState.initial() = _Initial;
  const factory ItemState.uploaded(bool isUploaded) = _Uploaded;
  const factory ItemState.error() = _Error;
}
