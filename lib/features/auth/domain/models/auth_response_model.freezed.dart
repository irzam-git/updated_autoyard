// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AuthorisationModel {

 String? get type; String? get token; int? get expiration;
/// Create a copy of AuthorisationModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthorisationModelCopyWith<AuthorisationModel> get copyWith => _$AuthorisationModelCopyWithImpl<AuthorisationModel>(this as AuthorisationModel, _$identity);

  /// Serializes this AuthorisationModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthorisationModel&&(identical(other.type, type) || other.type == type)&&(identical(other.token, token) || other.token == token)&&(identical(other.expiration, expiration) || other.expiration == expiration));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,token,expiration);

@override
String toString() {
  return 'AuthorisationModel(type: $type, token: $token, expiration: $expiration)';
}


}

/// @nodoc
abstract mixin class $AuthorisationModelCopyWith<$Res>  {
  factory $AuthorisationModelCopyWith(AuthorisationModel value, $Res Function(AuthorisationModel) _then) = _$AuthorisationModelCopyWithImpl;
@useResult
$Res call({
 String? type, String? token, int? expiration
});




}
/// @nodoc
class _$AuthorisationModelCopyWithImpl<$Res>
    implements $AuthorisationModelCopyWith<$Res> {
  _$AuthorisationModelCopyWithImpl(this._self, this._then);

  final AuthorisationModel _self;
  final $Res Function(AuthorisationModel) _then;

/// Create a copy of AuthorisationModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = freezed,Object? token = freezed,Object? expiration = freezed,}) {
  return _then(_self.copyWith(
type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,token: freezed == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String?,expiration: freezed == expiration ? _self.expiration : expiration // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [AuthorisationModel].
extension AuthorisationModelPatterns on AuthorisationModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AuthorisationModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AuthorisationModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AuthorisationModel value)  $default,){
final _that = this;
switch (_that) {
case _AuthorisationModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AuthorisationModel value)?  $default,){
final _that = this;
switch (_that) {
case _AuthorisationModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? type,  String? token,  int? expiration)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AuthorisationModel() when $default != null:
return $default(_that.type,_that.token,_that.expiration);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? type,  String? token,  int? expiration)  $default,) {final _that = this;
switch (_that) {
case _AuthorisationModel():
return $default(_that.type,_that.token,_that.expiration);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? type,  String? token,  int? expiration)?  $default,) {final _that = this;
switch (_that) {
case _AuthorisationModel() when $default != null:
return $default(_that.type,_that.token,_that.expiration);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AuthorisationModel implements AuthorisationModel {
  const _AuthorisationModel({this.type, this.token, this.expiration});
  factory _AuthorisationModel.fromJson(Map<String, dynamic> json) => _$AuthorisationModelFromJson(json);

@override final  String? type;
@override final  String? token;
@override final  int? expiration;

/// Create a copy of AuthorisationModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthorisationModelCopyWith<_AuthorisationModel> get copyWith => __$AuthorisationModelCopyWithImpl<_AuthorisationModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AuthorisationModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthorisationModel&&(identical(other.type, type) || other.type == type)&&(identical(other.token, token) || other.token == token)&&(identical(other.expiration, expiration) || other.expiration == expiration));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,token,expiration);

@override
String toString() {
  return 'AuthorisationModel(type: $type, token: $token, expiration: $expiration)';
}


}

/// @nodoc
abstract mixin class _$AuthorisationModelCopyWith<$Res> implements $AuthorisationModelCopyWith<$Res> {
  factory _$AuthorisationModelCopyWith(_AuthorisationModel value, $Res Function(_AuthorisationModel) _then) = __$AuthorisationModelCopyWithImpl;
@override @useResult
$Res call({
 String? type, String? token, int? expiration
});




}
/// @nodoc
class __$AuthorisationModelCopyWithImpl<$Res>
    implements _$AuthorisationModelCopyWith<$Res> {
  __$AuthorisationModelCopyWithImpl(this._self, this._then);

  final _AuthorisationModel _self;
  final $Res Function(_AuthorisationModel) _then;

/// Create a copy of AuthorisationModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = freezed,Object? token = freezed,Object? expiration = freezed,}) {
  return _then(_AuthorisationModel(
type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,token: freezed == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String?,expiration: freezed == expiration ? _self.expiration : expiration // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}


/// @nodoc
mixin _$AuthDataModel {

 UserModel? get user; AuthorisationModel? get authorisation;
/// Create a copy of AuthDataModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthDataModelCopyWith<AuthDataModel> get copyWith => _$AuthDataModelCopyWithImpl<AuthDataModel>(this as AuthDataModel, _$identity);

  /// Serializes this AuthDataModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthDataModel&&(identical(other.user, user) || other.user == user)&&(identical(other.authorisation, authorisation) || other.authorisation == authorisation));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,user,authorisation);

@override
String toString() {
  return 'AuthDataModel(user: $user, authorisation: $authorisation)';
}


}

/// @nodoc
abstract mixin class $AuthDataModelCopyWith<$Res>  {
  factory $AuthDataModelCopyWith(AuthDataModel value, $Res Function(AuthDataModel) _then) = _$AuthDataModelCopyWithImpl;
@useResult
$Res call({
 UserModel? user, AuthorisationModel? authorisation
});


$UserModelCopyWith<$Res>? get user;$AuthorisationModelCopyWith<$Res>? get authorisation;

}
/// @nodoc
class _$AuthDataModelCopyWithImpl<$Res>
    implements $AuthDataModelCopyWith<$Res> {
  _$AuthDataModelCopyWithImpl(this._self, this._then);

  final AuthDataModel _self;
  final $Res Function(AuthDataModel) _then;

/// Create a copy of AuthDataModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? user = freezed,Object? authorisation = freezed,}) {
  return _then(_self.copyWith(
user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserModel?,authorisation: freezed == authorisation ? _self.authorisation : authorisation // ignore: cast_nullable_to_non_nullable
as AuthorisationModel?,
  ));
}
/// Create a copy of AuthDataModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserModelCopyWith<$Res>? get user {
    if (_self.user == null) {
    return null;
  }

  return $UserModelCopyWith<$Res>(_self.user!, (value) {
    return _then(_self.copyWith(user: value));
  });
}/// Create a copy of AuthDataModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AuthorisationModelCopyWith<$Res>? get authorisation {
    if (_self.authorisation == null) {
    return null;
  }

  return $AuthorisationModelCopyWith<$Res>(_self.authorisation!, (value) {
    return _then(_self.copyWith(authorisation: value));
  });
}
}


/// Adds pattern-matching-related methods to [AuthDataModel].
extension AuthDataModelPatterns on AuthDataModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AuthDataModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AuthDataModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AuthDataModel value)  $default,){
final _that = this;
switch (_that) {
case _AuthDataModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AuthDataModel value)?  $default,){
final _that = this;
switch (_that) {
case _AuthDataModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( UserModel? user,  AuthorisationModel? authorisation)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AuthDataModel() when $default != null:
return $default(_that.user,_that.authorisation);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( UserModel? user,  AuthorisationModel? authorisation)  $default,) {final _that = this;
switch (_that) {
case _AuthDataModel():
return $default(_that.user,_that.authorisation);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( UserModel? user,  AuthorisationModel? authorisation)?  $default,) {final _that = this;
switch (_that) {
case _AuthDataModel() when $default != null:
return $default(_that.user,_that.authorisation);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AuthDataModel implements AuthDataModel {
  const _AuthDataModel({this.user, this.authorisation});
  factory _AuthDataModel.fromJson(Map<String, dynamic> json) => _$AuthDataModelFromJson(json);

@override final  UserModel? user;
@override final  AuthorisationModel? authorisation;

/// Create a copy of AuthDataModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthDataModelCopyWith<_AuthDataModel> get copyWith => __$AuthDataModelCopyWithImpl<_AuthDataModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AuthDataModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthDataModel&&(identical(other.user, user) || other.user == user)&&(identical(other.authorisation, authorisation) || other.authorisation == authorisation));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,user,authorisation);

@override
String toString() {
  return 'AuthDataModel(user: $user, authorisation: $authorisation)';
}


}

/// @nodoc
abstract mixin class _$AuthDataModelCopyWith<$Res> implements $AuthDataModelCopyWith<$Res> {
  factory _$AuthDataModelCopyWith(_AuthDataModel value, $Res Function(_AuthDataModel) _then) = __$AuthDataModelCopyWithImpl;
@override @useResult
$Res call({
 UserModel? user, AuthorisationModel? authorisation
});


@override $UserModelCopyWith<$Res>? get user;@override $AuthorisationModelCopyWith<$Res>? get authorisation;

}
/// @nodoc
class __$AuthDataModelCopyWithImpl<$Res>
    implements _$AuthDataModelCopyWith<$Res> {
  __$AuthDataModelCopyWithImpl(this._self, this._then);

  final _AuthDataModel _self;
  final $Res Function(_AuthDataModel) _then;

/// Create a copy of AuthDataModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? user = freezed,Object? authorisation = freezed,}) {
  return _then(_AuthDataModel(
user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserModel?,authorisation: freezed == authorisation ? _self.authorisation : authorisation // ignore: cast_nullable_to_non_nullable
as AuthorisationModel?,
  ));
}

/// Create a copy of AuthDataModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserModelCopyWith<$Res>? get user {
    if (_self.user == null) {
    return null;
  }

  return $UserModelCopyWith<$Res>(_self.user!, (value) {
    return _then(_self.copyWith(user: value));
  });
}/// Create a copy of AuthDataModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AuthorisationModelCopyWith<$Res>? get authorisation {
    if (_self.authorisation == null) {
    return null;
  }

  return $AuthorisationModelCopyWith<$Res>(_self.authorisation!, (value) {
    return _then(_self.copyWith(authorisation: value));
  });
}
}


/// @nodoc
mixin _$AuthResponseModel {

 int? get error; AuthDataModel? get data; String? get message;
/// Create a copy of AuthResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthResponseModelCopyWith<AuthResponseModel> get copyWith => _$AuthResponseModelCopyWithImpl<AuthResponseModel>(this as AuthResponseModel, _$identity);

  /// Serializes this AuthResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthResponseModel&&(identical(other.error, error) || other.error == error)&&(identical(other.data, data) || other.data == data)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,error,data,message);

@override
String toString() {
  return 'AuthResponseModel(error: $error, data: $data, message: $message)';
}


}

/// @nodoc
abstract mixin class $AuthResponseModelCopyWith<$Res>  {
  factory $AuthResponseModelCopyWith(AuthResponseModel value, $Res Function(AuthResponseModel) _then) = _$AuthResponseModelCopyWithImpl;
@useResult
$Res call({
 int? error, AuthDataModel? data, String? message
});


$AuthDataModelCopyWith<$Res>? get data;

}
/// @nodoc
class _$AuthResponseModelCopyWithImpl<$Res>
    implements $AuthResponseModelCopyWith<$Res> {
  _$AuthResponseModelCopyWithImpl(this._self, this._then);

  final AuthResponseModel _self;
  final $Res Function(AuthResponseModel) _then;

/// Create a copy of AuthResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? error = freezed,Object? data = freezed,Object? message = freezed,}) {
  return _then(_self.copyWith(
error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as int?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as AuthDataModel?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of AuthResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AuthDataModelCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $AuthDataModelCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [AuthResponseModel].
extension AuthResponseModelPatterns on AuthResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AuthResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AuthResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AuthResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _AuthResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AuthResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _AuthResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? error,  AuthDataModel? data,  String? message)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AuthResponseModel() when $default != null:
return $default(_that.error,_that.data,_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? error,  AuthDataModel? data,  String? message)  $default,) {final _that = this;
switch (_that) {
case _AuthResponseModel():
return $default(_that.error,_that.data,_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? error,  AuthDataModel? data,  String? message)?  $default,) {final _that = this;
switch (_that) {
case _AuthResponseModel() when $default != null:
return $default(_that.error,_that.data,_that.message);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AuthResponseModel implements AuthResponseModel {
  const _AuthResponseModel({this.error, this.data, this.message});
  factory _AuthResponseModel.fromJson(Map<String, dynamic> json) => _$AuthResponseModelFromJson(json);

@override final  int? error;
@override final  AuthDataModel? data;
@override final  String? message;

/// Create a copy of AuthResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthResponseModelCopyWith<_AuthResponseModel> get copyWith => __$AuthResponseModelCopyWithImpl<_AuthResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AuthResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthResponseModel&&(identical(other.error, error) || other.error == error)&&(identical(other.data, data) || other.data == data)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,error,data,message);

@override
String toString() {
  return 'AuthResponseModel(error: $error, data: $data, message: $message)';
}


}

/// @nodoc
abstract mixin class _$AuthResponseModelCopyWith<$Res> implements $AuthResponseModelCopyWith<$Res> {
  factory _$AuthResponseModelCopyWith(_AuthResponseModel value, $Res Function(_AuthResponseModel) _then) = __$AuthResponseModelCopyWithImpl;
@override @useResult
$Res call({
 int? error, AuthDataModel? data, String? message
});


@override $AuthDataModelCopyWith<$Res>? get data;

}
/// @nodoc
class __$AuthResponseModelCopyWithImpl<$Res>
    implements _$AuthResponseModelCopyWith<$Res> {
  __$AuthResponseModelCopyWithImpl(this._self, this._then);

  final _AuthResponseModel _self;
  final $Res Function(_AuthResponseModel) _then;

/// Create a copy of AuthResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? error = freezed,Object? data = freezed,Object? message = freezed,}) {
  return _then(_AuthResponseModel(
error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as int?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as AuthDataModel?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of AuthResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AuthDataModelCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $AuthDataModelCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}

// dart format on
