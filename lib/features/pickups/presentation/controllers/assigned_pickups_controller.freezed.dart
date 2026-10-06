// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'assigned_pickups_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AssignedPickupsState {

 bool get isLoading; bool get isPaginationLoading; List<AssignedPickupModel> get pickups; DateTime? get selectedDate; String get selectedStatus; String get searchQuery; PaginateModel get paginate; Set<String> get assignedDateStrings; String? get errorMessage;
/// Create a copy of AssignedPickupsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AssignedPickupsStateCopyWith<AssignedPickupsState> get copyWith => _$AssignedPickupsStateCopyWithImpl<AssignedPickupsState>(this as AssignedPickupsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AssignedPickupsState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isPaginationLoading, isPaginationLoading) || other.isPaginationLoading == isPaginationLoading)&&const DeepCollectionEquality().equals(other.pickups, pickups)&&(identical(other.selectedDate, selectedDate) || other.selectedDate == selectedDate)&&(identical(other.selectedStatus, selectedStatus) || other.selectedStatus == selectedStatus)&&(identical(other.searchQuery, searchQuery) || other.searchQuery == searchQuery)&&(identical(other.paginate, paginate) || other.paginate == paginate)&&const DeepCollectionEquality().equals(other.assignedDateStrings, assignedDateStrings)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,isPaginationLoading,const DeepCollectionEquality().hash(pickups),selectedDate,selectedStatus,searchQuery,paginate,const DeepCollectionEquality().hash(assignedDateStrings),errorMessage);

@override
String toString() {
  return 'AssignedPickupsState(isLoading: $isLoading, isPaginationLoading: $isPaginationLoading, pickups: $pickups, selectedDate: $selectedDate, selectedStatus: $selectedStatus, searchQuery: $searchQuery, paginate: $paginate, assignedDateStrings: $assignedDateStrings, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $AssignedPickupsStateCopyWith<$Res>  {
  factory $AssignedPickupsStateCopyWith(AssignedPickupsState value, $Res Function(AssignedPickupsState) _then) = _$AssignedPickupsStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading, bool isPaginationLoading, List<AssignedPickupModel> pickups, DateTime? selectedDate, String selectedStatus, String searchQuery, PaginateModel paginate, Set<String> assignedDateStrings, String? errorMessage
});


$PaginateModelCopyWith<$Res> get paginate;

}
/// @nodoc
class _$AssignedPickupsStateCopyWithImpl<$Res>
    implements $AssignedPickupsStateCopyWith<$Res> {
  _$AssignedPickupsStateCopyWithImpl(this._self, this._then);

  final AssignedPickupsState _self;
  final $Res Function(AssignedPickupsState) _then;

/// Create a copy of AssignedPickupsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,Object? isPaginationLoading = null,Object? pickups = null,Object? selectedDate = freezed,Object? selectedStatus = null,Object? searchQuery = null,Object? paginate = null,Object? assignedDateStrings = null,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isPaginationLoading: null == isPaginationLoading ? _self.isPaginationLoading : isPaginationLoading // ignore: cast_nullable_to_non_nullable
as bool,pickups: null == pickups ? _self.pickups : pickups // ignore: cast_nullable_to_non_nullable
as List<AssignedPickupModel>,selectedDate: freezed == selectedDate ? _self.selectedDate : selectedDate // ignore: cast_nullable_to_non_nullable
as DateTime?,selectedStatus: null == selectedStatus ? _self.selectedStatus : selectedStatus // ignore: cast_nullable_to_non_nullable
as String,searchQuery: null == searchQuery ? _self.searchQuery : searchQuery // ignore: cast_nullable_to_non_nullable
as String,paginate: null == paginate ? _self.paginate : paginate // ignore: cast_nullable_to_non_nullable
as PaginateModel,assignedDateStrings: null == assignedDateStrings ? _self.assignedDateStrings : assignedDateStrings // ignore: cast_nullable_to_non_nullable
as Set<String>,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of AssignedPickupsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaginateModelCopyWith<$Res> get paginate {
  
  return $PaginateModelCopyWith<$Res>(_self.paginate, (value) {
    return _then(_self.copyWith(paginate: value));
  });
}
}


/// Adds pattern-matching-related methods to [AssignedPickupsState].
extension AssignedPickupsStatePatterns on AssignedPickupsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AssignedPickupsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AssignedPickupsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AssignedPickupsState value)  $default,){
final _that = this;
switch (_that) {
case _AssignedPickupsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AssignedPickupsState value)?  $default,){
final _that = this;
switch (_that) {
case _AssignedPickupsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isLoading,  bool isPaginationLoading,  List<AssignedPickupModel> pickups,  DateTime? selectedDate,  String selectedStatus,  String searchQuery,  PaginateModel paginate,  Set<String> assignedDateStrings,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AssignedPickupsState() when $default != null:
return $default(_that.isLoading,_that.isPaginationLoading,_that.pickups,_that.selectedDate,_that.selectedStatus,_that.searchQuery,_that.paginate,_that.assignedDateStrings,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isLoading,  bool isPaginationLoading,  List<AssignedPickupModel> pickups,  DateTime? selectedDate,  String selectedStatus,  String searchQuery,  PaginateModel paginate,  Set<String> assignedDateStrings,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _AssignedPickupsState():
return $default(_that.isLoading,_that.isPaginationLoading,_that.pickups,_that.selectedDate,_that.selectedStatus,_that.searchQuery,_that.paginate,_that.assignedDateStrings,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isLoading,  bool isPaginationLoading,  List<AssignedPickupModel> pickups,  DateTime? selectedDate,  String selectedStatus,  String searchQuery,  PaginateModel paginate,  Set<String> assignedDateStrings,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _AssignedPickupsState() when $default != null:
return $default(_that.isLoading,_that.isPaginationLoading,_that.pickups,_that.selectedDate,_that.selectedStatus,_that.searchQuery,_that.paginate,_that.assignedDateStrings,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _AssignedPickupsState implements AssignedPickupsState {
  const _AssignedPickupsState({this.isLoading = true, this.isPaginationLoading = false, this.pickups = const <AssignedPickupModel>[], this.selectedDate, this.selectedStatus = 'all', this.searchQuery = '', this.paginate = const PaginateModel(), this.assignedDateStrings = const <String>{}, this.errorMessage});
  

@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  bool isPaginationLoading;
@override@JsonKey() final  List<AssignedPickupModel> pickups;
@override final  DateTime? selectedDate;
@override@JsonKey() final  String selectedStatus;
@override@JsonKey() final  String searchQuery;
@override@JsonKey() final  PaginateModel paginate;
@override@JsonKey() final  Set<String> assignedDateStrings;
@override final  String? errorMessage;

/// Create a copy of AssignedPickupsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AssignedPickupsStateCopyWith<_AssignedPickupsState> get copyWith => __$AssignedPickupsStateCopyWithImpl<_AssignedPickupsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AssignedPickupsState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isPaginationLoading, isPaginationLoading) || other.isPaginationLoading == isPaginationLoading)&&const DeepCollectionEquality().equals(other.pickups, pickups)&&(identical(other.selectedDate, selectedDate) || other.selectedDate == selectedDate)&&(identical(other.selectedStatus, selectedStatus) || other.selectedStatus == selectedStatus)&&(identical(other.searchQuery, searchQuery) || other.searchQuery == searchQuery)&&(identical(other.paginate, paginate) || other.paginate == paginate)&&const DeepCollectionEquality().equals(other.assignedDateStrings, assignedDateStrings)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,isPaginationLoading,const DeepCollectionEquality().hash(pickups),selectedDate,selectedStatus,searchQuery,paginate,const DeepCollectionEquality().hash(assignedDateStrings),errorMessage);

@override
String toString() {
  return 'AssignedPickupsState(isLoading: $isLoading, isPaginationLoading: $isPaginationLoading, pickups: $pickups, selectedDate: $selectedDate, selectedStatus: $selectedStatus, searchQuery: $searchQuery, paginate: $paginate, assignedDateStrings: $assignedDateStrings, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$AssignedPickupsStateCopyWith<$Res> implements $AssignedPickupsStateCopyWith<$Res> {
  factory _$AssignedPickupsStateCopyWith(_AssignedPickupsState value, $Res Function(_AssignedPickupsState) _then) = __$AssignedPickupsStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading, bool isPaginationLoading, List<AssignedPickupModel> pickups, DateTime? selectedDate, String selectedStatus, String searchQuery, PaginateModel paginate, Set<String> assignedDateStrings, String? errorMessage
});


@override $PaginateModelCopyWith<$Res> get paginate;

}
/// @nodoc
class __$AssignedPickupsStateCopyWithImpl<$Res>
    implements _$AssignedPickupsStateCopyWith<$Res> {
  __$AssignedPickupsStateCopyWithImpl(this._self, this._then);

  final _AssignedPickupsState _self;
  final $Res Function(_AssignedPickupsState) _then;

/// Create a copy of AssignedPickupsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? isPaginationLoading = null,Object? pickups = null,Object? selectedDate = freezed,Object? selectedStatus = null,Object? searchQuery = null,Object? paginate = null,Object? assignedDateStrings = null,Object? errorMessage = freezed,}) {
  return _then(_AssignedPickupsState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isPaginationLoading: null == isPaginationLoading ? _self.isPaginationLoading : isPaginationLoading // ignore: cast_nullable_to_non_nullable
as bool,pickups: null == pickups ? _self.pickups : pickups // ignore: cast_nullable_to_non_nullable
as List<AssignedPickupModel>,selectedDate: freezed == selectedDate ? _self.selectedDate : selectedDate // ignore: cast_nullable_to_non_nullable
as DateTime?,selectedStatus: null == selectedStatus ? _self.selectedStatus : selectedStatus // ignore: cast_nullable_to_non_nullable
as String,searchQuery: null == searchQuery ? _self.searchQuery : searchQuery // ignore: cast_nullable_to_non_nullable
as String,paginate: null == paginate ? _self.paginate : paginate // ignore: cast_nullable_to_non_nullable
as PaginateModel,assignedDateStrings: null == assignedDateStrings ? _self.assignedDateStrings : assignedDateStrings // ignore: cast_nullable_to_non_nullable
as Set<String>,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of AssignedPickupsState
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
