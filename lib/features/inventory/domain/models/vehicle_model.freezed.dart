// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vehicle_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$VehicleModel {

 int get id;@JsonKey(name: 'user_id') int? get userId;@JsonKey(name: 'driver_id') int? get driverId;@JsonKey(name: 'brand_id') int? get brandId;@JsonKey(name: 'model_id') int? get modelId; dynamic get year;@JsonKey(name: 'registration_number') String? get registrationNumber;@JsonKey(name: 'registration_date') String? get registrationDate;@JsonKey(name: 'registration_state') String? get registrationState;@JsonKey(name: 'engine_size') String? get engineSize;@JsonKey(name: 'engine_number') String? get engineNumber;@JsonKey(name: 'vin_number') String? get vinNumber; String? get transmission;@JsonKey(name: 'body_type') String? get bodyType; String? get variant; String? get built; String? get odometer;@JsonKey(name: 'first_name') String? get firstName;@JsonKey(name: 'last_name') String? get lastName; String? get fullname;@JsonKey(name: 'abn_number') String? get abnNumber;@JsonKey(name: 'business_name') String? get businessName;@JsonKey(name: 'phone_number') String? get phoneNumber;@JsonKey(name: 'license_number') String? get licenseNumber;@JsonKey(name: 'pickup_date') String? get pickupDate;@JsonKey(name: 'date_of_birth') String? get dateOfBirth;@JsonKey(name: 'pickup_address') String? get pickupAddress;@JsonKey(name: 'residential_address') String? get residentialAddress;@JsonKey(name: 'same_pickup_address') dynamic get samePickupAddress;@JsonKey(name: 'vehicle_condition') VehicleConditionModel? get vehicleCondition; String? get note; dynamic get price;@JsonKey(name: 'payment_method') String? get paymentMethod;@JsonKey(name: 'owner_signature_url') String? get ownerSignatureUrl;@JsonKey(name: 'buyer_signature_url') String? get buyerSignatureUrl; String? get status; dynamic get approval;@JsonKey(name: 'created_at') String? get createdAt;@JsonKey(name: 'updated_at') String? get updatedAt; BrandModel? get brand; VehicleModelOption? get model;
/// Create a copy of VehicleModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VehicleModelCopyWith<VehicleModel> get copyWith => _$VehicleModelCopyWithImpl<VehicleModel>(this as VehicleModel, _$identity);

  /// Serializes this VehicleModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VehicleModel&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.driverId, driverId) || other.driverId == driverId)&&(identical(other.brandId, brandId) || other.brandId == brandId)&&(identical(other.modelId, modelId) || other.modelId == modelId)&&const DeepCollectionEquality().equals(other.year, year)&&(identical(other.registrationNumber, registrationNumber) || other.registrationNumber == registrationNumber)&&(identical(other.registrationDate, registrationDate) || other.registrationDate == registrationDate)&&(identical(other.registrationState, registrationState) || other.registrationState == registrationState)&&(identical(other.engineSize, engineSize) || other.engineSize == engineSize)&&(identical(other.engineNumber, engineNumber) || other.engineNumber == engineNumber)&&(identical(other.vinNumber, vinNumber) || other.vinNumber == vinNumber)&&(identical(other.transmission, transmission) || other.transmission == transmission)&&(identical(other.bodyType, bodyType) || other.bodyType == bodyType)&&(identical(other.variant, variant) || other.variant == variant)&&(identical(other.built, built) || other.built == built)&&(identical(other.odometer, odometer) || other.odometer == odometer)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.fullname, fullname) || other.fullname == fullname)&&(identical(other.abnNumber, abnNumber) || other.abnNumber == abnNumber)&&(identical(other.businessName, businessName) || other.businessName == businessName)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.licenseNumber, licenseNumber) || other.licenseNumber == licenseNumber)&&(identical(other.pickupDate, pickupDate) || other.pickupDate == pickupDate)&&(identical(other.dateOfBirth, dateOfBirth) || other.dateOfBirth == dateOfBirth)&&(identical(other.pickupAddress, pickupAddress) || other.pickupAddress == pickupAddress)&&(identical(other.residentialAddress, residentialAddress) || other.residentialAddress == residentialAddress)&&const DeepCollectionEquality().equals(other.samePickupAddress, samePickupAddress)&&(identical(other.vehicleCondition, vehicleCondition) || other.vehicleCondition == vehicleCondition)&&(identical(other.note, note) || other.note == note)&&const DeepCollectionEquality().equals(other.price, price)&&(identical(other.paymentMethod, paymentMethod) || other.paymentMethod == paymentMethod)&&(identical(other.ownerSignatureUrl, ownerSignatureUrl) || other.ownerSignatureUrl == ownerSignatureUrl)&&(identical(other.buyerSignatureUrl, buyerSignatureUrl) || other.buyerSignatureUrl == buyerSignatureUrl)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.approval, approval)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.brand, brand) || other.brand == brand)&&(identical(other.model, model) || other.model == model));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,userId,driverId,brandId,modelId,const DeepCollectionEquality().hash(year),registrationNumber,registrationDate,registrationState,engineSize,engineNumber,vinNumber,transmission,bodyType,variant,built,odometer,firstName,lastName,fullname,abnNumber,businessName,phoneNumber,licenseNumber,pickupDate,dateOfBirth,pickupAddress,residentialAddress,const DeepCollectionEquality().hash(samePickupAddress),vehicleCondition,note,const DeepCollectionEquality().hash(price),paymentMethod,ownerSignatureUrl,buyerSignatureUrl,status,const DeepCollectionEquality().hash(approval),createdAt,updatedAt,brand,model]);

@override
String toString() {
  return 'VehicleModel(id: $id, userId: $userId, driverId: $driverId, brandId: $brandId, modelId: $modelId, year: $year, registrationNumber: $registrationNumber, registrationDate: $registrationDate, registrationState: $registrationState, engineSize: $engineSize, engineNumber: $engineNumber, vinNumber: $vinNumber, transmission: $transmission, bodyType: $bodyType, variant: $variant, built: $built, odometer: $odometer, firstName: $firstName, lastName: $lastName, fullname: $fullname, abnNumber: $abnNumber, businessName: $businessName, phoneNumber: $phoneNumber, licenseNumber: $licenseNumber, pickupDate: $pickupDate, dateOfBirth: $dateOfBirth, pickupAddress: $pickupAddress, residentialAddress: $residentialAddress, samePickupAddress: $samePickupAddress, vehicleCondition: $vehicleCondition, note: $note, price: $price, paymentMethod: $paymentMethod, ownerSignatureUrl: $ownerSignatureUrl, buyerSignatureUrl: $buyerSignatureUrl, status: $status, approval: $approval, createdAt: $createdAt, updatedAt: $updatedAt, brand: $brand, model: $model)';
}


}

/// @nodoc
abstract mixin class $VehicleModelCopyWith<$Res>  {
  factory $VehicleModelCopyWith(VehicleModel value, $Res Function(VehicleModel) _then) = _$VehicleModelCopyWithImpl;
@useResult
$Res call({
 int id,@JsonKey(name: 'user_id') int? userId,@JsonKey(name: 'driver_id') int? driverId,@JsonKey(name: 'brand_id') int? brandId,@JsonKey(name: 'model_id') int? modelId, dynamic year,@JsonKey(name: 'registration_number') String? registrationNumber,@JsonKey(name: 'registration_date') String? registrationDate,@JsonKey(name: 'registration_state') String? registrationState,@JsonKey(name: 'engine_size') String? engineSize,@JsonKey(name: 'engine_number') String? engineNumber,@JsonKey(name: 'vin_number') String? vinNumber, String? transmission,@JsonKey(name: 'body_type') String? bodyType, String? variant, String? built, String? odometer,@JsonKey(name: 'first_name') String? firstName,@JsonKey(name: 'last_name') String? lastName, String? fullname,@JsonKey(name: 'abn_number') String? abnNumber,@JsonKey(name: 'business_name') String? businessName,@JsonKey(name: 'phone_number') String? phoneNumber,@JsonKey(name: 'license_number') String? licenseNumber,@JsonKey(name: 'pickup_date') String? pickupDate,@JsonKey(name: 'date_of_birth') String? dateOfBirth,@JsonKey(name: 'pickup_address') String? pickupAddress,@JsonKey(name: 'residential_address') String? residentialAddress,@JsonKey(name: 'same_pickup_address') dynamic samePickupAddress,@JsonKey(name: 'vehicle_condition') VehicleConditionModel? vehicleCondition, String? note, dynamic price,@JsonKey(name: 'payment_method') String? paymentMethod,@JsonKey(name: 'owner_signature_url') String? ownerSignatureUrl,@JsonKey(name: 'buyer_signature_url') String? buyerSignatureUrl, String? status, dynamic approval,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'updated_at') String? updatedAt, BrandModel? brand, VehicleModelOption? model
});


$VehicleConditionModelCopyWith<$Res>? get vehicleCondition;$BrandModelCopyWith<$Res>? get brand;$VehicleModelOptionCopyWith<$Res>? get model;

}
/// @nodoc
class _$VehicleModelCopyWithImpl<$Res>
    implements $VehicleModelCopyWith<$Res> {
  _$VehicleModelCopyWithImpl(this._self, this._then);

  final VehicleModel _self;
  final $Res Function(VehicleModel) _then;

/// Create a copy of VehicleModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = freezed,Object? driverId = freezed,Object? brandId = freezed,Object? modelId = freezed,Object? year = freezed,Object? registrationNumber = freezed,Object? registrationDate = freezed,Object? registrationState = freezed,Object? engineSize = freezed,Object? engineNumber = freezed,Object? vinNumber = freezed,Object? transmission = freezed,Object? bodyType = freezed,Object? variant = freezed,Object? built = freezed,Object? odometer = freezed,Object? firstName = freezed,Object? lastName = freezed,Object? fullname = freezed,Object? abnNumber = freezed,Object? businessName = freezed,Object? phoneNumber = freezed,Object? licenseNumber = freezed,Object? pickupDate = freezed,Object? dateOfBirth = freezed,Object? pickupAddress = freezed,Object? residentialAddress = freezed,Object? samePickupAddress = freezed,Object? vehicleCondition = freezed,Object? note = freezed,Object? price = freezed,Object? paymentMethod = freezed,Object? ownerSignatureUrl = freezed,Object? buyerSignatureUrl = freezed,Object? status = freezed,Object? approval = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? brand = freezed,Object? model = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int?,driverId: freezed == driverId ? _self.driverId : driverId // ignore: cast_nullable_to_non_nullable
as int?,brandId: freezed == brandId ? _self.brandId : brandId // ignore: cast_nullable_to_non_nullable
as int?,modelId: freezed == modelId ? _self.modelId : modelId // ignore: cast_nullable_to_non_nullable
as int?,year: freezed == year ? _self.year : year // ignore: cast_nullable_to_non_nullable
as dynamic,registrationNumber: freezed == registrationNumber ? _self.registrationNumber : registrationNumber // ignore: cast_nullable_to_non_nullable
as String?,registrationDate: freezed == registrationDate ? _self.registrationDate : registrationDate // ignore: cast_nullable_to_non_nullable
as String?,registrationState: freezed == registrationState ? _self.registrationState : registrationState // ignore: cast_nullable_to_non_nullable
as String?,engineSize: freezed == engineSize ? _self.engineSize : engineSize // ignore: cast_nullable_to_non_nullable
as String?,engineNumber: freezed == engineNumber ? _self.engineNumber : engineNumber // ignore: cast_nullable_to_non_nullable
as String?,vinNumber: freezed == vinNumber ? _self.vinNumber : vinNumber // ignore: cast_nullable_to_non_nullable
as String?,transmission: freezed == transmission ? _self.transmission : transmission // ignore: cast_nullable_to_non_nullable
as String?,bodyType: freezed == bodyType ? _self.bodyType : bodyType // ignore: cast_nullable_to_non_nullable
as String?,variant: freezed == variant ? _self.variant : variant // ignore: cast_nullable_to_non_nullable
as String?,built: freezed == built ? _self.built : built // ignore: cast_nullable_to_non_nullable
as String?,odometer: freezed == odometer ? _self.odometer : odometer // ignore: cast_nullable_to_non_nullable
as String?,firstName: freezed == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String?,lastName: freezed == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String?,fullname: freezed == fullname ? _self.fullname : fullname // ignore: cast_nullable_to_non_nullable
as String?,abnNumber: freezed == abnNumber ? _self.abnNumber : abnNumber // ignore: cast_nullable_to_non_nullable
as String?,businessName: freezed == businessName ? _self.businessName : businessName // ignore: cast_nullable_to_non_nullable
as String?,phoneNumber: freezed == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String?,licenseNumber: freezed == licenseNumber ? _self.licenseNumber : licenseNumber // ignore: cast_nullable_to_non_nullable
as String?,pickupDate: freezed == pickupDate ? _self.pickupDate : pickupDate // ignore: cast_nullable_to_non_nullable
as String?,dateOfBirth: freezed == dateOfBirth ? _self.dateOfBirth : dateOfBirth // ignore: cast_nullable_to_non_nullable
as String?,pickupAddress: freezed == pickupAddress ? _self.pickupAddress : pickupAddress // ignore: cast_nullable_to_non_nullable
as String?,residentialAddress: freezed == residentialAddress ? _self.residentialAddress : residentialAddress // ignore: cast_nullable_to_non_nullable
as String?,samePickupAddress: freezed == samePickupAddress ? _self.samePickupAddress : samePickupAddress // ignore: cast_nullable_to_non_nullable
as dynamic,vehicleCondition: freezed == vehicleCondition ? _self.vehicleCondition : vehicleCondition // ignore: cast_nullable_to_non_nullable
as VehicleConditionModel?,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,price: freezed == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as dynamic,paymentMethod: freezed == paymentMethod ? _self.paymentMethod : paymentMethod // ignore: cast_nullable_to_non_nullable
as String?,ownerSignatureUrl: freezed == ownerSignatureUrl ? _self.ownerSignatureUrl : ownerSignatureUrl // ignore: cast_nullable_to_non_nullable
as String?,buyerSignatureUrl: freezed == buyerSignatureUrl ? _self.buyerSignatureUrl : buyerSignatureUrl // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,approval: freezed == approval ? _self.approval : approval // ignore: cast_nullable_to_non_nullable
as dynamic,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,brand: freezed == brand ? _self.brand : brand // ignore: cast_nullable_to_non_nullable
as BrandModel?,model: freezed == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as VehicleModelOption?,
  ));
}
/// Create a copy of VehicleModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VehicleConditionModelCopyWith<$Res>? get vehicleCondition {
    if (_self.vehicleCondition == null) {
    return null;
  }

  return $VehicleConditionModelCopyWith<$Res>(_self.vehicleCondition!, (value) {
    return _then(_self.copyWith(vehicleCondition: value));
  });
}/// Create a copy of VehicleModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BrandModelCopyWith<$Res>? get brand {
    if (_self.brand == null) {
    return null;
  }

  return $BrandModelCopyWith<$Res>(_self.brand!, (value) {
    return _then(_self.copyWith(brand: value));
  });
}/// Create a copy of VehicleModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VehicleModelOptionCopyWith<$Res>? get model {
    if (_self.model == null) {
    return null;
  }

  return $VehicleModelOptionCopyWith<$Res>(_self.model!, (value) {
    return _then(_self.copyWith(model: value));
  });
}
}


/// Adds pattern-matching-related methods to [VehicleModel].
extension VehicleModelPatterns on VehicleModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VehicleModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VehicleModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VehicleModel value)  $default,){
final _that = this;
switch (_that) {
case _VehicleModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VehicleModel value)?  $default,){
final _that = this;
switch (_that) {
case _VehicleModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'user_id')  int? userId, @JsonKey(name: 'driver_id')  int? driverId, @JsonKey(name: 'brand_id')  int? brandId, @JsonKey(name: 'model_id')  int? modelId,  dynamic year, @JsonKey(name: 'registration_number')  String? registrationNumber, @JsonKey(name: 'registration_date')  String? registrationDate, @JsonKey(name: 'registration_state')  String? registrationState, @JsonKey(name: 'engine_size')  String? engineSize, @JsonKey(name: 'engine_number')  String? engineNumber, @JsonKey(name: 'vin_number')  String? vinNumber,  String? transmission, @JsonKey(name: 'body_type')  String? bodyType,  String? variant,  String? built,  String? odometer, @JsonKey(name: 'first_name')  String? firstName, @JsonKey(name: 'last_name')  String? lastName,  String? fullname, @JsonKey(name: 'abn_number')  String? abnNumber, @JsonKey(name: 'business_name')  String? businessName, @JsonKey(name: 'phone_number')  String? phoneNumber, @JsonKey(name: 'license_number')  String? licenseNumber, @JsonKey(name: 'pickup_date')  String? pickupDate, @JsonKey(name: 'date_of_birth')  String? dateOfBirth, @JsonKey(name: 'pickup_address')  String? pickupAddress, @JsonKey(name: 'residential_address')  String? residentialAddress, @JsonKey(name: 'same_pickup_address')  dynamic samePickupAddress, @JsonKey(name: 'vehicle_condition')  VehicleConditionModel? vehicleCondition,  String? note,  dynamic price, @JsonKey(name: 'payment_method')  String? paymentMethod, @JsonKey(name: 'owner_signature_url')  String? ownerSignatureUrl, @JsonKey(name: 'buyer_signature_url')  String? buyerSignatureUrl,  String? status,  dynamic approval, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt,  BrandModel? brand,  VehicleModelOption? model)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VehicleModel() when $default != null:
return $default(_that.id,_that.userId,_that.driverId,_that.brandId,_that.modelId,_that.year,_that.registrationNumber,_that.registrationDate,_that.registrationState,_that.engineSize,_that.engineNumber,_that.vinNumber,_that.transmission,_that.bodyType,_that.variant,_that.built,_that.odometer,_that.firstName,_that.lastName,_that.fullname,_that.abnNumber,_that.businessName,_that.phoneNumber,_that.licenseNumber,_that.pickupDate,_that.dateOfBirth,_that.pickupAddress,_that.residentialAddress,_that.samePickupAddress,_that.vehicleCondition,_that.note,_that.price,_that.paymentMethod,_that.ownerSignatureUrl,_that.buyerSignatureUrl,_that.status,_that.approval,_that.createdAt,_that.updatedAt,_that.brand,_that.model);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'user_id')  int? userId, @JsonKey(name: 'driver_id')  int? driverId, @JsonKey(name: 'brand_id')  int? brandId, @JsonKey(name: 'model_id')  int? modelId,  dynamic year, @JsonKey(name: 'registration_number')  String? registrationNumber, @JsonKey(name: 'registration_date')  String? registrationDate, @JsonKey(name: 'registration_state')  String? registrationState, @JsonKey(name: 'engine_size')  String? engineSize, @JsonKey(name: 'engine_number')  String? engineNumber, @JsonKey(name: 'vin_number')  String? vinNumber,  String? transmission, @JsonKey(name: 'body_type')  String? bodyType,  String? variant,  String? built,  String? odometer, @JsonKey(name: 'first_name')  String? firstName, @JsonKey(name: 'last_name')  String? lastName,  String? fullname, @JsonKey(name: 'abn_number')  String? abnNumber, @JsonKey(name: 'business_name')  String? businessName, @JsonKey(name: 'phone_number')  String? phoneNumber, @JsonKey(name: 'license_number')  String? licenseNumber, @JsonKey(name: 'pickup_date')  String? pickupDate, @JsonKey(name: 'date_of_birth')  String? dateOfBirth, @JsonKey(name: 'pickup_address')  String? pickupAddress, @JsonKey(name: 'residential_address')  String? residentialAddress, @JsonKey(name: 'same_pickup_address')  dynamic samePickupAddress, @JsonKey(name: 'vehicle_condition')  VehicleConditionModel? vehicleCondition,  String? note,  dynamic price, @JsonKey(name: 'payment_method')  String? paymentMethod, @JsonKey(name: 'owner_signature_url')  String? ownerSignatureUrl, @JsonKey(name: 'buyer_signature_url')  String? buyerSignatureUrl,  String? status,  dynamic approval, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt,  BrandModel? brand,  VehicleModelOption? model)  $default,) {final _that = this;
switch (_that) {
case _VehicleModel():
return $default(_that.id,_that.userId,_that.driverId,_that.brandId,_that.modelId,_that.year,_that.registrationNumber,_that.registrationDate,_that.registrationState,_that.engineSize,_that.engineNumber,_that.vinNumber,_that.transmission,_that.bodyType,_that.variant,_that.built,_that.odometer,_that.firstName,_that.lastName,_that.fullname,_that.abnNumber,_that.businessName,_that.phoneNumber,_that.licenseNumber,_that.pickupDate,_that.dateOfBirth,_that.pickupAddress,_that.residentialAddress,_that.samePickupAddress,_that.vehicleCondition,_that.note,_that.price,_that.paymentMethod,_that.ownerSignatureUrl,_that.buyerSignatureUrl,_that.status,_that.approval,_that.createdAt,_that.updatedAt,_that.brand,_that.model);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id, @JsonKey(name: 'user_id')  int? userId, @JsonKey(name: 'driver_id')  int? driverId, @JsonKey(name: 'brand_id')  int? brandId, @JsonKey(name: 'model_id')  int? modelId,  dynamic year, @JsonKey(name: 'registration_number')  String? registrationNumber, @JsonKey(name: 'registration_date')  String? registrationDate, @JsonKey(name: 'registration_state')  String? registrationState, @JsonKey(name: 'engine_size')  String? engineSize, @JsonKey(name: 'engine_number')  String? engineNumber, @JsonKey(name: 'vin_number')  String? vinNumber,  String? transmission, @JsonKey(name: 'body_type')  String? bodyType,  String? variant,  String? built,  String? odometer, @JsonKey(name: 'first_name')  String? firstName, @JsonKey(name: 'last_name')  String? lastName,  String? fullname, @JsonKey(name: 'abn_number')  String? abnNumber, @JsonKey(name: 'business_name')  String? businessName, @JsonKey(name: 'phone_number')  String? phoneNumber, @JsonKey(name: 'license_number')  String? licenseNumber, @JsonKey(name: 'pickup_date')  String? pickupDate, @JsonKey(name: 'date_of_birth')  String? dateOfBirth, @JsonKey(name: 'pickup_address')  String? pickupAddress, @JsonKey(name: 'residential_address')  String? residentialAddress, @JsonKey(name: 'same_pickup_address')  dynamic samePickupAddress, @JsonKey(name: 'vehicle_condition')  VehicleConditionModel? vehicleCondition,  String? note,  dynamic price, @JsonKey(name: 'payment_method')  String? paymentMethod, @JsonKey(name: 'owner_signature_url')  String? ownerSignatureUrl, @JsonKey(name: 'buyer_signature_url')  String? buyerSignatureUrl,  String? status,  dynamic approval, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt,  BrandModel? brand,  VehicleModelOption? model)?  $default,) {final _that = this;
switch (_that) {
case _VehicleModel() when $default != null:
return $default(_that.id,_that.userId,_that.driverId,_that.brandId,_that.modelId,_that.year,_that.registrationNumber,_that.registrationDate,_that.registrationState,_that.engineSize,_that.engineNumber,_that.vinNumber,_that.transmission,_that.bodyType,_that.variant,_that.built,_that.odometer,_that.firstName,_that.lastName,_that.fullname,_that.abnNumber,_that.businessName,_that.phoneNumber,_that.licenseNumber,_that.pickupDate,_that.dateOfBirth,_that.pickupAddress,_that.residentialAddress,_that.samePickupAddress,_that.vehicleCondition,_that.note,_that.price,_that.paymentMethod,_that.ownerSignatureUrl,_that.buyerSignatureUrl,_that.status,_that.approval,_that.createdAt,_that.updatedAt,_that.brand,_that.model);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VehicleModel extends VehicleModel {
  const _VehicleModel({required this.id, @JsonKey(name: 'user_id') this.userId, @JsonKey(name: 'driver_id') this.driverId, @JsonKey(name: 'brand_id') this.brandId, @JsonKey(name: 'model_id') this.modelId, this.year, @JsonKey(name: 'registration_number') this.registrationNumber, @JsonKey(name: 'registration_date') this.registrationDate, @JsonKey(name: 'registration_state') this.registrationState, @JsonKey(name: 'engine_size') this.engineSize, @JsonKey(name: 'engine_number') this.engineNumber, @JsonKey(name: 'vin_number') this.vinNumber, this.transmission, @JsonKey(name: 'body_type') this.bodyType, this.variant, this.built, this.odometer, @JsonKey(name: 'first_name') this.firstName, @JsonKey(name: 'last_name') this.lastName, this.fullname, @JsonKey(name: 'abn_number') this.abnNumber, @JsonKey(name: 'business_name') this.businessName, @JsonKey(name: 'phone_number') this.phoneNumber, @JsonKey(name: 'license_number') this.licenseNumber, @JsonKey(name: 'pickup_date') this.pickupDate, @JsonKey(name: 'date_of_birth') this.dateOfBirth, @JsonKey(name: 'pickup_address') this.pickupAddress, @JsonKey(name: 'residential_address') this.residentialAddress, @JsonKey(name: 'same_pickup_address') this.samePickupAddress, @JsonKey(name: 'vehicle_condition') this.vehicleCondition, this.note, this.price, @JsonKey(name: 'payment_method') this.paymentMethod, @JsonKey(name: 'owner_signature_url') this.ownerSignatureUrl, @JsonKey(name: 'buyer_signature_url') this.buyerSignatureUrl, this.status, this.approval, @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'updated_at') this.updatedAt, this.brand, this.model}): super._();
  factory _VehicleModel.fromJson(Map<String, dynamic> json) => _$VehicleModelFromJson(json);

@override final  int id;
@override@JsonKey(name: 'user_id') final  int? userId;
@override@JsonKey(name: 'driver_id') final  int? driverId;
@override@JsonKey(name: 'brand_id') final  int? brandId;
@override@JsonKey(name: 'model_id') final  int? modelId;
@override final  dynamic year;
@override@JsonKey(name: 'registration_number') final  String? registrationNumber;
@override@JsonKey(name: 'registration_date') final  String? registrationDate;
@override@JsonKey(name: 'registration_state') final  String? registrationState;
@override@JsonKey(name: 'engine_size') final  String? engineSize;
@override@JsonKey(name: 'engine_number') final  String? engineNumber;
@override@JsonKey(name: 'vin_number') final  String? vinNumber;
@override final  String? transmission;
@override@JsonKey(name: 'body_type') final  String? bodyType;
@override final  String? variant;
@override final  String? built;
@override final  String? odometer;
@override@JsonKey(name: 'first_name') final  String? firstName;
@override@JsonKey(name: 'last_name') final  String? lastName;
@override final  String? fullname;
@override@JsonKey(name: 'abn_number') final  String? abnNumber;
@override@JsonKey(name: 'business_name') final  String? businessName;
@override@JsonKey(name: 'phone_number') final  String? phoneNumber;
@override@JsonKey(name: 'license_number') final  String? licenseNumber;
@override@JsonKey(name: 'pickup_date') final  String? pickupDate;
@override@JsonKey(name: 'date_of_birth') final  String? dateOfBirth;
@override@JsonKey(name: 'pickup_address') final  String? pickupAddress;
@override@JsonKey(name: 'residential_address') final  String? residentialAddress;
@override@JsonKey(name: 'same_pickup_address') final  dynamic samePickupAddress;
@override@JsonKey(name: 'vehicle_condition') final  VehicleConditionModel? vehicleCondition;
@override final  String? note;
@override final  dynamic price;
@override@JsonKey(name: 'payment_method') final  String? paymentMethod;
@override@JsonKey(name: 'owner_signature_url') final  String? ownerSignatureUrl;
@override@JsonKey(name: 'buyer_signature_url') final  String? buyerSignatureUrl;
@override final  String? status;
@override final  dynamic approval;
@override@JsonKey(name: 'created_at') final  String? createdAt;
@override@JsonKey(name: 'updated_at') final  String? updatedAt;
@override final  BrandModel? brand;
@override final  VehicleModelOption? model;

/// Create a copy of VehicleModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VehicleModelCopyWith<_VehicleModel> get copyWith => __$VehicleModelCopyWithImpl<_VehicleModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VehicleModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VehicleModel&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.driverId, driverId) || other.driverId == driverId)&&(identical(other.brandId, brandId) || other.brandId == brandId)&&(identical(other.modelId, modelId) || other.modelId == modelId)&&const DeepCollectionEquality().equals(other.year, year)&&(identical(other.registrationNumber, registrationNumber) || other.registrationNumber == registrationNumber)&&(identical(other.registrationDate, registrationDate) || other.registrationDate == registrationDate)&&(identical(other.registrationState, registrationState) || other.registrationState == registrationState)&&(identical(other.engineSize, engineSize) || other.engineSize == engineSize)&&(identical(other.engineNumber, engineNumber) || other.engineNumber == engineNumber)&&(identical(other.vinNumber, vinNumber) || other.vinNumber == vinNumber)&&(identical(other.transmission, transmission) || other.transmission == transmission)&&(identical(other.bodyType, bodyType) || other.bodyType == bodyType)&&(identical(other.variant, variant) || other.variant == variant)&&(identical(other.built, built) || other.built == built)&&(identical(other.odometer, odometer) || other.odometer == odometer)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.fullname, fullname) || other.fullname == fullname)&&(identical(other.abnNumber, abnNumber) || other.abnNumber == abnNumber)&&(identical(other.businessName, businessName) || other.businessName == businessName)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.licenseNumber, licenseNumber) || other.licenseNumber == licenseNumber)&&(identical(other.pickupDate, pickupDate) || other.pickupDate == pickupDate)&&(identical(other.dateOfBirth, dateOfBirth) || other.dateOfBirth == dateOfBirth)&&(identical(other.pickupAddress, pickupAddress) || other.pickupAddress == pickupAddress)&&(identical(other.residentialAddress, residentialAddress) || other.residentialAddress == residentialAddress)&&const DeepCollectionEquality().equals(other.samePickupAddress, samePickupAddress)&&(identical(other.vehicleCondition, vehicleCondition) || other.vehicleCondition == vehicleCondition)&&(identical(other.note, note) || other.note == note)&&const DeepCollectionEquality().equals(other.price, price)&&(identical(other.paymentMethod, paymentMethod) || other.paymentMethod == paymentMethod)&&(identical(other.ownerSignatureUrl, ownerSignatureUrl) || other.ownerSignatureUrl == ownerSignatureUrl)&&(identical(other.buyerSignatureUrl, buyerSignatureUrl) || other.buyerSignatureUrl == buyerSignatureUrl)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.approval, approval)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.brand, brand) || other.brand == brand)&&(identical(other.model, model) || other.model == model));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,userId,driverId,brandId,modelId,const DeepCollectionEquality().hash(year),registrationNumber,registrationDate,registrationState,engineSize,engineNumber,vinNumber,transmission,bodyType,variant,built,odometer,firstName,lastName,fullname,abnNumber,businessName,phoneNumber,licenseNumber,pickupDate,dateOfBirth,pickupAddress,residentialAddress,const DeepCollectionEquality().hash(samePickupAddress),vehicleCondition,note,const DeepCollectionEquality().hash(price),paymentMethod,ownerSignatureUrl,buyerSignatureUrl,status,const DeepCollectionEquality().hash(approval),createdAt,updatedAt,brand,model]);

@override
String toString() {
  return 'VehicleModel(id: $id, userId: $userId, driverId: $driverId, brandId: $brandId, modelId: $modelId, year: $year, registrationNumber: $registrationNumber, registrationDate: $registrationDate, registrationState: $registrationState, engineSize: $engineSize, engineNumber: $engineNumber, vinNumber: $vinNumber, transmission: $transmission, bodyType: $bodyType, variant: $variant, built: $built, odometer: $odometer, firstName: $firstName, lastName: $lastName, fullname: $fullname, abnNumber: $abnNumber, businessName: $businessName, phoneNumber: $phoneNumber, licenseNumber: $licenseNumber, pickupDate: $pickupDate, dateOfBirth: $dateOfBirth, pickupAddress: $pickupAddress, residentialAddress: $residentialAddress, samePickupAddress: $samePickupAddress, vehicleCondition: $vehicleCondition, note: $note, price: $price, paymentMethod: $paymentMethod, ownerSignatureUrl: $ownerSignatureUrl, buyerSignatureUrl: $buyerSignatureUrl, status: $status, approval: $approval, createdAt: $createdAt, updatedAt: $updatedAt, brand: $brand, model: $model)';
}


}

/// @nodoc
abstract mixin class _$VehicleModelCopyWith<$Res> implements $VehicleModelCopyWith<$Res> {
  factory _$VehicleModelCopyWith(_VehicleModel value, $Res Function(_VehicleModel) _then) = __$VehicleModelCopyWithImpl;
@override @useResult
$Res call({
 int id,@JsonKey(name: 'user_id') int? userId,@JsonKey(name: 'driver_id') int? driverId,@JsonKey(name: 'brand_id') int? brandId,@JsonKey(name: 'model_id') int? modelId, dynamic year,@JsonKey(name: 'registration_number') String? registrationNumber,@JsonKey(name: 'registration_date') String? registrationDate,@JsonKey(name: 'registration_state') String? registrationState,@JsonKey(name: 'engine_size') String? engineSize,@JsonKey(name: 'engine_number') String? engineNumber,@JsonKey(name: 'vin_number') String? vinNumber, String? transmission,@JsonKey(name: 'body_type') String? bodyType, String? variant, String? built, String? odometer,@JsonKey(name: 'first_name') String? firstName,@JsonKey(name: 'last_name') String? lastName, String? fullname,@JsonKey(name: 'abn_number') String? abnNumber,@JsonKey(name: 'business_name') String? businessName,@JsonKey(name: 'phone_number') String? phoneNumber,@JsonKey(name: 'license_number') String? licenseNumber,@JsonKey(name: 'pickup_date') String? pickupDate,@JsonKey(name: 'date_of_birth') String? dateOfBirth,@JsonKey(name: 'pickup_address') String? pickupAddress,@JsonKey(name: 'residential_address') String? residentialAddress,@JsonKey(name: 'same_pickup_address') dynamic samePickupAddress,@JsonKey(name: 'vehicle_condition') VehicleConditionModel? vehicleCondition, String? note, dynamic price,@JsonKey(name: 'payment_method') String? paymentMethod,@JsonKey(name: 'owner_signature_url') String? ownerSignatureUrl,@JsonKey(name: 'buyer_signature_url') String? buyerSignatureUrl, String? status, dynamic approval,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'updated_at') String? updatedAt, BrandModel? brand, VehicleModelOption? model
});


@override $VehicleConditionModelCopyWith<$Res>? get vehicleCondition;@override $BrandModelCopyWith<$Res>? get brand;@override $VehicleModelOptionCopyWith<$Res>? get model;

}
/// @nodoc
class __$VehicleModelCopyWithImpl<$Res>
    implements _$VehicleModelCopyWith<$Res> {
  __$VehicleModelCopyWithImpl(this._self, this._then);

  final _VehicleModel _self;
  final $Res Function(_VehicleModel) _then;

/// Create a copy of VehicleModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = freezed,Object? driverId = freezed,Object? brandId = freezed,Object? modelId = freezed,Object? year = freezed,Object? registrationNumber = freezed,Object? registrationDate = freezed,Object? registrationState = freezed,Object? engineSize = freezed,Object? engineNumber = freezed,Object? vinNumber = freezed,Object? transmission = freezed,Object? bodyType = freezed,Object? variant = freezed,Object? built = freezed,Object? odometer = freezed,Object? firstName = freezed,Object? lastName = freezed,Object? fullname = freezed,Object? abnNumber = freezed,Object? businessName = freezed,Object? phoneNumber = freezed,Object? licenseNumber = freezed,Object? pickupDate = freezed,Object? dateOfBirth = freezed,Object? pickupAddress = freezed,Object? residentialAddress = freezed,Object? samePickupAddress = freezed,Object? vehicleCondition = freezed,Object? note = freezed,Object? price = freezed,Object? paymentMethod = freezed,Object? ownerSignatureUrl = freezed,Object? buyerSignatureUrl = freezed,Object? status = freezed,Object? approval = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? brand = freezed,Object? model = freezed,}) {
  return _then(_VehicleModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int?,driverId: freezed == driverId ? _self.driverId : driverId // ignore: cast_nullable_to_non_nullable
as int?,brandId: freezed == brandId ? _self.brandId : brandId // ignore: cast_nullable_to_non_nullable
as int?,modelId: freezed == modelId ? _self.modelId : modelId // ignore: cast_nullable_to_non_nullable
as int?,year: freezed == year ? _self.year : year // ignore: cast_nullable_to_non_nullable
as dynamic,registrationNumber: freezed == registrationNumber ? _self.registrationNumber : registrationNumber // ignore: cast_nullable_to_non_nullable
as String?,registrationDate: freezed == registrationDate ? _self.registrationDate : registrationDate // ignore: cast_nullable_to_non_nullable
as String?,registrationState: freezed == registrationState ? _self.registrationState : registrationState // ignore: cast_nullable_to_non_nullable
as String?,engineSize: freezed == engineSize ? _self.engineSize : engineSize // ignore: cast_nullable_to_non_nullable
as String?,engineNumber: freezed == engineNumber ? _self.engineNumber : engineNumber // ignore: cast_nullable_to_non_nullable
as String?,vinNumber: freezed == vinNumber ? _self.vinNumber : vinNumber // ignore: cast_nullable_to_non_nullable
as String?,transmission: freezed == transmission ? _self.transmission : transmission // ignore: cast_nullable_to_non_nullable
as String?,bodyType: freezed == bodyType ? _self.bodyType : bodyType // ignore: cast_nullable_to_non_nullable
as String?,variant: freezed == variant ? _self.variant : variant // ignore: cast_nullable_to_non_nullable
as String?,built: freezed == built ? _self.built : built // ignore: cast_nullable_to_non_nullable
as String?,odometer: freezed == odometer ? _self.odometer : odometer // ignore: cast_nullable_to_non_nullable
as String?,firstName: freezed == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String?,lastName: freezed == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String?,fullname: freezed == fullname ? _self.fullname : fullname // ignore: cast_nullable_to_non_nullable
as String?,abnNumber: freezed == abnNumber ? _self.abnNumber : abnNumber // ignore: cast_nullable_to_non_nullable
as String?,businessName: freezed == businessName ? _self.businessName : businessName // ignore: cast_nullable_to_non_nullable
as String?,phoneNumber: freezed == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String?,licenseNumber: freezed == licenseNumber ? _self.licenseNumber : licenseNumber // ignore: cast_nullable_to_non_nullable
as String?,pickupDate: freezed == pickupDate ? _self.pickupDate : pickupDate // ignore: cast_nullable_to_non_nullable
as String?,dateOfBirth: freezed == dateOfBirth ? _self.dateOfBirth : dateOfBirth // ignore: cast_nullable_to_non_nullable
as String?,pickupAddress: freezed == pickupAddress ? _self.pickupAddress : pickupAddress // ignore: cast_nullable_to_non_nullable
as String?,residentialAddress: freezed == residentialAddress ? _self.residentialAddress : residentialAddress // ignore: cast_nullable_to_non_nullable
as String?,samePickupAddress: freezed == samePickupAddress ? _self.samePickupAddress : samePickupAddress // ignore: cast_nullable_to_non_nullable
as dynamic,vehicleCondition: freezed == vehicleCondition ? _self.vehicleCondition : vehicleCondition // ignore: cast_nullable_to_non_nullable
as VehicleConditionModel?,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,price: freezed == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as dynamic,paymentMethod: freezed == paymentMethod ? _self.paymentMethod : paymentMethod // ignore: cast_nullable_to_non_nullable
as String?,ownerSignatureUrl: freezed == ownerSignatureUrl ? _self.ownerSignatureUrl : ownerSignatureUrl // ignore: cast_nullable_to_non_nullable
as String?,buyerSignatureUrl: freezed == buyerSignatureUrl ? _self.buyerSignatureUrl : buyerSignatureUrl // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,approval: freezed == approval ? _self.approval : approval // ignore: cast_nullable_to_non_nullable
as dynamic,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,brand: freezed == brand ? _self.brand : brand // ignore: cast_nullable_to_non_nullable
as BrandModel?,model: freezed == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as VehicleModelOption?,
  ));
}

/// Create a copy of VehicleModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VehicleConditionModelCopyWith<$Res>? get vehicleCondition {
    if (_self.vehicleCondition == null) {
    return null;
  }

  return $VehicleConditionModelCopyWith<$Res>(_self.vehicleCondition!, (value) {
    return _then(_self.copyWith(vehicleCondition: value));
  });
}/// Create a copy of VehicleModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BrandModelCopyWith<$Res>? get brand {
    if (_self.brand == null) {
    return null;
  }

  return $BrandModelCopyWith<$Res>(_self.brand!, (value) {
    return _then(_self.copyWith(brand: value));
  });
}/// Create a copy of VehicleModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VehicleModelOptionCopyWith<$Res>? get model {
    if (_self.model == null) {
    return null;
  }

  return $VehicleModelOptionCopyWith<$Res>(_self.model!, (value) {
    return _then(_self.copyWith(model: value));
  });
}
}

// dart format on
