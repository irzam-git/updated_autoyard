// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vehicle_model_option.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$VehicleModelOption {

 int get id;@JsonKey(name: 'brand_id') int? get brandId; String get name; String? get description; String? get status;
/// Create a copy of VehicleModelOption
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VehicleModelOptionCopyWith<VehicleModelOption> get copyWith => _$VehicleModelOptionCopyWithImpl<VehicleModelOption>(this as VehicleModelOption, _$identity);

  /// Serializes this VehicleModelOption to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VehicleModelOption&&(identical(other.id, id) || other.id == id)&&(identical(other.brandId, brandId) || other.brandId == brandId)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,brandId,name,description,status);

@override
String toString() {
  return 'VehicleModelOption(id: $id, brandId: $brandId, name: $name, description: $description, status: $status)';
}


}

/// @nodoc
abstract mixin class $VehicleModelOptionCopyWith<$Res>  {
  factory $VehicleModelOptionCopyWith(VehicleModelOption value, $Res Function(VehicleModelOption) _then) = _$VehicleModelOptionCopyWithImpl;
@useResult
$Res call({
 int id,@JsonKey(name: 'brand_id') int? brandId, String name, String? description, String? status
});




}
/// @nodoc
class _$VehicleModelOptionCopyWithImpl<$Res>
    implements $VehicleModelOptionCopyWith<$Res> {
  _$VehicleModelOptionCopyWithImpl(this._self, this._then);

  final VehicleModelOption _self;
  final $Res Function(VehicleModelOption) _then;

/// Create a copy of VehicleModelOption
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? brandId = freezed,Object? name = null,Object? description = freezed,Object? status = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,brandId: freezed == brandId ? _self.brandId : brandId // ignore: cast_nullable_to_non_nullable
as int?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [VehicleModelOption].
extension VehicleModelOptionPatterns on VehicleModelOption {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VehicleModelOption value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VehicleModelOption() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VehicleModelOption value)  $default,){
final _that = this;
switch (_that) {
case _VehicleModelOption():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VehicleModelOption value)?  $default,){
final _that = this;
switch (_that) {
case _VehicleModelOption() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'brand_id')  int? brandId,  String name,  String? description,  String? status)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VehicleModelOption() when $default != null:
return $default(_that.id,_that.brandId,_that.name,_that.description,_that.status);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'brand_id')  int? brandId,  String name,  String? description,  String? status)  $default,) {final _that = this;
switch (_that) {
case _VehicleModelOption():
return $default(_that.id,_that.brandId,_that.name,_that.description,_that.status);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id, @JsonKey(name: 'brand_id')  int? brandId,  String name,  String? description,  String? status)?  $default,) {final _that = this;
switch (_that) {
case _VehicleModelOption() when $default != null:
return $default(_that.id,_that.brandId,_that.name,_that.description,_that.status);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VehicleModelOption implements VehicleModelOption {
  const _VehicleModelOption({required this.id, @JsonKey(name: 'brand_id') this.brandId, required this.name, this.description, this.status});
  factory _VehicleModelOption.fromJson(Map<String, dynamic> json) => _$VehicleModelOptionFromJson(json);

@override final  int id;
@override@JsonKey(name: 'brand_id') final  int? brandId;
@override final  String name;
@override final  String? description;
@override final  String? status;

/// Create a copy of VehicleModelOption
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VehicleModelOptionCopyWith<_VehicleModelOption> get copyWith => __$VehicleModelOptionCopyWithImpl<_VehicleModelOption>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VehicleModelOptionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VehicleModelOption&&(identical(other.id, id) || other.id == id)&&(identical(other.brandId, brandId) || other.brandId == brandId)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,brandId,name,description,status);

@override
String toString() {
  return 'VehicleModelOption(id: $id, brandId: $brandId, name: $name, description: $description, status: $status)';
}


}

/// @nodoc
abstract mixin class _$VehicleModelOptionCopyWith<$Res> implements $VehicleModelOptionCopyWith<$Res> {
  factory _$VehicleModelOptionCopyWith(_VehicleModelOption value, $Res Function(_VehicleModelOption) _then) = __$VehicleModelOptionCopyWithImpl;
@override @useResult
$Res call({
 int id,@JsonKey(name: 'brand_id') int? brandId, String name, String? description, String? status
});




}
/// @nodoc
class __$VehicleModelOptionCopyWithImpl<$Res>
    implements _$VehicleModelOptionCopyWith<$Res> {
  __$VehicleModelOptionCopyWithImpl(this._self, this._then);

  final _VehicleModelOption _self;
  final $Res Function(_VehicleModelOption) _then;

/// Create a copy of VehicleModelOption
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? brandId = freezed,Object? name = null,Object? description = freezed,Object? status = freezed,}) {
  return _then(_VehicleModelOption(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,brandId: freezed == brandId ? _self.brandId : brandId // ignore: cast_nullable_to_non_nullable
as int?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
