// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'driver_parent_details_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DriverParentDetailsModel {

 int? get id;@JsonKey(name: 'user_id') int? get userId;@JsonKey(name: 'company_name') String? get companyName;@JsonKey(name: 'business_name') String? get businessName;@JsonKey(name: 'business_address') String? get businessAddress;@JsonKey(name: 'business_email') String? get businessEmail;@JsonKey(name: 'abn_number') String? get abnNumber;@JsonKey(name: 'crn_number') String? get crnNumber;@JsonKey(name: 'business_license') String? get businessLicense; String? get website;@JsonKey(name: 'activation_key') String? get activationKey; String? get status;@JsonKey(name: 'business_logo_url') String? get businessLogoUrl;
/// Create a copy of DriverParentDetailsModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DriverParentDetailsModelCopyWith<DriverParentDetailsModel> get copyWith => _$DriverParentDetailsModelCopyWithImpl<DriverParentDetailsModel>(this as DriverParentDetailsModel, _$identity);

  /// Serializes this DriverParentDetailsModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DriverParentDetailsModel&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.companyName, companyName) || other.companyName == companyName)&&(identical(other.businessName, businessName) || other.businessName == businessName)&&(identical(other.businessAddress, businessAddress) || other.businessAddress == businessAddress)&&(identical(other.businessEmail, businessEmail) || other.businessEmail == businessEmail)&&(identical(other.abnNumber, abnNumber) || other.abnNumber == abnNumber)&&(identical(other.crnNumber, crnNumber) || other.crnNumber == crnNumber)&&(identical(other.businessLicense, businessLicense) || other.businessLicense == businessLicense)&&(identical(other.website, website) || other.website == website)&&(identical(other.activationKey, activationKey) || other.activationKey == activationKey)&&(identical(other.status, status) || other.status == status)&&(identical(other.businessLogoUrl, businessLogoUrl) || other.businessLogoUrl == businessLogoUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,companyName,businessName,businessAddress,businessEmail,abnNumber,crnNumber,businessLicense,website,activationKey,status,businessLogoUrl);

@override
String toString() {
  return 'DriverParentDetailsModel(id: $id, userId: $userId, companyName: $companyName, businessName: $businessName, businessAddress: $businessAddress, businessEmail: $businessEmail, abnNumber: $abnNumber, crnNumber: $crnNumber, businessLicense: $businessLicense, website: $website, activationKey: $activationKey, status: $status, businessLogoUrl: $businessLogoUrl)';
}


}

/// @nodoc
abstract mixin class $DriverParentDetailsModelCopyWith<$Res>  {
  factory $DriverParentDetailsModelCopyWith(DriverParentDetailsModel value, $Res Function(DriverParentDetailsModel) _then) = _$DriverParentDetailsModelCopyWithImpl;
@useResult
$Res call({
 int? id,@JsonKey(name: 'user_id') int? userId,@JsonKey(name: 'company_name') String? companyName,@JsonKey(name: 'business_name') String? businessName,@JsonKey(name: 'business_address') String? businessAddress,@JsonKey(name: 'business_email') String? businessEmail,@JsonKey(name: 'abn_number') String? abnNumber,@JsonKey(name: 'crn_number') String? crnNumber,@JsonKey(name: 'business_license') String? businessLicense, String? website,@JsonKey(name: 'activation_key') String? activationKey, String? status,@JsonKey(name: 'business_logo_url') String? businessLogoUrl
});




}
/// @nodoc
class _$DriverParentDetailsModelCopyWithImpl<$Res>
    implements $DriverParentDetailsModelCopyWith<$Res> {
  _$DriverParentDetailsModelCopyWithImpl(this._self, this._then);

  final DriverParentDetailsModel _self;
  final $Res Function(DriverParentDetailsModel) _then;

/// Create a copy of DriverParentDetailsModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? userId = freezed,Object? companyName = freezed,Object? businessName = freezed,Object? businessAddress = freezed,Object? businessEmail = freezed,Object? abnNumber = freezed,Object? crnNumber = freezed,Object? businessLicense = freezed,Object? website = freezed,Object? activationKey = freezed,Object? status = freezed,Object? businessLogoUrl = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int?,companyName: freezed == companyName ? _self.companyName : companyName // ignore: cast_nullable_to_non_nullable
as String?,businessName: freezed == businessName ? _self.businessName : businessName // ignore: cast_nullable_to_non_nullable
as String?,businessAddress: freezed == businessAddress ? _self.businessAddress : businessAddress // ignore: cast_nullable_to_non_nullable
as String?,businessEmail: freezed == businessEmail ? _self.businessEmail : businessEmail // ignore: cast_nullable_to_non_nullable
as String?,abnNumber: freezed == abnNumber ? _self.abnNumber : abnNumber // ignore: cast_nullable_to_non_nullable
as String?,crnNumber: freezed == crnNumber ? _self.crnNumber : crnNumber // ignore: cast_nullable_to_non_nullable
as String?,businessLicense: freezed == businessLicense ? _self.businessLicense : businessLicense // ignore: cast_nullable_to_non_nullable
as String?,website: freezed == website ? _self.website : website // ignore: cast_nullable_to_non_nullable
as String?,activationKey: freezed == activationKey ? _self.activationKey : activationKey // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,businessLogoUrl: freezed == businessLogoUrl ? _self.businessLogoUrl : businessLogoUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [DriverParentDetailsModel].
extension DriverParentDetailsModelPatterns on DriverParentDetailsModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DriverParentDetailsModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DriverParentDetailsModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DriverParentDetailsModel value)  $default,){
final _that = this;
switch (_that) {
case _DriverParentDetailsModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DriverParentDetailsModel value)?  $default,){
final _that = this;
switch (_that) {
case _DriverParentDetailsModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id, @JsonKey(name: 'user_id')  int? userId, @JsonKey(name: 'company_name')  String? companyName, @JsonKey(name: 'business_name')  String? businessName, @JsonKey(name: 'business_address')  String? businessAddress, @JsonKey(name: 'business_email')  String? businessEmail, @JsonKey(name: 'abn_number')  String? abnNumber, @JsonKey(name: 'crn_number')  String? crnNumber, @JsonKey(name: 'business_license')  String? businessLicense,  String? website, @JsonKey(name: 'activation_key')  String? activationKey,  String? status, @JsonKey(name: 'business_logo_url')  String? businessLogoUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DriverParentDetailsModel() when $default != null:
return $default(_that.id,_that.userId,_that.companyName,_that.businessName,_that.businessAddress,_that.businessEmail,_that.abnNumber,_that.crnNumber,_that.businessLicense,_that.website,_that.activationKey,_that.status,_that.businessLogoUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id, @JsonKey(name: 'user_id')  int? userId, @JsonKey(name: 'company_name')  String? companyName, @JsonKey(name: 'business_name')  String? businessName, @JsonKey(name: 'business_address')  String? businessAddress, @JsonKey(name: 'business_email')  String? businessEmail, @JsonKey(name: 'abn_number')  String? abnNumber, @JsonKey(name: 'crn_number')  String? crnNumber, @JsonKey(name: 'business_license')  String? businessLicense,  String? website, @JsonKey(name: 'activation_key')  String? activationKey,  String? status, @JsonKey(name: 'business_logo_url')  String? businessLogoUrl)  $default,) {final _that = this;
switch (_that) {
case _DriverParentDetailsModel():
return $default(_that.id,_that.userId,_that.companyName,_that.businessName,_that.businessAddress,_that.businessEmail,_that.abnNumber,_that.crnNumber,_that.businessLicense,_that.website,_that.activationKey,_that.status,_that.businessLogoUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id, @JsonKey(name: 'user_id')  int? userId, @JsonKey(name: 'company_name')  String? companyName, @JsonKey(name: 'business_name')  String? businessName, @JsonKey(name: 'business_address')  String? businessAddress, @JsonKey(name: 'business_email')  String? businessEmail, @JsonKey(name: 'abn_number')  String? abnNumber, @JsonKey(name: 'crn_number')  String? crnNumber, @JsonKey(name: 'business_license')  String? businessLicense,  String? website, @JsonKey(name: 'activation_key')  String? activationKey,  String? status, @JsonKey(name: 'business_logo_url')  String? businessLogoUrl)?  $default,) {final _that = this;
switch (_that) {
case _DriverParentDetailsModel() when $default != null:
return $default(_that.id,_that.userId,_that.companyName,_that.businessName,_that.businessAddress,_that.businessEmail,_that.abnNumber,_that.crnNumber,_that.businessLicense,_that.website,_that.activationKey,_that.status,_that.businessLogoUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DriverParentDetailsModel implements DriverParentDetailsModel {
  const _DriverParentDetailsModel({this.id, @JsonKey(name: 'user_id') this.userId, @JsonKey(name: 'company_name') this.companyName, @JsonKey(name: 'business_name') this.businessName, @JsonKey(name: 'business_address') this.businessAddress, @JsonKey(name: 'business_email') this.businessEmail, @JsonKey(name: 'abn_number') this.abnNumber, @JsonKey(name: 'crn_number') this.crnNumber, @JsonKey(name: 'business_license') this.businessLicense, this.website, @JsonKey(name: 'activation_key') this.activationKey, this.status, @JsonKey(name: 'business_logo_url') this.businessLogoUrl});
  factory _DriverParentDetailsModel.fromJson(Map<String, dynamic> json) => _$DriverParentDetailsModelFromJson(json);

@override final  int? id;
@override@JsonKey(name: 'user_id') final  int? userId;
@override@JsonKey(name: 'company_name') final  String? companyName;
@override@JsonKey(name: 'business_name') final  String? businessName;
@override@JsonKey(name: 'business_address') final  String? businessAddress;
@override@JsonKey(name: 'business_email') final  String? businessEmail;
@override@JsonKey(name: 'abn_number') final  String? abnNumber;
@override@JsonKey(name: 'crn_number') final  String? crnNumber;
@override@JsonKey(name: 'business_license') final  String? businessLicense;
@override final  String? website;
@override@JsonKey(name: 'activation_key') final  String? activationKey;
@override final  String? status;
@override@JsonKey(name: 'business_logo_url') final  String? businessLogoUrl;

/// Create a copy of DriverParentDetailsModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DriverParentDetailsModelCopyWith<_DriverParentDetailsModel> get copyWith => __$DriverParentDetailsModelCopyWithImpl<_DriverParentDetailsModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DriverParentDetailsModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DriverParentDetailsModel&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.companyName, companyName) || other.companyName == companyName)&&(identical(other.businessName, businessName) || other.businessName == businessName)&&(identical(other.businessAddress, businessAddress) || other.businessAddress == businessAddress)&&(identical(other.businessEmail, businessEmail) || other.businessEmail == businessEmail)&&(identical(other.abnNumber, abnNumber) || other.abnNumber == abnNumber)&&(identical(other.crnNumber, crnNumber) || other.crnNumber == crnNumber)&&(identical(other.businessLicense, businessLicense) || other.businessLicense == businessLicense)&&(identical(other.website, website) || other.website == website)&&(identical(other.activationKey, activationKey) || other.activationKey == activationKey)&&(identical(other.status, status) || other.status == status)&&(identical(other.businessLogoUrl, businessLogoUrl) || other.businessLogoUrl == businessLogoUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,companyName,businessName,businessAddress,businessEmail,abnNumber,crnNumber,businessLicense,website,activationKey,status,businessLogoUrl);

@override
String toString() {
  return 'DriverParentDetailsModel(id: $id, userId: $userId, companyName: $companyName, businessName: $businessName, businessAddress: $businessAddress, businessEmail: $businessEmail, abnNumber: $abnNumber, crnNumber: $crnNumber, businessLicense: $businessLicense, website: $website, activationKey: $activationKey, status: $status, businessLogoUrl: $businessLogoUrl)';
}


}

/// @nodoc
abstract mixin class _$DriverParentDetailsModelCopyWith<$Res> implements $DriverParentDetailsModelCopyWith<$Res> {
  factory _$DriverParentDetailsModelCopyWith(_DriverParentDetailsModel value, $Res Function(_DriverParentDetailsModel) _then) = __$DriverParentDetailsModelCopyWithImpl;
@override @useResult
$Res call({
 int? id,@JsonKey(name: 'user_id') int? userId,@JsonKey(name: 'company_name') String? companyName,@JsonKey(name: 'business_name') String? businessName,@JsonKey(name: 'business_address') String? businessAddress,@JsonKey(name: 'business_email') String? businessEmail,@JsonKey(name: 'abn_number') String? abnNumber,@JsonKey(name: 'crn_number') String? crnNumber,@JsonKey(name: 'business_license') String? businessLicense, String? website,@JsonKey(name: 'activation_key') String? activationKey, String? status,@JsonKey(name: 'business_logo_url') String? businessLogoUrl
});




}
/// @nodoc
class __$DriverParentDetailsModelCopyWithImpl<$Res>
    implements _$DriverParentDetailsModelCopyWith<$Res> {
  __$DriverParentDetailsModelCopyWithImpl(this._self, this._then);

  final _DriverParentDetailsModel _self;
  final $Res Function(_DriverParentDetailsModel) _then;

/// Create a copy of DriverParentDetailsModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? userId = freezed,Object? companyName = freezed,Object? businessName = freezed,Object? businessAddress = freezed,Object? businessEmail = freezed,Object? abnNumber = freezed,Object? crnNumber = freezed,Object? businessLicense = freezed,Object? website = freezed,Object? activationKey = freezed,Object? status = freezed,Object? businessLogoUrl = freezed,}) {
  return _then(_DriverParentDetailsModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int?,companyName: freezed == companyName ? _self.companyName : companyName // ignore: cast_nullable_to_non_nullable
as String?,businessName: freezed == businessName ? _self.businessName : businessName // ignore: cast_nullable_to_non_nullable
as String?,businessAddress: freezed == businessAddress ? _self.businessAddress : businessAddress // ignore: cast_nullable_to_non_nullable
as String?,businessEmail: freezed == businessEmail ? _self.businessEmail : businessEmail // ignore: cast_nullable_to_non_nullable
as String?,abnNumber: freezed == abnNumber ? _self.abnNumber : abnNumber // ignore: cast_nullable_to_non_nullable
as String?,crnNumber: freezed == crnNumber ? _self.crnNumber : crnNumber // ignore: cast_nullable_to_non_nullable
as String?,businessLicense: freezed == businessLicense ? _self.businessLicense : businessLicense // ignore: cast_nullable_to_non_nullable
as String?,website: freezed == website ? _self.website : website // ignore: cast_nullable_to_non_nullable
as String?,activationKey: freezed == activationKey ? _self.activationKey : activationKey // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,businessLogoUrl: freezed == businessLogoUrl ? _self.businessLogoUrl : businessLogoUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
