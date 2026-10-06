// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginate_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PaginateModel _$PaginateModelFromJson(Map<String, dynamic> json) =>
    _PaginateModel(
      currentPage: (json['current_page'] as num?)?.toInt() ?? 1,
      lastPage: (json['last_page'] as num?)?.toInt() ?? 1,
      perPage: (json['per_page'] as num?)?.toInt() ?? 10,
      total: (json['total'] as num?)?.toInt() ?? 0,
      hasMorePages: json['has_more_pages'] as bool? ?? false,
    );

Map<String, dynamic> _$PaginateModelToJson(_PaginateModel instance) =>
    <String, dynamic>{
      'current_page': instance.currentPage,
      'last_page': instance.lastPage,
      'per_page': instance.perPage,
      'total': instance.total,
      'has_more_pages': instance.hasMorePages,
    };
