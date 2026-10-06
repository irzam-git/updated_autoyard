// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'driver_details_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DriverDetailsModel {

 int? get id;@JsonKey(name: 'user_id') int? get userId;@JsonKey(name: 'send_details_to') String? get sendDetailsTo;
/// Create a copy of DriverDetailsModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DriverDetailsModelCopyWith<DriverDetailsModel> get copyWith => _$DriverDetailsModelCopyWithImpl<DriverDetailsModel>(this as DriverDetailsModel, _$identity);

  /// Serializes this DriverDetailsModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DriverDetailsModel&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.sendDetailsTo, sendDetailsTo) || other.sendDetailsTo == sendDetailsTo));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,sendDetailsTo);

@override
String toString() {
  return 'DriverDetailsModel(id: $id, userId: $userId, sendDetailsTo: $sendDetailsTo)';
}


}

/// @nodoc
abstract mixin class $DriverDetailsModelCopyWith<$Res>  {
  factory $DriverDetailsModelCopyWith(DriverDetailsModel value, $Res Function(DriverDetailsModel) _then) = _$DriverDetailsModelCopyWithImpl;
@useResult
$Res call({
 int? id,@JsonKey(name: 'user_id') int? userId,@JsonKey(name: 'send_details_to') String? sendDetailsTo
});




}
/// @nodoc
class _$DriverDetailsModelCopyWithImpl<$Res>
    implements $DriverDetailsModelCopyWith<$Res> {
  _$DriverDetailsModelCopyWithImpl(this._self, this._then);

  final DriverDetailsModel _self;
  final $Res Function(DriverDetailsModel) _then;

/// Create a copy of DriverDetailsModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? userId = freezed,Object? sendDetailsTo = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int?,sendDetailsTo: freezed == sendDetailsTo ? _self.sendDetailsTo : sendDetailsTo // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [DriverDetailsModel].
extension DriverDetailsModelPatterns on DriverDetailsModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DriverDetailsModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DriverDetailsModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DriverDetailsModel value)  $default,){
final _that = this;
switch (_that) {
case _DriverDetailsModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DriverDetailsModel value)?  $default,){
final _that = this;
switch (_that) {
case _DriverDetailsModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id, @JsonKey(name: 'user_id')  int? userId, @JsonKey(name: 'send_details_to')  String? sendDetailsTo)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DriverDetailsModel() when $default != null:
return $default(_that.id,_that.userId,_that.sendDetailsTo);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id, @JsonKey(name: 'user_id')  int? userId, @JsonKey(name: 'send_details_to')  String? sendDetailsTo)  $default,) {final _that = this;
switch (_that) {
case _DriverDetailsModel():
return $default(_that.id,_that.userId,_that.sendDetailsTo);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id, @JsonKey(name: 'user_id')  int? userId, @JsonKey(name: 'send_details_to')  String? sendDetailsTo)?  $default,) {final _that = this;
switch (_that) {
case _DriverDetailsModel() when $default != null:
return $default(_that.id,_that.userId,_that.sendDetailsTo);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DriverDetailsModel implements DriverDetailsModel {
  const _DriverDetailsModel({this.id, @JsonKey(name: 'user_id') this.userId, @JsonKey(name: 'send_details_to') this.sendDetailsTo});
  factory _DriverDetailsModel.fromJson(Map<String, dynamic> json) => _$DriverDetailsModelFromJson(json);

@override final  int? id;
@override@JsonKey(name: 'user_id') final  int? userId;
@override@JsonKey(name: 'send_details_to') final  String? sendDetailsTo;

/// Create a copy of DriverDetailsModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DriverDetailsModelCopyWith<_DriverDetailsModel> get copyWith => __$DriverDetailsModelCopyWithImpl<_DriverDetailsModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DriverDetailsModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DriverDetailsModel&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.sendDetailsTo, sendDetailsTo) || other.sendDetailsTo == sendDetailsTo));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,sendDetailsTo);

@override
String toString() {
  return 'DriverDetailsModel(id: $id, userId: $userId, sendDetailsTo: $sendDetailsTo)';
}


}

/// @nodoc
abstract mixin class _$DriverDetailsModelCopyWith<$Res> implements $DriverDetailsModelCopyWith<$Res> {
  factory _$DriverDetailsModelCopyWith(_DriverDetailsModel value, $Res Function(_DriverDetailsModel) _then) = __$DriverDetailsModelCopyWithImpl;
@override @useResult
$Res call({
 int? id,@JsonKey(name: 'user_id') int? userId,@JsonKey(name: 'send_details_to') String? sendDetailsTo
});




}
/// @nodoc
class __$DriverDetailsModelCopyWithImpl<$Res>
    implements _$DriverDetailsModelCopyWith<$Res> {
  __$DriverDetailsModelCopyWithImpl(this._self, this._then);

  final _DriverDetailsModel _self;
  final $Res Function(_DriverDetailsModel) _then;

/// Create a copy of DriverDetailsModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? userId = freezed,Object? sendDetailsTo = freezed,}) {
  return _then(_DriverDetailsModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int?,sendDetailsTo: freezed == sendDetailsTo ? _self.sendDetailsTo : sendDetailsTo // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
