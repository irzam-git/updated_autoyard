// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'inventory_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$InventoryState {

 bool get isLoading; bool get isPaginationLoading; List<VehicleModel> get vehicles; String get selectedStatus; String get searchQuery; PaginateModel get paginate; String? get errorMessage;
/// Create a copy of InventoryState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InventoryStateCopyWith<InventoryState> get copyWith => _$InventoryStateCopyWithImpl<InventoryState>(this as InventoryState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InventoryState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isPaginationLoading, isPaginationLoading) || other.isPaginationLoading == isPaginationLoading)&&const DeepCollectionEquality().equals(other.vehicles, vehicles)&&(identical(other.selectedStatus, selectedStatus) || other.selectedStatus == selectedStatus)&&(identical(other.searchQuery, searchQuery) || other.searchQuery == searchQuery)&&(identical(other.paginate, paginate) || other.paginate == paginate)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,isPaginationLoading,const DeepCollectionEquality().hash(vehicles),selectedStatus,searchQuery,paginate,errorMessage);

@override
String toString() {
  return 'InventoryState(isLoading: $isLoading, isPaginationLoading: $isPaginationLoading, vehicles: $vehicles, selectedStatus: $selectedStatus, searchQuery: $searchQuery, paginate: $paginate, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $InventoryStateCopyWith<$Res>  {
  factory $InventoryStateCopyWith(InventoryState value, $Res Function(InventoryState) _then) = _$InventoryStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading, bool isPaginationLoading, List<VehicleModel> vehicles, String selectedStatus, String searchQuery, PaginateModel paginate, String? errorMessage
});


$PaginateModelCopyWith<$Res> get paginate;

}
/// @nodoc
class _$InventoryStateCopyWithImpl<$Res>
    implements $InventoryStateCopyWith<$Res> {
  _$InventoryStateCopyWithImpl(this._self, this._then);

  final InventoryState _self;
  final $Res Function(InventoryState) _then;

/// Create a copy of InventoryState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,Object? isPaginationLoading = null,Object? vehicles = null,Object? selectedStatus = null,Object? searchQuery = null,Object? paginate = null,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isPaginationLoading: null == isPaginationLoading ? _self.isPaginationLoading : isPaginationLoading // ignore: cast_nullable_to_non_nullable
as bool,vehicles: null == vehicles ? _self.vehicles : vehicles // ignore: cast_nullable_to_non_nullable
as List<VehicleModel>,selectedStatus: null == selectedStatus ? _self.selectedStatus : selectedStatus // ignore: cast_nullable_to_non_nullable
as String,searchQuery: null == searchQuery ? _self.searchQuery : searchQuery // ignore: cast_nullable_to_non_nullable
as String,paginate: null == paginate ? _self.paginate : paginate // ignore: cast_nullable_to_non_nullable
as PaginateModel,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of InventoryState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaginateModelCopyWith<$Res> get paginate {
  
  return $PaginateModelCopyWith<$Res>(_self.paginate, (value) {
    return _then(_self.copyWith(paginate: value));
  });
}
}


/// Adds pattern-matching-related methods to [InventoryState].
extension InventoryStatePatterns on InventoryState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _InventoryState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InventoryState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _InventoryState value)  $default,){
final _that = this;
switch (_that) {
case _InventoryState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _InventoryState value)?  $default,){
final _that = this;
switch (_that) {
case _InventoryState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isLoading,  bool isPaginationLoading,  List<VehicleModel> vehicles,  String selectedStatus,  String searchQuery,  PaginateModel paginate,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InventoryState() when $default != null:
return $default(_that.isLoading,_that.isPaginationLoading,_that.vehicles,_that.selectedStatus,_that.searchQuery,_that.paginate,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isLoading,  bool isPaginationLoading,  List<VehicleModel> vehicles,  String selectedStatus,  String searchQuery,  PaginateModel paginate,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _InventoryState():
return $default(_that.isLoading,_that.isPaginationLoading,_that.vehicles,_that.selectedStatus,_that.searchQuery,_that.paginate,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isLoading,  bool isPaginationLoading,  List<VehicleModel> vehicles,  String selectedStatus,  String searchQuery,  PaginateModel paginate,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _InventoryState() when $default != null:
return $default(_that.isLoading,_that.isPaginationLoading,_that.vehicles,_that.selectedStatus,_that.searchQuery,_that.paginate,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _InventoryState implements InventoryState {
  const _InventoryState({this.isLoading = true, this.isPaginationLoading = false, this.vehicles = const <VehicleModel>[], this.selectedStatus = 'all', this.searchQuery = '', this.paginate = const PaginateModel(), this.errorMessage});
  

@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  bool isPaginationLoading;
@override@JsonKey() final  List<VehicleModel> vehicles;
@override@JsonKey() final  String selectedStatus;
@override@JsonKey() final  String searchQuery;
@override@JsonKey() final  PaginateModel paginate;
@override final  String? errorMessage;

/// Create a copy of InventoryState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InventoryStateCopyWith<_InventoryState> get copyWith => __$InventoryStateCopyWithImpl<_InventoryState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InventoryState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isPaginationLoading, isPaginationLoading) || other.isPaginationLoading == isPaginationLoading)&&const DeepCollectionEquality().equals(other.vehicles, vehicles)&&(identical(other.selectedStatus, selectedStatus) || other.selectedStatus == selectedStatus)&&(identical(other.searchQuery, searchQuery) || other.searchQuery == searchQuery)&&(identical(other.paginate, paginate) || other.paginate == paginate)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,isPaginationLoading,const DeepCollectionEquality().hash(vehicles),selectedStatus,searchQuery,paginate,errorMessage);

@override
String toString() {
  return 'InventoryState(isLoading: $isLoading, isPaginationLoading: $isPaginationLoading, vehicles: $vehicles, selectedStatus: $selectedStatus, searchQuery: $searchQuery, paginate: $paginate, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$InventoryStateCopyWith<$Res> implements $InventoryStateCopyWith<$Res> {
  factory _$InventoryStateCopyWith(_InventoryState value, $Res Function(_InventoryState) _then) = __$InventoryStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading, bool isPaginationLoading, List<VehicleModel> vehicles, String selectedStatus, String searchQuery, PaginateModel paginate, String? errorMessage
});


@override $PaginateModelCopyWith<$Res> get paginate;

}
/// @nodoc
class __$InventoryStateCopyWithImpl<$Res>
    implements _$InventoryStateCopyWith<$Res> {
  __$InventoryStateCopyWithImpl(this._self, this._then);

  final _InventoryState _self;
  final $Res Function(_InventoryState) _then;

/// Create a copy of InventoryState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? isPaginationLoading = null,Object? vehicles = null,Object? selectedStatus = null,Object? searchQuery = null,Object? paginate = null,Object? errorMessage = freezed,}) {
  return _then(_InventoryState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isPaginationLoading: null == isPaginationLoading ? _self.isPaginationLoading : isPaginationLoading // ignore: cast_nullable_to_non_nullable
as bool,vehicles: null == vehicles ? _self.vehicles : vehicles // ignore: cast_nullable_to_non_nullable
as List<VehicleModel>,selectedStatus: null == selectedStatus ? _self.selectedStatus : selectedStatus // ignore: cast_nullable_to_non_nullable
as String,searchQuery: null == searchQuery ? _self.searchQuery : searchQuery // ignore: cast_nullable_to_non_nullable
as String,paginate: null == paginate ? _self.paginate : paginate // ignore: cast_nullable_to_non_nullable
as PaginateModel,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of InventoryState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaginateModelCopyWith<$Res> get paginate {
  
  return $PaginateModelCopyWith<$Res>(_self.paginate, (value) {
    return _then(_self.copyWith(paginate: value));
  });
}
}

// dart format on
