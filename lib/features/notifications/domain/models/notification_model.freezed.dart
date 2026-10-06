// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NotificationDataModel {

 String? get title; String? get url; String? get message;
/// Create a copy of NotificationDataModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NotificationDataModelCopyWith<NotificationDataModel> get copyWith => _$NotificationDataModelCopyWithImpl<NotificationDataModel>(this as NotificationDataModel, _$identity);

  /// Serializes this NotificationDataModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotificationDataModel&&(identical(other.title, title) || other.title == title)&&(identical(other.url, url) || other.url == url)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,url,message);

@override
String toString() {
  return 'NotificationDataModel(title: $title, url: $url, message: $message)';
}


}

/// @nodoc
abstract mixin class $NotificationDataModelCopyWith<$Res>  {
  factory $NotificationDataModelCopyWith(NotificationDataModel value, $Res Function(NotificationDataModel) _then) = _$NotificationDataModelCopyWithImpl;
@useResult
$Res call({
 String? title, String? url, String? message
});




}
/// @nodoc
class _$NotificationDataModelCopyWithImpl<$Res>
    implements $NotificationDataModelCopyWith<$Res> {
  _$NotificationDataModelCopyWithImpl(this._self, this._then);

  final NotificationDataModel _self;
  final $Res Function(NotificationDataModel) _then;

/// Create a copy of NotificationDataModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = freezed,Object? url = freezed,Object? message = freezed,}) {
  return _then(_self.copyWith(
title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [NotificationDataModel].
extension NotificationDataModelPatterns on NotificationDataModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NotificationDataModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NotificationDataModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NotificationDataModel value)  $default,){
final _that = this;
switch (_that) {
case _NotificationDataModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NotificationDataModel value)?  $default,){
final _that = this;
switch (_that) {
case _NotificationDataModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? title,  String? url,  String? message)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NotificationDataModel() when $default != null:
return $default(_that.title,_that.url,_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? title,  String? url,  String? message)  $default,) {final _that = this;
switch (_that) {
case _NotificationDataModel():
return $default(_that.title,_that.url,_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? title,  String? url,  String? message)?  $default,) {final _that = this;
switch (_that) {
case _NotificationDataModel() when $default != null:
return $default(_that.title,_that.url,_that.message);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _NotificationDataModel implements NotificationDataModel {
  const _NotificationDataModel({this.title, this.url, this.message});
  factory _NotificationDataModel.fromJson(Map<String, dynamic> json) => _$NotificationDataModelFromJson(json);

@override final  String? title;
@override final  String? url;
@override final  String? message;

/// Create a copy of NotificationDataModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NotificationDataModelCopyWith<_NotificationDataModel> get copyWith => __$NotificationDataModelCopyWithImpl<_NotificationDataModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NotificationDataModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NotificationDataModel&&(identical(other.title, title) || other.title == title)&&(identical(other.url, url) || other.url == url)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,url,message);

@override
String toString() {
  return 'NotificationDataModel(title: $title, url: $url, message: $message)';
}


}

/// @nodoc
abstract mixin class _$NotificationDataModelCopyWith<$Res> implements $NotificationDataModelCopyWith<$Res> {
  factory _$NotificationDataModelCopyWith(_NotificationDataModel value, $Res Function(_NotificationDataModel) _then) = __$NotificationDataModelCopyWithImpl;
@override @useResult
$Res call({
 String? title, String? url, String? message
});




}
/// @nodoc
class __$NotificationDataModelCopyWithImpl<$Res>
    implements _$NotificationDataModelCopyWith<$Res> {
  __$NotificationDataModelCopyWithImpl(this._self, this._then);

  final _NotificationDataModel _self;
  final $Res Function(_NotificationDataModel) _then;

/// Create a copy of NotificationDataModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = freezed,Object? url = freezed,Object? message = freezed,}) {
  return _then(_NotificationDataModel(
title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$NotificationModel {

 String get id; String? get type;@JsonKey(name: 'notifiable_type') String? get notifiableType;@JsonKey(name: 'notifiable_id') int? get notifiableId; NotificationDataModel? get data;@JsonKey(name: 'read_at') String? get readAt;@JsonKey(name: 'created_at') String? get createdAt;@JsonKey(name: 'updated_at') String? get updatedAt;
/// Create a copy of NotificationModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NotificationModelCopyWith<NotificationModel> get copyWith => _$NotificationModelCopyWithImpl<NotificationModel>(this as NotificationModel, _$identity);

  /// Serializes this NotificationModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotificationModel&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.notifiableType, notifiableType) || other.notifiableType == notifiableType)&&(identical(other.notifiableId, notifiableId) || other.notifiableId == notifiableId)&&(identical(other.data, data) || other.data == data)&&(identical(other.readAt, readAt) || other.readAt == readAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,type,notifiableType,notifiableId,data,readAt,createdAt,updatedAt);

@override
String toString() {
  return 'NotificationModel(id: $id, type: $type, notifiableType: $notifiableType, notifiableId: $notifiableId, data: $data, readAt: $readAt, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $NotificationModelCopyWith<$Res>  {
  factory $NotificationModelCopyWith(NotificationModel value, $Res Function(NotificationModel) _then) = _$NotificationModelCopyWithImpl;
@useResult
$Res call({
 String id, String? type,@JsonKey(name: 'notifiable_type') String? notifiableType,@JsonKey(name: 'notifiable_id') int? notifiableId, NotificationDataModel? data,@JsonKey(name: 'read_at') String? readAt,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'updated_at') String? updatedAt
});


$NotificationDataModelCopyWith<$Res>? get data;

}
/// @nodoc
class _$NotificationModelCopyWithImpl<$Res>
    implements $NotificationModelCopyWith<$Res> {
  _$NotificationModelCopyWithImpl(this._self, this._then);

  final NotificationModel _self;
  final $Res Function(NotificationModel) _then;

/// Create a copy of NotificationModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? type = freezed,Object? notifiableType = freezed,Object? notifiableId = freezed,Object? data = freezed,Object? readAt = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,notifiableType: freezed == notifiableType ? _self.notifiableType : notifiableType // ignore: cast_nullable_to_non_nullable
as String?,notifiableId: freezed == notifiableId ? _self.notifiableId : notifiableId // ignore: cast_nullable_to_non_nullable
as int?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as NotificationDataModel?,readAt: freezed == readAt ? _self.readAt : readAt // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of NotificationModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NotificationDataModelCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $NotificationDataModelCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [NotificationModel].
extension NotificationModelPatterns on NotificationModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NotificationModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NotificationModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NotificationModel value)  $default,){
final _that = this;
switch (_that) {
case _NotificationModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NotificationModel value)?  $default,){
final _that = this;
switch (_that) {
case _NotificationModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String? type, @JsonKey(name: 'notifiable_type')  String? notifiableType, @JsonKey(name: 'notifiable_id')  int? notifiableId,  NotificationDataModel? data, @JsonKey(name: 'read_at')  String? readAt, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NotificationModel() when $default != null:
return $default(_that.id,_that.type,_that.notifiableType,_that.notifiableId,_that.data,_that.readAt,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String? type, @JsonKey(name: 'notifiable_type')  String? notifiableType, @JsonKey(name: 'notifiable_id')  int? notifiableId,  NotificationDataModel? data, @JsonKey(name: 'read_at')  String? readAt, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _NotificationModel():
return $default(_that.id,_that.type,_that.notifiableType,_that.notifiableId,_that.data,_that.readAt,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String? type, @JsonKey(name: 'notifiable_type')  String? notifiableType, @JsonKey(name: 'notifiable_id')  int? notifiableId,  NotificationDataModel? data, @JsonKey(name: 'read_at')  String? readAt, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _NotificationModel() when $default != null:
return $default(_that.id,_that.type,_that.notifiableType,_that.notifiableId,_that.data,_that.readAt,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _NotificationModel extends NotificationModel {
  const _NotificationModel({required this.id, this.type, @JsonKey(name: 'notifiable_type') this.notifiableType, @JsonKey(name: 'notifiable_id') this.notifiableId, this.data, @JsonKey(name: 'read_at') this.readAt, @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'updated_at') this.updatedAt}): super._();
  factory _NotificationModel.fromJson(Map<String, dynamic> json) => _$NotificationModelFromJson(json);

@override final  String id;
@override final  String? type;
@override@JsonKey(name: 'notifiable_type') final  String? notifiableType;
@override@JsonKey(name: 'notifiable_id') final  int? notifiableId;
@override final  NotificationDataModel? data;
@override@JsonKey(name: 'read_at') final  String? readAt;
@override@JsonKey(name: 'created_at') final  String? createdAt;
@override@JsonKey(name: 'updated_at') final  String? updatedAt;

/// Create a copy of NotificationModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NotificationModelCopyWith<_NotificationModel> get copyWith => __$NotificationModelCopyWithImpl<_NotificationModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NotificationModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NotificationModel&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.notifiableType, notifiableType) || other.notifiableType == notifiableType)&&(identical(other.notifiableId, notifiableId) || other.notifiableId == notifiableId)&&(identical(other.data, data) || other.data == data)&&(identical(other.readAt, readAt) || other.readAt == readAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,type,notifiableType,notifiableId,data,readAt,createdAt,updatedAt);

@override
String toString() {
  return 'NotificationModel(id: $id, type: $type, notifiableType: $notifiableType, notifiableId: $notifiableId, data: $data, readAt: $readAt, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$NotificationModelCopyWith<$Res> implements $NotificationModelCopyWith<$Res> {
  factory _$NotificationModelCopyWith(_NotificationModel value, $Res Function(_NotificationModel) _then) = __$NotificationModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String? type,@JsonKey(name: 'notifiable_type') String? notifiableType,@JsonKey(name: 'notifiable_id') int? notifiableId, NotificationDataModel? data,@JsonKey(name: 'read_at') String? readAt,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'updated_at') String? updatedAt
});


@override $NotificationDataModelCopyWith<$Res>? get data;

}
/// @nodoc
class __$NotificationModelCopyWithImpl<$Res>
    implements _$NotificationModelCopyWith<$Res> {
  __$NotificationModelCopyWithImpl(this._self, this._then);

  final _NotificationModel _self;
  final $Res Function(_NotificationModel) _then;

/// Create a copy of NotificationModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? type = freezed,Object? notifiableType = freezed,Object? notifiableId = freezed,Object? data = freezed,Object? readAt = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_NotificationModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,notifiableType: freezed == notifiableType ? _self.notifiableType : notifiableType // ignore: cast_nullable_to_non_nullable
as String?,notifiableId: freezed == notifiableId ? _self.notifiableId : notifiableId // ignore: cast_nullable_to_non_nullable
as int?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as NotificationDataModel?,readAt: freezed == readAt ? _self.readAt : readAt // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of NotificationModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NotificationDataModelCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $NotificationDataModelCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}

// dart format on
