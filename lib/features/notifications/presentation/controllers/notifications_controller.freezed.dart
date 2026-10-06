// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notifications_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$NotificationsState {

 bool get isLoading; bool get isRefreshing; bool get isMarkingAllRead; List<NotificationModel> get notifications; int get currentPage; bool get hasMorePages; bool get filterUnreadOnly; String? get errorMessage;
/// Create a copy of NotificationsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NotificationsStateCopyWith<NotificationsState> get copyWith => _$NotificationsStateCopyWithImpl<NotificationsState>(this as NotificationsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotificationsState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isRefreshing, isRefreshing) || other.isRefreshing == isRefreshing)&&(identical(other.isMarkingAllRead, isMarkingAllRead) || other.isMarkingAllRead == isMarkingAllRead)&&const DeepCollectionEquality().equals(other.notifications, notifications)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.hasMorePages, hasMorePages) || other.hasMorePages == hasMorePages)&&(identical(other.filterUnreadOnly, filterUnreadOnly) || other.filterUnreadOnly == filterUnreadOnly)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,isRefreshing,isMarkingAllRead,const DeepCollectionEquality().hash(notifications),currentPage,hasMorePages,filterUnreadOnly,errorMessage);

@override
String toString() {
  return 'NotificationsState(isLoading: $isLoading, isRefreshing: $isRefreshing, isMarkingAllRead: $isMarkingAllRead, notifications: $notifications, currentPage: $currentPage, hasMorePages: $hasMorePages, filterUnreadOnly: $filterUnreadOnly, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $NotificationsStateCopyWith<$Res>  {
  factory $NotificationsStateCopyWith(NotificationsState value, $Res Function(NotificationsState) _then) = _$NotificationsStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading, bool isRefreshing, bool isMarkingAllRead, List<NotificationModel> notifications, int currentPage, bool hasMorePages, bool filterUnreadOnly, String? errorMessage
});




}
/// @nodoc
class _$NotificationsStateCopyWithImpl<$Res>
    implements $NotificationsStateCopyWith<$Res> {
  _$NotificationsStateCopyWithImpl(this._self, this._then);

  final NotificationsState _self;
  final $Res Function(NotificationsState) _then;

/// Create a copy of NotificationsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,Object? isRefreshing = null,Object? isMarkingAllRead = null,Object? notifications = null,Object? currentPage = null,Object? hasMorePages = null,Object? filterUnreadOnly = null,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isRefreshing: null == isRefreshing ? _self.isRefreshing : isRefreshing // ignore: cast_nullable_to_non_nullable
as bool,isMarkingAllRead: null == isMarkingAllRead ? _self.isMarkingAllRead : isMarkingAllRead // ignore: cast_nullable_to_non_nullable
as bool,notifications: null == notifications ? _self.notifications : notifications // ignore: cast_nullable_to_non_nullable
as List<NotificationModel>,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,hasMorePages: null == hasMorePages ? _self.hasMorePages : hasMorePages // ignore: cast_nullable_to_non_nullable
as bool,filterUnreadOnly: null == filterUnreadOnly ? _self.filterUnreadOnly : filterUnreadOnly // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [NotificationsState].
extension NotificationsStatePatterns on NotificationsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NotificationsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NotificationsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NotificationsState value)  $default,){
final _that = this;
switch (_that) {
case _NotificationsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NotificationsState value)?  $default,){
final _that = this;
switch (_that) {
case _NotificationsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isLoading,  bool isRefreshing,  bool isMarkingAllRead,  List<NotificationModel> notifications,  int currentPage,  bool hasMorePages,  bool filterUnreadOnly,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NotificationsState() when $default != null:
return $default(_that.isLoading,_that.isRefreshing,_that.isMarkingAllRead,_that.notifications,_that.currentPage,_that.hasMorePages,_that.filterUnreadOnly,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isLoading,  bool isRefreshing,  bool isMarkingAllRead,  List<NotificationModel> notifications,  int currentPage,  bool hasMorePages,  bool filterUnreadOnly,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _NotificationsState():
return $default(_that.isLoading,_that.isRefreshing,_that.isMarkingAllRead,_that.notifications,_that.currentPage,_that.hasMorePages,_that.filterUnreadOnly,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isLoading,  bool isRefreshing,  bool isMarkingAllRead,  List<NotificationModel> notifications,  int currentPage,  bool hasMorePages,  bool filterUnreadOnly,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _NotificationsState() when $default != null:
return $default(_that.isLoading,_that.isRefreshing,_that.isMarkingAllRead,_that.notifications,_that.currentPage,_that.hasMorePages,_that.filterUnreadOnly,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _NotificationsState extends NotificationsState {
  const _NotificationsState({this.isLoading = true, this.isRefreshing = false, this.isMarkingAllRead = false, this.notifications = const [], this.currentPage = 1, this.hasMorePages = false, this.filterUnreadOnly = false, this.errorMessage}): super._();
  

@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  bool isRefreshing;
@override@JsonKey() final  bool isMarkingAllRead;
@override@JsonKey() final  List<NotificationModel> notifications;
@override@JsonKey() final  int currentPage;
@override@JsonKey() final  bool hasMorePages;
@override@JsonKey() final  bool filterUnreadOnly;
@override final  String? errorMessage;

/// Create a copy of NotificationsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NotificationsStateCopyWith<_NotificationsState> get copyWith => __$NotificationsStateCopyWithImpl<_NotificationsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NotificationsState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isRefreshing, isRefreshing) || other.isRefreshing == isRefreshing)&&(identical(other.isMarkingAllRead, isMarkingAllRead) || other.isMarkingAllRead == isMarkingAllRead)&&const DeepCollectionEquality().equals(other.notifications, notifications)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.hasMorePages, hasMorePages) || other.hasMorePages == hasMorePages)&&(identical(other.filterUnreadOnly, filterUnreadOnly) || other.filterUnreadOnly == filterUnreadOnly)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,isRefreshing,isMarkingAllRead,const DeepCollectionEquality().hash(notifications),currentPage,hasMorePages,filterUnreadOnly,errorMessage);

@override
String toString() {
  return 'NotificationsState(isLoading: $isLoading, isRefreshing: $isRefreshing, isMarkingAllRead: $isMarkingAllRead, notifications: $notifications, currentPage: $currentPage, hasMorePages: $hasMorePages, filterUnreadOnly: $filterUnreadOnly, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$NotificationsStateCopyWith<$Res> implements $NotificationsStateCopyWith<$Res> {
  factory _$NotificationsStateCopyWith(_NotificationsState value, $Res Function(_NotificationsState) _then) = __$NotificationsStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading, bool isRefreshing, bool isMarkingAllRead, List<NotificationModel> notifications, int currentPage, bool hasMorePages, bool filterUnreadOnly, String? errorMessage
});




}
/// @nodoc
class __$NotificationsStateCopyWithImpl<$Res>
    implements _$NotificationsStateCopyWith<$Res> {
  __$NotificationsStateCopyWithImpl(this._self, this._then);

  final _NotificationsState _self;
  final $Res Function(_NotificationsState) _then;

/// Create a copy of NotificationsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? isRefreshing = null,Object? isMarkingAllRead = null,Object? notifications = null,Object? currentPage = null,Object? hasMorePages = null,Object? filterUnreadOnly = null,Object? errorMessage = freezed,}) {
  return _then(_NotificationsState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isRefreshing: null == isRefreshing ? _self.isRefreshing : isRefreshing // ignore: cast_nullable_to_non_nullable
as bool,isMarkingAllRead: null == isMarkingAllRead ? _self.isMarkingAllRead : isMarkingAllRead // ignore: cast_nullable_to_non_nullable
as bool,notifications: null == notifications ? _self.notifications : notifications // ignore: cast_nullable_to_non_nullable
as List<NotificationModel>,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,hasMorePages: null == hasMorePages ? _self.hasMorePages : hasMorePages // ignore: cast_nullable_to_non_nullable
as bool,filterUnreadOnly: null == filterUnreadOnly ? _self.filterUnreadOnly : filterUnreadOnly // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
