// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vehicle_condition_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$VehicleConditionModel {

 String get drivable; String get accidental; String get wovi;@JsonKey(name: 'under_finance') String get underFinance;
/// Create a copy of VehicleConditionModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VehicleConditionModelCopyWith<VehicleConditionModel> get copyWith => _$VehicleConditionModelCopyWithImpl<VehicleConditionModel>(this as VehicleConditionModel, _$identity);

  /// Serializes this VehicleConditionModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VehicleConditionModel&&(identical(other.drivable, drivable) || other.drivable == drivable)&&(identical(other.accidental, accidental) || other.accidental == accidental)&&(identical(other.wovi, wovi) || other.wovi == wovi)&&(identical(other.underFinance, underFinance) || other.underFinance == underFinance));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,drivable,accidental,wovi,underFinance);

@override
String toString() {
  return 'VehicleConditionModel(drivable: $drivable, accidental: $accidental, wovi: $wovi, underFinance: $underFinance)';
}


}

/// @nodoc
abstract mixin class $VehicleConditionModelCopyWith<$Res>  {
  factory $VehicleConditionModelCopyWith(VehicleConditionModel value, $Res Function(VehicleConditionModel) _then) = _$VehicleConditionModelCopyWithImpl;
@useResult
$Res call({
 String drivable, String accidental, String wovi,@JsonKey(name: 'under_finance') String underFinance
});




}
/// @nodoc
class _$VehicleConditionModelCopyWithImpl<$Res>
    implements $VehicleConditionModelCopyWith<$Res> {
  _$VehicleConditionModelCopyWithImpl(this._self, this._then);

  final VehicleConditionModel _self;
  final $Res Function(VehicleConditionModel) _then;

/// Create a copy of VehicleConditionModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? drivable = null,Object? accidental = null,Object? wovi = null,Object? underFinance = null,}) {
  return _then(_self.copyWith(
drivable: null == drivable ? _self.drivable : drivable // ignore: cast_nullable_to_non_nullable
as String,accidental: null == accidental ? _self.accidental : accidental // ignore: cast_nullable_to_non_nullable
as String,wovi: null == wovi ? _self.wovi : wovi // ignore: cast_nullable_to_non_nullable
as String,underFinance: null == underFinance ? _self.underFinance : underFinance // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [VehicleConditionModel].
extension VehicleConditionModelPatterns on VehicleConditionModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VehicleConditionModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VehicleConditionModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VehicleConditionModel value)  $default,){
final _that = this;
switch (_that) {
case _VehicleConditionModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VehicleConditionModel value)?  $default,){
final _that = this;
switch (_that) {
case _VehicleConditionModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String drivable,  String accidental,  String wovi, @JsonKey(name: 'under_finance')  String underFinance)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VehicleConditionModel() when $default != null:
return $default(_that.drivable,_that.accidental,_that.wovi,_that.underFinance);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String drivable,  String accidental,  String wovi, @JsonKey(name: 'under_finance')  String underFinance)  $default,) {final _that = this;
switch (_that) {
case _VehicleConditionModel():
return $default(_that.drivable,_that.accidental,_that.wovi,_that.underFinance);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String drivable,  String accidental,  String wovi, @JsonKey(name: 'under_finance')  String underFinance)?  $default,) {final _that = this;
switch (_that) {
case _VehicleConditionModel() when $default != null:
return $default(_that.drivable,_that.accidental,_that.wovi,_that.underFinance);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VehicleConditionModel extends VehicleConditionModel {
  const _VehicleConditionModel({this.drivable = 'yes', this.accidental = 'no', this.wovi = 'no', @JsonKey(name: 'under_finance') this.underFinance = 'no'}): super._();
  factory _VehicleConditionModel.fromJson(Map<String, dynamic> json) => _$VehicleConditionModelFromJson(json);

@override@JsonKey() final  String drivable;
@override@JsonKey() final  String accidental;
@override@JsonKey() final  String wovi;
@override@JsonKey(name: 'under_finance') final  String underFinance;

/// Create a copy of VehicleConditionModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VehicleConditionModelCopyWith<_VehicleConditionModel> get copyWith => __$VehicleConditionModelCopyWithImpl<_VehicleConditionModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VehicleConditionModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VehicleConditionModel&&(identical(other.drivable, drivable) || other.drivable == drivable)&&(identical(other.accidental, accidental) || other.accidental == accidental)&&(identical(other.wovi, wovi) || other.wovi == wovi)&&(identical(other.underFinance, underFinance) || other.underFinance == underFinance));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,drivable,accidental,wovi,underFinance);

@override
String toString() {
  return 'VehicleConditionModel(drivable: $drivable, accidental: $accidental, wovi: $wovi, underFinance: $underFinance)';
}


}

/// @nodoc
abstract mixin class _$VehicleConditionModelCopyWith<$Res> implements $VehicleConditionModelCopyWith<$Res> {
  factory _$VehicleConditionModelCopyWith(_VehicleConditionModel value, $Res Function(_VehicleConditionModel) _then) = __$VehicleConditionModelCopyWithImpl;
@override @useResult
$Res call({
 String drivable, String accidental, String wovi,@JsonKey(name: 'under_finance') String underFinance
});




}
/// @nodoc
class __$VehicleConditionModelCopyWithImpl<$Res>
    implements _$VehicleConditionModelCopyWith<$Res> {
  __$VehicleConditionModelCopyWithImpl(this._self, this._then);

  final _VehicleConditionModel _self;
  final $Res Function(_VehicleConditionModel) _then;

/// Create a copy of VehicleConditionModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? drivable = null,Object? accidental = null,Object? wovi = null,Object? underFinance = null,}) {
  return _then(_VehicleConditionModel(
drivable: null == drivable ? _self.drivable : drivable // ignore: cast_nullable_to_non_nullable
as String,accidental: null == accidental ? _self.accidental : accidental // ignore: cast_nullable_to_non_nullable
as String,wovi: null == wovi ? _self.wovi : wovi // ignore: cast_nullable_to_non_nullable
as String,underFinance: null == underFinance ? _self.underFinance : underFinance // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
