import 'package:freezed_annotation/freezed_annotation.dart';

part 'paginate_model.freezed.dart';
part 'paginate_model.g.dart';

@freezed
abstract class PaginateModel with _$PaginateModel {
  const factory PaginateModel({
    @JsonKey(name: 'current_page') @Default(1) int currentPage,
    @JsonKey(name: 'last_page') @Default(1) int lastPage,
    @JsonKey(name: 'per_page') @Default(10) int perPage,
    @Default(0) int total,
    @JsonKey(name: 'has_more_pages') @Default(false) bool hasMorePages,
  }) = _PaginateModel;

  factory PaginateModel.fromJson(Map<String, dynamic> json) =>
      _$PaginateModelFromJson(json);
}
