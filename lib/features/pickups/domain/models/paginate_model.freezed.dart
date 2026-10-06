// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'paginate_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PaginateModel {

@JsonKey(name: 'current_page') int get currentPage;@JsonKey(name: 'last_page') int get lastPage;@JsonKey(name: 'per_page') int get perPage; int get total;@JsonKey(name: 'has_more_pages') bool get hasMorePages;
/// Create a copy of PaginateModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaginateModelCopyWith<PaginateModel> get copyWith => _$PaginateModelCopyWithImpl<PaginateModel>(this as PaginateModel, _$identity);

  /// Serializes this PaginateModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaginateModel&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.lastPage, lastPage) || other.lastPage == lastPage)&&(identical(other.perPage, perPage) || other.perPage == perPage)&&(identical(other.total, total) || other.total == total)&&(identical(other.hasMorePages, hasMorePages) || other.hasMorePages == hasMorePages));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,currentPage,lastPage,perPage,total,hasMorePages);

@override
String toString() {
  return 'PaginateModel(currentPage: $currentPage, lastPage: $lastPage, perPage: $perPage, total: $total, hasMorePages: $hasMorePages)';
}


}

/// @nodoc
abstract mixin class $PaginateModelCopyWith<$Res>  {
  factory $PaginateModelCopyWith(PaginateModel value, $Res Function(PaginateModel) _then) = _$PaginateModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'current_page') int currentPage,@JsonKey(name: 'last_page') int lastPage,@JsonKey(name: 'per_page') int perPage, int total,@JsonKey(name: 'has_more_pages') bool hasMorePages
});




}
/// @nodoc
class _$PaginateModelCopyWithImpl<$Res>
    implements $PaginateModelCopyWith<$Res> {
  _$PaginateModelCopyWithImpl(this._self, this._then);

  final PaginateModel _self;
  final $Res Function(PaginateModel) _then;

/// Create a copy of PaginateModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? currentPage = null,Object? lastPage = null,Object? perPage = null,Object? total = null,Object? hasMorePages = null,}) {
  return _then(_self.copyWith(
currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,lastPage: null == lastPage ? _self.lastPage : lastPage // ignore: cast_nullable_to_non_nullable
as int,perPage: null == perPage ? _self.perPage : perPage // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,hasMorePages: null == hasMorePages ? _self.hasMorePages : hasMorePages // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [PaginateModel].
extension PaginateModelPatterns on PaginateModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaginateModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaginateModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaginateModel value)  $default,){
final _that = this;
switch (_that) {
case _PaginateModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaginateModel value)?  $default,){
final _that = this;
switch (_that) {
case _PaginateModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'current_page')  int currentPage, @JsonKey(name: 'last_page')  int lastPage, @JsonKey(name: 'per_page')  int perPage,  int total, @JsonKey(name: 'has_more_pages')  bool hasMorePages)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaginateModel() when $default != null:
return $default(_that.currentPage,_that.lastPage,_that.perPage,_that.total,_that.hasMorePages);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'current_page')  int currentPage, @JsonKey(name: 'last_page')  int lastPage, @JsonKey(name: 'per_page')  int perPage,  int total, @JsonKey(name: 'has_more_pages')  bool hasMorePages)  $default,) {final _that = this;
switch (_that) {
case _PaginateModel():
return $default(_that.currentPage,_that.lastPage,_that.perPage,_that.total,_that.hasMorePages);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'current_page')  int currentPage, @JsonKey(name: 'last_page')  int lastPage, @JsonKey(name: 'per_page')  int perPage,  int total, @JsonKey(name: 'has_more_pages')  bool hasMorePages)?  $default,) {final _that = this;
switch (_that) {
case _PaginateModel() when $default != null:
return $default(_that.currentPage,_that.lastPage,_that.perPage,_that.total,_that.hasMorePages);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PaginateModel implements PaginateModel {
  const _PaginateModel({@JsonKey(name: 'current_page') this.currentPage = 1, @JsonKey(name: 'last_page') this.lastPage = 1, @JsonKey(name: 'per_page') this.perPage = 10, this.total = 0, @JsonKey(name: 'has_more_pages') this.hasMorePages = false});
  factory _PaginateModel.fromJson(Map<String, dynamic> json) => _$PaginateModelFromJson(json);

@override@JsonKey(name: 'current_page') final  int currentPage;
@override@JsonKey(name: 'last_page') final  int lastPage;
@override@JsonKey(name: 'per_page') final  int perPage;
@override@JsonKey() final  int total;
@override@JsonKey(name: 'has_more_pages') final  bool hasMorePages;

/// Create a copy of PaginateModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaginateModelCopyWith<_PaginateModel> get copyWith => __$PaginateModelCopyWithImpl<_PaginateModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PaginateModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaginateModel&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.lastPage, lastPage) || other.lastPage == lastPage)&&(identical(other.perPage, perPage) || other.perPage == perPage)&&(identical(other.total, total) || other.total == total)&&(identical(other.hasMorePages, hasMorePages) || other.hasMorePages == hasMorePages));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,currentPage,lastPage,perPage,total,hasMorePages);

@override
String toString() {
  return 'PaginateModel(currentPage: $currentPage, lastPage: $lastPage, perPage: $perPage, total: $total, hasMorePages: $hasMorePages)';
}


}

/// @nodoc
abstract mixin class _$PaginateModelCopyWith<$Res> implements $PaginateModelCopyWith<$Res> {
  factory _$PaginateModelCopyWith(_PaginateModel value, $Res Function(_PaginateModel) _then) = __$PaginateModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'current_page') int currentPage,@JsonKey(name: 'last_page') int lastPage,@JsonKey(name: 'per_page') int perPage, int total,@JsonKey(name: 'has_more_pages') bool hasMorePages
});




}
/// @nodoc
class __$PaginateModelCopyWithImpl<$Res>
    implements _$PaginateModelCopyWith<$Res> {
  __$PaginateModelCopyWithImpl(this._self, this._then);

  final _PaginateModel _self;
  final $Res Function(_PaginateModel) _then;

/// Create a copy of PaginateModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? currentPage = null,Object? lastPage = null,Object? perPage = null,Object? total = null,Object? hasMorePages = null,}) {
  return _then(_PaginateModel(
currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,lastPage: null == lastPage ? _self.lastPage : lastPage // ignore: cast_nullable_to_non_nullable
as int,perPage: null == perPage ? _self.perPage : perPage // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,hasMorePages: null == hasMorePages ? _self.hasMorePages : hasMorePages // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
