// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rego_lookup_result_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RegoLookupResultModel {

 String? get vin; String? get chassis; String? get make; String? get model;@JsonKey(name: 'brand_id') int? get brandId;@JsonKey(name: 'model_id') int? get modelId; String? get colour;@JsonKey(name: 'body_type') String? get bodyType;@JsonKey(name: 'vehicle_type') String? get vehicleType;@JsonKey(name: 'engine_number') String? get engineNumber;@JsonKey(name: 'engine_size') String? get engineSize; String? get year; String? get variant; String? get transmission;@JsonKey(name: 'registration_number') String? get registrationNumber;@JsonKey(name: 'registration_state') String? get registrationState;
/// Create a copy of RegoLookupResultModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RegoLookupResultModelCopyWith<RegoLookupResultModel> get copyWith => _$RegoLookupResultModelCopyWithImpl<RegoLookupResultModel>(this as RegoLookupResultModel, _$identity);

  /// Serializes this RegoLookupResultModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegoLookupResultModel&&(identical(other.vin, vin) || other.vin == vin)&&(identical(other.chassis, chassis) || other.chassis == chassis)&&(identical(other.make, make) || other.make == make)&&(identical(other.model, model) || other.model == model)&&(identical(other.brandId, brandId) || other.brandId == brandId)&&(identical(other.modelId, modelId) || other.modelId == modelId)&&(identical(other.colour, colour) || other.colour == colour)&&(identical(other.bodyType, bodyType) || other.bodyType == bodyType)&&(identical(other.vehicleType, vehicleType) || other.vehicleType == vehicleType)&&(identical(other.engineNumber, engineNumber) || other.engineNumber == engineNumber)&&(identical(other.engineSize, engineSize) || other.engineSize == engineSize)&&(identical(other.year, year) || other.year == year)&&(identical(other.variant, variant) || other.variant == variant)&&(identical(other.transmission, transmission) || other.transmission == transmission)&&(identical(other.registrationNumber, registrationNumber) || other.registrationNumber == registrationNumber)&&(identical(other.registrationState, registrationState) || other.registrationState == registrationState));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,vin,chassis,make,model,brandId,modelId,colour,bodyType,vehicleType,engineNumber,engineSize,year,variant,transmission,registrationNumber,registrationState);

@override
String toString() {
  return 'RegoLookupResultModel(vin: $vin, chassis: $chassis, make: $make, model: $model, brandId: $brandId, modelId: $modelId, colour: $colour, bodyType: $bodyType, vehicleType: $vehicleType, engineNumber: $engineNumber, engineSize: $engineSize, year: $year, variant: $variant, transmission: $transmission, registrationNumber: $registrationNumber, registrationState: $registrationState)';
}


}

/// @nodoc
abstract mixin class $RegoLookupResultModelCopyWith<$Res>  {
  factory $RegoLookupResultModelCopyWith(RegoLookupResultModel value, $Res Function(RegoLookupResultModel) _then) = _$RegoLookupResultModelCopyWithImpl;
@useResult
$Res call({
 String? vin, String? chassis, String? make, String? model,@JsonKey(name: 'brand_id') int? brandId,@JsonKey(name: 'model_id') int? modelId, String? colour,@JsonKey(name: 'body_type') String? bodyType,@JsonKey(name: 'vehicle_type') String? vehicleType,@JsonKey(name: 'engine_number') String? engineNumber,@JsonKey(name: 'engine_size') String? engineSize, String? year, String? variant, String? transmission,@JsonKey(name: 'registration_number') String? registrationNumber,@JsonKey(name: 'registration_state') String? registrationState
});




}
/// @nodoc
class _$RegoLookupResultModelCopyWithImpl<$Res>
    implements $RegoLookupResultModelCopyWith<$Res> {
  _$RegoLookupResultModelCopyWithImpl(this._self, this._then);

  final RegoLookupResultModel _self;
  final $Res Function(RegoLookupResultModel) _then;

/// Create a copy of RegoLookupResultModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? vin = freezed,Object? chassis = freezed,Object? make = freezed,Object? model = freezed,Object? brandId = freezed,Object? modelId = freezed,Object? colour = freezed,Object? bodyType = freezed,Object? vehicleType = freezed,Object? engineNumber = freezed,Object? engineSize = freezed,Object? year = freezed,Object? variant = freezed,Object? transmission = freezed,Object? registrationNumber = freezed,Object? registrationState = freezed,}) {
  return _then(_self.copyWith(
vin: freezed == vin ? _self.vin : vin // ignore: cast_nullable_to_non_nullable
as String?,chassis: freezed == chassis ? _self.chassis : chassis // ignore: cast_nullable_to_non_nullable
as String?,make: freezed == make ? _self.make : make // ignore: cast_nullable_to_non_nullable
as String?,model: freezed == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as String?,brandId: freezed == brandId ? _self.brandId : brandId // ignore: cast_nullable_to_non_nullable
as int?,modelId: freezed == modelId ? _self.modelId : modelId // ignore: cast_nullable_to_non_nullable
as int?,colour: freezed == colour ? _self.colour : colour // ignore: cast_nullable_to_non_nullable
as String?,bodyType: freezed == bodyType ? _self.bodyType : bodyType // ignore: cast_nullable_to_non_nullable
as String?,vehicleType: freezed == vehicleType ? _self.vehicleType : vehicleType // ignore: cast_nullable_to_non_nullable
as String?,engineNumber: freezed == engineNumber ? _self.engineNumber : engineNumber // ignore: cast_nullable_to_non_nullable
as String?,engineSize: freezed == engineSize ? _self.engineSize : engineSize // ignore: cast_nullable_to_non_nullable
as String?,year: freezed == year ? _self.year : year // ignore: cast_nullable_to_non_nullable
as String?,variant: freezed == variant ? _self.variant : variant // ignore: cast_nullable_to_non_nullable
as String?,transmission: freezed == transmission ? _self.transmission : transmission // ignore: cast_nullable_to_non_nullable
as String?,registrationNumber: freezed == registrationNumber ? _self.registrationNumber : registrationNumber // ignore: cast_nullable_to_non_nullable
as String?,registrationState: freezed == registrationState ? _self.registrationState : registrationState // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [RegoLookupResultModel].
extension RegoLookupResultModelPatterns on RegoLookupResultModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RegoLookupResultModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RegoLookupResultModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RegoLookupResultModel value)  $default,){
final _that = this;
switch (_that) {
case _RegoLookupResultModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RegoLookupResultModel value)?  $default,){
final _that = this;
switch (_that) {
case _RegoLookupResultModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? vin,  String? chassis,  String? make,  String? model, @JsonKey(name: 'brand_id')  int? brandId, @JsonKey(name: 'model_id')  int? modelId,  String? colour, @JsonKey(name: 'body_type')  String? bodyType, @JsonKey(name: 'vehicle_type')  String? vehicleType, @JsonKey(name: 'engine_number')  String? engineNumber, @JsonKey(name: 'engine_size')  String? engineSize,  String? year,  String? variant,  String? transmission, @JsonKey(name: 'registration_number')  String? registrationNumber, @JsonKey(name: 'registration_state')  String? registrationState)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RegoLookupResultModel() when $default != null:
return $default(_that.vin,_that.chassis,_that.make,_that.model,_that.brandId,_that.modelId,_that.colour,_that.bodyType,_that.vehicleType,_that.engineNumber,_that.engineSize,_that.year,_that.variant,_that.transmission,_that.registrationNumber,_that.registrationState);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? vin,  String? chassis,  String? make,  String? model, @JsonKey(name: 'brand_id')  int? brandId, @JsonKey(name: 'model_id')  int? modelId,  String? colour, @JsonKey(name: 'body_type')  String? bodyType, @JsonKey(name: 'vehicle_type')  String? vehicleType, @JsonKey(name: 'engine_number')  String? engineNumber, @JsonKey(name: 'engine_size')  String? engineSize,  String? year,  String? variant,  String? transmission, @JsonKey(name: 'registration_number')  String? registrationNumber, @JsonKey(name: 'registration_state')  String? registrationState)  $default,) {final _that = this;
switch (_that) {
case _RegoLookupResultModel():
return $default(_that.vin,_that.chassis,_that.make,_that.model,_that.brandId,_that.modelId,_that.colour,_that.bodyType,_that.vehicleType,_that.engineNumber,_that.engineSize,_that.year,_that.variant,_that.transmission,_that.registrationNumber,_that.registrationState);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? vin,  String? chassis,  String? make,  String? model, @JsonKey(name: 'brand_id')  int? brandId, @JsonKey(name: 'model_id')  int? modelId,  String? colour, @JsonKey(name: 'body_type')  String? bodyType, @JsonKey(name: 'vehicle_type')  String? vehicleType, @JsonKey(name: 'engine_number')  String? engineNumber, @JsonKey(name: 'engine_size')  String? engineSize,  String? year,  String? variant,  String? transmission, @JsonKey(name: 'registration_number')  String? registrationNumber, @JsonKey(name: 'registration_state')  String? registrationState)?  $default,) {final _that = this;
switch (_that) {
case _RegoLookupResultModel() when $default != null:
return $default(_that.vin,_that.chassis,_that.make,_that.model,_that.brandId,_that.modelId,_that.colour,_that.bodyType,_that.vehicleType,_that.engineNumber,_that.engineSize,_that.year,_that.variant,_that.transmission,_that.registrationNumber,_that.registrationState);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RegoLookupResultModel implements RegoLookupResultModel {
  const _RegoLookupResultModel({this.vin, this.chassis, this.make, this.model, @JsonKey(name: 'brand_id') this.brandId, @JsonKey(name: 'model_id') this.modelId, this.colour, @JsonKey(name: 'body_type') this.bodyType, @JsonKey(name: 'vehicle_type') this.vehicleType, @JsonKey(name: 'engine_number') this.engineNumber, @JsonKey(name: 'engine_size') this.engineSize, this.year, this.variant, this.transmission, @JsonKey(name: 'registration_number') this.registrationNumber, @JsonKey(name: 'registration_state') this.registrationState});
  factory _RegoLookupResultModel.fromJson(Map<String, dynamic> json) => _$RegoLookupResultModelFromJson(json);

@override final  String? vin;
@override final  String? chassis;
@override final  String? make;
@override final  String? model;
@override@JsonKey(name: 'brand_id') final  int? brandId;
@override@JsonKey(name: 'model_id') final  int? modelId;
@override final  String? colour;
@override@JsonKey(name: 'body_type') final  String? bodyType;
@override@JsonKey(name: 'vehicle_type') final  String? vehicleType;
@override@JsonKey(name: 'engine_number') final  String? engineNumber;
@override@JsonKey(name: 'engine_size') final  String? engineSize;
@override final  String? year;
@override final  String? variant;
@override final  String? transmission;
@override@JsonKey(name: 'registration_number') final  String? registrationNumber;
@override@JsonKey(name: 'registration_state') final  String? registrationState;

/// Create a copy of RegoLookupResultModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RegoLookupResultModelCopyWith<_RegoLookupResultModel> get copyWith => __$RegoLookupResultModelCopyWithImpl<_RegoLookupResultModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RegoLookupResultModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RegoLookupResultModel&&(identical(other.vin, vin) || other.vin == vin)&&(identical(other.chassis, chassis) || other.chassis == chassis)&&(identical(other.make, make) || other.make == make)&&(identical(other.model, model) || other.model == model)&&(identical(other.brandId, brandId) || other.brandId == brandId)&&(identical(other.modelId, modelId) || other.modelId == modelId)&&(identical(other.colour, colour) || other.colour == colour)&&(identical(other.bodyType, bodyType) || other.bodyType == bodyType)&&(identical(other.vehicleType, vehicleType) || other.vehicleType == vehicleType)&&(identical(other.engineNumber, engineNumber) || other.engineNumber == engineNumber)&&(identical(other.engineSize, engineSize) || other.engineSize == engineSize)&&(identical(other.year, year) || other.year == year)&&(identical(other.variant, variant) || other.variant == variant)&&(identical(other.transmission, transmission) || other.transmission == transmission)&&(identical(other.registrationNumber, registrationNumber) || other.registrationNumber == registrationNumber)&&(identical(other.registrationState, registrationState) || other.registrationState == registrationState));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,vin,chassis,make,model,brandId,modelId,colour,bodyType,vehicleType,engineNumber,engineSize,year,variant,transmission,registrationNumber,registrationState);

@override
String toString() {
  return 'RegoLookupResultModel(vin: $vin, chassis: $chassis, make: $make, model: $model, brandId: $brandId, modelId: $modelId, colour: $colour, bodyType: $bodyType, vehicleType: $vehicleType, engineNumber: $engineNumber, engineSize: $engineSize, year: $year, variant: $variant, transmission: $transmission, registrationNumber: $registrationNumber, registrationState: $registrationState)';
}


}

/// @nodoc
abstract mixin class _$RegoLookupResultModelCopyWith<$Res> implements $RegoLookupResultModelCopyWith<$Res> {
  factory _$RegoLookupResultModelCopyWith(_RegoLookupResultModel value, $Res Function(_RegoLookupResultModel) _then) = __$RegoLookupResultModelCopyWithImpl;
@override @useResult
$Res call({
 String? vin, String? chassis, String? make, String? model,@JsonKey(name: 'brand_id') int? brandId,@JsonKey(name: 'model_id') int? modelId, String? colour,@JsonKey(name: 'body_type') String? bodyType,@JsonKey(name: 'vehicle_type') String? vehicleType,@JsonKey(name: 'engine_number') String? engineNumber,@JsonKey(name: 'engine_size') String? engineSize, String? year, String? variant, String? transmission,@JsonKey(name: 'registration_number') String? registrationNumber,@JsonKey(name: 'registration_state') String? registrationState
});




}
/// @nodoc
class __$RegoLookupResultModelCopyWithImpl<$Res>
    implements _$RegoLookupResultModelCopyWith<$Res> {
  __$RegoLookupResultModelCopyWithImpl(this._self, this._then);

  final _RegoLookupResultModel _self;
  final $Res Function(_RegoLookupResultModel) _then;

/// Create a copy of RegoLookupResultModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? vin = freezed,Object? chassis = freezed,Object? make = freezed,Object? model = freezed,Object? brandId = freezed,Object? modelId = freezed,Object? colour = freezed,Object? bodyType = freezed,Object? vehicleType = freezed,Object? engineNumber = freezed,Object? engineSize = freezed,Object? year = freezed,Object? variant = freezed,Object? transmission = freezed,Object? registrationNumber = freezed,Object? registrationState = freezed,}) {
  return _then(_RegoLookupResultModel(
vin: freezed == vin ? _self.vin : vin // ignore: cast_nullable_to_non_nullable
as String?,chassis: freezed == chassis ? _self.chassis : chassis // ignore: cast_nullable_to_non_nullable
as String?,make: freezed == make ? _self.make : make // ignore: cast_nullable_to_non_nullable
as String?,model: freezed == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as String?,brandId: freezed == brandId ? _self.brandId : brandId // ignore: cast_nullable_to_non_nullable
as int?,modelId: freezed == modelId ? _self.modelId : modelId // ignore: cast_nullable_to_non_nullable
as int?,colour: freezed == colour ? _self.colour : colour // ignore: cast_nullable_to_non_nullable
as String?,bodyType: freezed == bodyType ? _self.bodyType : bodyType // ignore: cast_nullable_to_non_nullable
as String?,vehicleType: freezed == vehicleType ? _self.vehicleType : vehicleType // ignore: cast_nullable_to_non_nullable
as String?,engineNumber: freezed == engineNumber ? _self.engineNumber : engineNumber // ignore: cast_nullable_to_non_nullable
as String?,engineSize: freezed == engineSize ? _self.engineSize : engineSize // ignore: cast_nullable_to_non_nullable
as String?,year: freezed == year ? _self.year : year // ignore: cast_nullable_to_non_nullable
as String?,variant: freezed == variant ? _self.variant : variant // ignore: cast_nullable_to_non_nullable
as String?,transmission: freezed == transmission ? _self.transmission : transmission // ignore: cast_nullable_to_non_nullable
as String?,registrationNumber: freezed == registrationNumber ? _self.registrationNumber : registrationNumber // ignore: cast_nullable_to_non_nullable
as String?,registrationState: freezed == registrationState ? _self.registrationState : registrationState // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
