// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer_info_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CustomerInfoModel {

 int? get id;@JsonKey(name: 'first_name') String? get firstName;@JsonKey(name: 'last_name') String? get lastName; String? get fullname; String? get username; String? get email;@JsonKey(name: 'phone_number') String? get phoneNumber;@JsonKey(name: 'profile_image_url') String? get profileImageUrl;
/// Create a copy of CustomerInfoModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CustomerInfoModelCopyWith<CustomerInfoModel> get copyWith => _$CustomerInfoModelCopyWithImpl<CustomerInfoModel>(this as CustomerInfoModel, _$identity);

  /// Serializes this CustomerInfoModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CustomerInfoModel&&(identical(other.id, id) || other.id == id)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.fullname, fullname) || other.fullname == fullname)&&(identical(other.username, username) || other.username == username)&&(identical(other.email, email) || other.email == email)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.profileImageUrl, profileImageUrl) || other.profileImageUrl == profileImageUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,firstName,lastName,fullname,username,email,phoneNumber,profileImageUrl);

@override
String toString() {
  return 'CustomerInfoModel(id: $id, firstName: $firstName, lastName: $lastName, fullname: $fullname, username: $username, email: $email, phoneNumber: $phoneNumber, profileImageUrl: $profileImageUrl)';
}


}

/// @nodoc
abstract mixin class $CustomerInfoModelCopyWith<$Res>  {
  factory $CustomerInfoModelCopyWith(CustomerInfoModel value, $Res Function(CustomerInfoModel) _then) = _$CustomerInfoModelCopyWithImpl;
@useResult
$Res call({
 int? id,@JsonKey(name: 'first_name') String? firstName,@JsonKey(name: 'last_name') String? lastName, String? fullname, String? username, String? email,@JsonKey(name: 'phone_number') String? phoneNumber,@JsonKey(name: 'profile_image_url') String? profileImageUrl
});




}
/// @nodoc
class _$CustomerInfoModelCopyWithImpl<$Res>
    implements $CustomerInfoModelCopyWith<$Res> {
  _$CustomerInfoModelCopyWithImpl(this._self, this._then);

  final CustomerInfoModel _self;
  final $Res Function(CustomerInfoModel) _then;

/// Create a copy of CustomerInfoModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? firstName = freezed,Object? lastName = freezed,Object? fullname = freezed,Object? username = freezed,Object? email = freezed,Object? phoneNumber = freezed,Object? profileImageUrl = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,firstName: freezed == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String?,lastName: freezed == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String?,fullname: freezed == fullname ? _self.fullname : fullname // ignore: cast_nullable_to_non_nullable
as String?,username: freezed == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,phoneNumber: freezed == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String?,profileImageUrl: freezed == profileImageUrl ? _self.profileImageUrl : profileImageUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CustomerInfoModel].
extension CustomerInfoModelPatterns on CustomerInfoModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CustomerInfoModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CustomerInfoModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CustomerInfoModel value)  $default,){
final _that = this;
switch (_that) {
case _CustomerInfoModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CustomerInfoModel value)?  $default,){
final _that = this;
switch (_that) {
case _CustomerInfoModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id, @JsonKey(name: 'first_name')  String? firstName, @JsonKey(name: 'last_name')  String? lastName,  String? fullname,  String? username,  String? email, @JsonKey(name: 'phone_number')  String? phoneNumber, @JsonKey(name: 'profile_image_url')  String? profileImageUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CustomerInfoModel() when $default != null:
return $default(_that.id,_that.firstName,_that.lastName,_that.fullname,_that.username,_that.email,_that.phoneNumber,_that.profileImageUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id, @JsonKey(name: 'first_name')  String? firstName, @JsonKey(name: 'last_name')  String? lastName,  String? fullname,  String? username,  String? email, @JsonKey(name: 'phone_number')  String? phoneNumber, @JsonKey(name: 'profile_image_url')  String? profileImageUrl)  $default,) {final _that = this;
switch (_that) {
case _CustomerInfoModel():
return $default(_that.id,_that.firstName,_that.lastName,_that.fullname,_that.username,_that.email,_that.phoneNumber,_that.profileImageUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id, @JsonKey(name: 'first_name')  String? firstName, @JsonKey(name: 'last_name')  String? lastName,  String? fullname,  String? username,  String? email, @JsonKey(name: 'phone_number')  String? phoneNumber, @JsonKey(name: 'profile_image_url')  String? profileImageUrl)?  $default,) {final _that = this;
switch (_that) {
case _CustomerInfoModel() when $default != null:
return $default(_that.id,_that.firstName,_that.lastName,_that.fullname,_that.username,_that.email,_that.phoneNumber,_that.profileImageUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CustomerInfoModel extends CustomerInfoModel {
  const _CustomerInfoModel({this.id, @JsonKey(name: 'first_name') this.firstName, @JsonKey(name: 'last_name') this.lastName, this.fullname, this.username, this.email, @JsonKey(name: 'phone_number') this.phoneNumber, @JsonKey(name: 'profile_image_url') this.profileImageUrl}): super._();
  factory _CustomerInfoModel.fromJson(Map<String, dynamic> json) => _$CustomerInfoModelFromJson(json);

@override final  int? id;
@override@JsonKey(name: 'first_name') final  String? firstName;
@override@JsonKey(name: 'last_name') final  String? lastName;
@override final  String? fullname;
@override final  String? username;
@override final  String? email;
@override@JsonKey(name: 'phone_number') final  String? phoneNumber;
@override@JsonKey(name: 'profile_image_url') final  String? profileImageUrl;

/// Create a copy of CustomerInfoModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CustomerInfoModelCopyWith<_CustomerInfoModel> get copyWith => __$CustomerInfoModelCopyWithImpl<_CustomerInfoModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CustomerInfoModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CustomerInfoModel&&(identical(other.id, id) || other.id == id)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.fullname, fullname) || other.fullname == fullname)&&(identical(other.username, username) || other.username == username)&&(identical(other.email, email) || other.email == email)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.profileImageUrl, profileImageUrl) || other.profileImageUrl == profileImageUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,firstName,lastName,fullname,username,email,phoneNumber,profileImageUrl);

@override
String toString() {
  return 'CustomerInfoModel(id: $id, firstName: $firstName, lastName: $lastName, fullname: $fullname, username: $username, email: $email, phoneNumber: $phoneNumber, profileImageUrl: $profileImageUrl)';
}


}

/// @nodoc
abstract mixin class _$CustomerInfoModelCopyWith<$Res> implements $CustomerInfoModelCopyWith<$Res> {
  factory _$CustomerInfoModelCopyWith(_CustomerInfoModel value, $Res Function(_CustomerInfoModel) _then) = __$CustomerInfoModelCopyWithImpl;
@override @useResult
$Res call({
 int? id,@JsonKey(name: 'first_name') String? firstName,@JsonKey(name: 'last_name') String? lastName, String? fullname, String? username, String? email,@JsonKey(name: 'phone_number') String? phoneNumber,@JsonKey(name: 'profile_image_url') String? profileImageUrl
});




}
/// @nodoc
class __$CustomerInfoModelCopyWithImpl<$Res>
    implements _$CustomerInfoModelCopyWith<$Res> {
  __$CustomerInfoModelCopyWithImpl(this._self, this._then);

  final _CustomerInfoModel _self;
  final $Res Function(_CustomerInfoModel) _then;

/// Create a copy of CustomerInfoModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? firstName = freezed,Object? lastName = freezed,Object? fullname = freezed,Object? username = freezed,Object? email = freezed,Object? phoneNumber = freezed,Object? profileImageUrl = freezed,}) {
  return _then(_CustomerInfoModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,firstName: freezed == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String?,lastName: freezed == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String?,fullname: freezed == fullname ? _self.fullname : fullname // ignore: cast_nullable_to_non_nullable
as String?,username: freezed == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,phoneNumber: freezed == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String?,profileImageUrl: freezed == profileImageUrl ? _self.profileImageUrl : profileImageUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
