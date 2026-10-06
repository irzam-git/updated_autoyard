// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'assigned_pickup_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AssignedPickupModel {

 int get id;@JsonKey(name: 'user_id') int? get userId;@JsonKey(name: 'driver_id') int? get driverId;@JsonKey(name: 'brand_id') int? get brandId;@JsonKey(name: 'model_id') int? get modelId;@JsonKey(name: 'customer_name') String? get customerName;@JsonKey(name: 'phone_number') String? get phoneNumber; String? get address; dynamic get year;@JsonKey(name: 'pickup_date') String? get pickupDate;@JsonKey(name: 'pickup_time') String? get pickupTime; dynamic get price;@JsonKey(name: 'payment_method') String? get paymentMethod; String? get note; String get status;@JsonKey(name: 'created_at') String? get createdAt;@JsonKey(name: 'updated_at') String? get updatedAt;@JsonKey(name: 'customer_info') CustomerInfoModel? get customerInfo; BrandModel? get brand; VehicleModelOption? get model;
/// Create a copy of AssignedPickupModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AssignedPickupModelCopyWith<AssignedPickupModel> get copyWith => _$AssignedPickupModelCopyWithImpl<AssignedPickupModel>(this as AssignedPickupModel, _$identity);

  /// Serializes this AssignedPickupModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AssignedPickupModel&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.driverId, driverId) || other.driverId == driverId)&&(identical(other.brandId, brandId) || other.brandId == brandId)&&(identical(other.modelId, modelId) || other.modelId == modelId)&&(identical(other.customerName, customerName) || other.customerName == customerName)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.address, address) || other.address == address)&&const DeepCollectionEquality().equals(other.year, year)&&(identical(other.pickupDate, pickupDate) || other.pickupDate == pickupDate)&&(identical(other.pickupTime, pickupTime) || other.pickupTime == pickupTime)&&const DeepCollectionEquality().equals(other.price, price)&&(identical(other.paymentMethod, paymentMethod) || other.paymentMethod == paymentMethod)&&(identical(other.note, note) || other.note == note)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.customerInfo, customerInfo) || other.customerInfo == customerInfo)&&(identical(other.brand, brand) || other.brand == brand)&&(identical(other.model, model) || other.model == model));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,userId,driverId,brandId,modelId,customerName,phoneNumber,address,const DeepCollectionEquality().hash(year),pickupDate,pickupTime,const DeepCollectionEquality().hash(price),paymentMethod,note,status,createdAt,updatedAt,customerInfo,brand,model]);

@override
String toString() {
  return 'AssignedPickupModel(id: $id, userId: $userId, driverId: $driverId, brandId: $brandId, modelId: $modelId, customerName: $customerName, phoneNumber: $phoneNumber, address: $address, year: $year, pickupDate: $pickupDate, pickupTime: $pickupTime, price: $price, paymentMethod: $paymentMethod, note: $note, status: $status, createdAt: $createdAt, updatedAt: $updatedAt, customerInfo: $customerInfo, brand: $brand, model: $model)';
}


}

/// @nodoc
abstract mixin class $AssignedPickupModelCopyWith<$Res>  {
  factory $AssignedPickupModelCopyWith(AssignedPickupModel value, $Res Function(AssignedPickupModel) _then) = _$AssignedPickupModelCopyWithImpl;
@useResult
$Res call({
 int id,@JsonKey(name: 'user_id') int? userId,@JsonKey(name: 'driver_id') int? driverId,@JsonKey(name: 'brand_id') int? brandId,@JsonKey(name: 'model_id') int? modelId,@JsonKey(name: 'customer_name') String? customerName,@JsonKey(name: 'phone_number') String? phoneNumber, String? address, dynamic year,@JsonKey(name: 'pickup_date') String? pickupDate,@JsonKey(name: 'pickup_time') String? pickupTime, dynamic price,@JsonKey(name: 'payment_method') String? paymentMethod, String? note, String status,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'updated_at') String? updatedAt,@JsonKey(name: 'customer_info') CustomerInfoModel? customerInfo, BrandModel? brand, VehicleModelOption? model
});


$CustomerInfoModelCopyWith<$Res>? get customerInfo;$BrandModelCopyWith<$Res>? get brand;$VehicleModelOptionCopyWith<$Res>? get model;

}
/// @nodoc
class _$AssignedPickupModelCopyWithImpl<$Res>
    implements $AssignedPickupModelCopyWith<$Res> {
  _$AssignedPickupModelCopyWithImpl(this._self, this._then);

  final AssignedPickupModel _self;
  final $Res Function(AssignedPickupModel) _then;

/// Create a copy of AssignedPickupModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = freezed,Object? driverId = freezed,Object? brandId = freezed,Object? modelId = freezed,Object? customerName = freezed,Object? phoneNumber = freezed,Object? address = freezed,Object? year = freezed,Object? pickupDate = freezed,Object? pickupTime = freezed,Object? price = freezed,Object? paymentMethod = freezed,Object? note = freezed,Object? status = null,Object? createdAt = freezed,Object? updatedAt = freezed,Object? customerInfo = freezed,Object? brand = freezed,Object? model = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int?,driverId: freezed == driverId ? _self.driverId : driverId // ignore: cast_nullable_to_non_nullable
as int?,brandId: freezed == brandId ? _self.brandId : brandId // ignore: cast_nullable_to_non_nullable
as int?,modelId: freezed == modelId ? _self.modelId : modelId // ignore: cast_nullable_to_non_nullable
as int?,customerName: freezed == customerName ? _self.customerName : customerName // ignore: cast_nullable_to_non_nullable
as String?,phoneNumber: freezed == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,year: freezed == year ? _self.year : year // ignore: cast_nullable_to_non_nullable
as dynamic,pickupDate: freezed == pickupDate ? _self.pickupDate : pickupDate // ignore: cast_nullable_to_non_nullable
as String?,pickupTime: freezed == pickupTime ? _self.pickupTime : pickupTime // ignore: cast_nullable_to_non_nullable
as String?,price: freezed == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as dynamic,paymentMethod: freezed == paymentMethod ? _self.paymentMethod : paymentMethod // ignore: cast_nullable_to_non_nullable
as String?,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,customerInfo: freezed == customerInfo ? _self.customerInfo : customerInfo // ignore: cast_nullable_to_non_nullable
as CustomerInfoModel?,brand: freezed == brand ? _self.brand : brand // ignore: cast_nullable_to_non_nullable
as BrandModel?,model: freezed == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as VehicleModelOption?,
  ));
}
/// Create a copy of AssignedPickupModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CustomerInfoModelCopyWith<$Res>? get customerInfo {
    if (_self.customerInfo == null) {
    return null;
  }

  return $CustomerInfoModelCopyWith<$Res>(_self.customerInfo!, (value) {
    return _then(_self.copyWith(customerInfo: value));
  });
}/// Create a copy of AssignedPickupModel
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
}/// Create a copy of AssignedPickupModel
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


/// Adds pattern-matching-related methods to [AssignedPickupModel].
extension AssignedPickupModelPatterns on AssignedPickupModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AssignedPickupModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AssignedPickupModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AssignedPickupModel value)  $default,){
final _that = this;
switch (_that) {
case _AssignedPickupModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AssignedPickupModel value)?  $default,){
final _that = this;
switch (_that) {
case _AssignedPickupModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'user_id')  int? userId, @JsonKey(name: 'driver_id')  int? driverId, @JsonKey(name: 'brand_id')  int? brandId, @JsonKey(name: 'model_id')  int? modelId, @JsonKey(name: 'customer_name')  String? customerName, @JsonKey(name: 'phone_number')  String? phoneNumber,  String? address,  dynamic year, @JsonKey(name: 'pickup_date')  String? pickupDate, @JsonKey(name: 'pickup_time')  String? pickupTime,  dynamic price, @JsonKey(name: 'payment_method')  String? paymentMethod,  String? note,  String status, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt, @JsonKey(name: 'customer_info')  CustomerInfoModel? customerInfo,  BrandModel? brand,  VehicleModelOption? model)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AssignedPickupModel() when $default != null:
return $default(_that.id,_that.userId,_that.driverId,_that.brandId,_that.modelId,_that.customerName,_that.phoneNumber,_that.address,_that.year,_that.pickupDate,_that.pickupTime,_that.price,_that.paymentMethod,_that.note,_that.status,_that.createdAt,_that.updatedAt,_that.customerInfo,_that.brand,_that.model);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'user_id')  int? userId, @JsonKey(name: 'driver_id')  int? driverId, @JsonKey(name: 'brand_id')  int? brandId, @JsonKey(name: 'model_id')  int? modelId, @JsonKey(name: 'customer_name')  String? customerName, @JsonKey(name: 'phone_number')  String? phoneNumber,  String? address,  dynamic year, @JsonKey(name: 'pickup_date')  String? pickupDate, @JsonKey(name: 'pickup_time')  String? pickupTime,  dynamic price, @JsonKey(name: 'payment_method')  String? paymentMethod,  String? note,  String status, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt, @JsonKey(name: 'customer_info')  CustomerInfoModel? customerInfo,  BrandModel? brand,  VehicleModelOption? model)  $default,) {final _that = this;
switch (_that) {
case _AssignedPickupModel():
return $default(_that.id,_that.userId,_that.driverId,_that.brandId,_that.modelId,_that.customerName,_that.phoneNumber,_that.address,_that.year,_that.pickupDate,_that.pickupTime,_that.price,_that.paymentMethod,_that.note,_that.status,_that.createdAt,_that.updatedAt,_that.customerInfo,_that.brand,_that.model);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id, @JsonKey(name: 'user_id')  int? userId, @JsonKey(name: 'driver_id')  int? driverId, @JsonKey(name: 'brand_id')  int? brandId, @JsonKey(name: 'model_id')  int? modelId, @JsonKey(name: 'customer_name')  String? customerName, @JsonKey(name: 'phone_number')  String? phoneNumber,  String? address,  dynamic year, @JsonKey(name: 'pickup_date')  String? pickupDate, @JsonKey(name: 'pickup_time')  String? pickupTime,  dynamic price, @JsonKey(name: 'payment_method')  String? paymentMethod,  String? note,  String status, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt, @JsonKey(name: 'customer_info')  CustomerInfoModel? customerInfo,  BrandModel? brand,  VehicleModelOption? model)?  $default,) {final _that = this;
switch (_that) {
case _AssignedPickupModel() when $default != null:
return $default(_that.id,_that.userId,_that.driverId,_that.brandId,_that.modelId,_that.customerName,_that.phoneNumber,_that.address,_that.year,_that.pickupDate,_that.pickupTime,_that.price,_that.paymentMethod,_that.note,_that.status,_that.createdAt,_that.updatedAt,_that.customerInfo,_that.brand,_that.model);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AssignedPickupModel extends AssignedPickupModel {
  const _AssignedPickupModel({required this.id, @JsonKey(name: 'user_id') this.userId, @JsonKey(name: 'driver_id') this.driverId, @JsonKey(name: 'brand_id') this.brandId, @JsonKey(name: 'model_id') this.modelId, @JsonKey(name: 'customer_name') this.customerName, @JsonKey(name: 'phone_number') this.phoneNumber, this.address, this.year, @JsonKey(name: 'pickup_date') this.pickupDate, @JsonKey(name: 'pickup_time') this.pickupTime, this.price, @JsonKey(name: 'payment_method') this.paymentMethod, this.note, this.status = 'pending', @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'updated_at') this.updatedAt, @JsonKey(name: 'customer_info') this.customerInfo, this.brand, this.model}): super._();
  factory _AssignedPickupModel.fromJson(Map<String, dynamic> json) => _$AssignedPickupModelFromJson(json);

@override final  int id;
@override@JsonKey(name: 'user_id') final  int? userId;
@override@JsonKey(name: 'driver_id') final  int? driverId;
@override@JsonKey(name: 'brand_id') final  int? brandId;
@override@JsonKey(name: 'model_id') final  int? modelId;
@override@JsonKey(name: 'customer_name') final  String? customerName;
@override@JsonKey(name: 'phone_number') final  String? phoneNumber;
@override final  String? address;
@override final  dynamic year;
@override@JsonKey(name: 'pickup_date') final  String? pickupDate;
@override@JsonKey(name: 'pickup_time') final  String? pickupTime;
@override final  dynamic price;
@override@JsonKey(name: 'payment_method') final  String? paymentMethod;
@override final  String? note;
@override@JsonKey() final  String status;
@override@JsonKey(name: 'created_at') final  String? createdAt;
@override@JsonKey(name: 'updated_at') final  String? updatedAt;
@override@JsonKey(name: 'customer_info') final  CustomerInfoModel? customerInfo;
@override final  BrandModel? brand;
@override final  VehicleModelOption? model;

/// Create a copy of AssignedPickupModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AssignedPickupModelCopyWith<_AssignedPickupModel> get copyWith => __$AssignedPickupModelCopyWithImpl<_AssignedPickupModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AssignedPickupModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AssignedPickupModel&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.driverId, driverId) || other.driverId == driverId)&&(identical(other.brandId, brandId) || other.brandId == brandId)&&(identical(other.modelId, modelId) || other.modelId == modelId)&&(identical(other.customerName, customerName) || other.customerName == customerName)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.address, address) || other.address == address)&&const DeepCollectionEquality().equals(other.year, year)&&(identical(other.pickupDate, pickupDate) || other.pickupDate == pickupDate)&&(identical(other.pickupTime, pickupTime) || other.pickupTime == pickupTime)&&const DeepCollectionEquality().equals(other.price, price)&&(identical(other.paymentMethod, paymentMethod) || other.paymentMethod == paymentMethod)&&(identical(other.note, note) || other.note == note)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.customerInfo, customerInfo) || other.customerInfo == customerInfo)&&(identical(other.brand, brand) || other.brand == brand)&&(identical(other.model, model) || other.model == model));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,userId,driverId,brandId,modelId,customerName,phoneNumber,address,const DeepCollectionEquality().hash(year),pickupDate,pickupTime,const DeepCollectionEquality().hash(price),paymentMethod,note,status,createdAt,updatedAt,customerInfo,brand,model]);

@override
String toString() {
  return 'AssignedPickupModel(id: $id, userId: $userId, driverId: $driverId, brandId: $brandId, modelId: $modelId, customerName: $customerName, phoneNumber: $phoneNumber, address: $address, year: $year, pickupDate: $pickupDate, pickupTime: $pickupTime, price: $price, paymentMethod: $paymentMethod, note: $note, status: $status, createdAt: $createdAt, updatedAt: $updatedAt, customerInfo: $customerInfo, brand: $brand, model: $model)';
}


}

/// @nodoc
abstract mixin class _$AssignedPickupModelCopyWith<$Res> implements $AssignedPickupModelCopyWith<$Res> {
  factory _$AssignedPickupModelCopyWith(_AssignedPickupModel value, $Res Function(_AssignedPickupModel) _then) = __$AssignedPickupModelCopyWithImpl;
@override @useResult
$Res call({
 int id,@JsonKey(name: 'user_id') int? userId,@JsonKey(name: 'driver_id') int? driverId,@JsonKey(name: 'brand_id') int? brandId,@JsonKey(name: 'model_id') int? modelId,@JsonKey(name: 'customer_name') String? customerName,@JsonKey(name: 'phone_number') String? phoneNumber, String? address, dynamic year,@JsonKey(name: 'pickup_date') String? pickupDate,@JsonKey(name: 'pickup_time') String? pickupTime, dynamic price,@JsonKey(name: 'payment_method') String? paymentMethod, String? note, String status,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'updated_at') String? updatedAt,@JsonKey(name: 'customer_info') CustomerInfoModel? customerInfo, BrandModel? brand, VehicleModelOption? model
});


@override $CustomerInfoModelCopyWith<$Res>? get customerInfo;@override $BrandModelCopyWith<$Res>? get brand;@override $VehicleModelOptionCopyWith<$Res>? get model;

}
/// @nodoc
class __$AssignedPickupModelCopyWithImpl<$Res>
    implements _$AssignedPickupModelCopyWith<$Res> {
  __$AssignedPickupModelCopyWithImpl(this._self, this._then);

  final _AssignedPickupModel _self;
  final $Res Function(_AssignedPickupModel) _then;

/// Create a copy of AssignedPickupModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = freezed,Object? driverId = freezed,Object? brandId = freezed,Object? modelId = freezed,Object? customerName = freezed,Object? phoneNumber = freezed,Object? address = freezed,Object? year = freezed,Object? pickupDate = freezed,Object? pickupTime = freezed,Object? price = freezed,Object? paymentMethod = freezed,Object? note = freezed,Object? status = null,Object? createdAt = freezed,Object? updatedAt = freezed,Object? customerInfo = freezed,Object? brand = freezed,Object? model = freezed,}) {
  return _then(_AssignedPickupModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int?,driverId: freezed == driverId ? _self.driverId : driverId // ignore: cast_nullable_to_non_nullable
as int?,brandId: freezed == brandId ? _self.brandId : brandId // ignore: cast_nullable_to_non_nullable
as int?,modelId: freezed == modelId ? _self.modelId : modelId // ignore: cast_nullable_to_non_nullable
as int?,customerName: freezed == customerName ? _self.customerName : customerName // ignore: cast_nullable_to_non_nullable
as String?,phoneNumber: freezed == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,year: freezed == year ? _self.year : year // ignore: cast_nullable_to_non_nullable
as dynamic,pickupDate: freezed == pickupDate ? _self.pickupDate : pickupDate // ignore: cast_nullable_to_non_nullable
as String?,pickupTime: freezed == pickupTime ? _self.pickupTime : pickupTime // ignore: cast_nullable_to_non_nullable
as String?,price: freezed == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as dynamic,paymentMethod: freezed == paymentMethod ? _self.paymentMethod : paymentMethod // ignore: cast_nullable_to_non_nullable
as String?,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,customerInfo: freezed == customerInfo ? _self.customerInfo : customerInfo // ignore: cast_nullable_to_non_nullable
as CustomerInfoModel?,brand: freezed == brand ? _self.brand : brand // ignore: cast_nullable_to_non_nullable
as BrandModel?,model: freezed == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as VehicleModelOption?,
  ));
}

/// Create a copy of AssignedPickupModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CustomerInfoModelCopyWith<$Res>? get customerInfo {
    if (_self.customerInfo == null) {
    return null;
  }

  return $CustomerInfoModelCopyWith<$Res>(_self.customerInfo!, (value) {
    return _then(_self.copyWith(customerInfo: value));
  });
}/// Create a copy of AssignedPickupModel
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
}/// Create a copy of AssignedPickupModel
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
