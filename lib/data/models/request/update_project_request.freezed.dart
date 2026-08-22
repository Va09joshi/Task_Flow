// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_project_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UpdateProjectRequest {

 String get id; String? get name; String? get description; String? get status;
/// Create a copy of UpdateProjectRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateProjectRequestCopyWith<UpdateProjectRequest> get copyWith => _$UpdateProjectRequestCopyWithImpl<UpdateProjectRequest>(this as UpdateProjectRequest, _$identity);

  /// Serializes this UpdateProjectRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateProjectRequest&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,status);

@override
String toString() {
  return 'UpdateProjectRequest(id: $id, name: $name, description: $description, status: $status)';
}


}

/// @nodoc
abstract mixin class $UpdateProjectRequestCopyWith<$Res>  {
  factory $UpdateProjectRequestCopyWith(UpdateProjectRequest value, $Res Function(UpdateProjectRequest) _then) = _$UpdateProjectRequestCopyWithImpl;
@useResult
$Res call({
 String id, String? name, String? description, String? status
});




}
/// @nodoc
class _$UpdateProjectRequestCopyWithImpl<$Res>
    implements $UpdateProjectRequestCopyWith<$Res> {
  _$UpdateProjectRequestCopyWithImpl(this._self, this._then);

  final UpdateProjectRequest _self;
  final $Res Function(UpdateProjectRequest) _then;

/// Create a copy of UpdateProjectRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = freezed,Object? description = freezed,Object? status = freezed,}) {
  return _then(UpdateProjectRequest(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [UpdateProjectRequest].
extension UpdateProjectRequestPatterns on UpdateProjectRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UpdateProjectRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UpdateProjectRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UpdateProjectRequest value)  $default,){
final _that = this;
switch (_that) {
case _UpdateProjectRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UpdateProjectRequest value)?  $default,){
final _that = this;
switch (_that) {
case _UpdateProjectRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String? name,  String? description,  String? status)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UpdateProjectRequest() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.status);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String? name,  String? description,  String? status)  $default,) {final _that = this;
switch (_that) {
case _UpdateProjectRequest():
return $default(_that.id,_that.name,_that.description,_that.status);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String? name,  String? description,  String? status)?  $default,) {final _that = this;
switch (_that) {
case _UpdateProjectRequest() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.status);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UpdateProjectRequest implements UpdateProjectRequest {
  const _UpdateProjectRequest({required this.id, this.name, this.description, this.status});
  factory _UpdateProjectRequest.fromJson(Map<String, dynamic> json) => _$UpdateProjectRequestFromJson(json);

@override final  String id;
@override final  String? name;
@override final  String? description;
@override final  String? status;

/// Create a copy of UpdateProjectRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateProjectRequestCopyWith<_UpdateProjectRequest> get copyWith => __$UpdateProjectRequestCopyWithImpl<_UpdateProjectRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UpdateProjectRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateProjectRequest&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,status);

@override
String toString() {
  return 'UpdateProjectRequest(id: $id, name: $name, description: $description, status: $status)';
}


}

/// @nodoc
abstract mixin class _$UpdateProjectRequestCopyWith<$Res> implements $UpdateProjectRequestCopyWith<$Res> {
  factory _$UpdateProjectRequestCopyWith(_UpdateProjectRequest value, $Res Function(_UpdateProjectRequest) _then) = __$UpdateProjectRequestCopyWithImpl;
@override @useResult
$Res call({
 String id, String? name, String? description, String? status
});




}
/// @nodoc
class __$UpdateProjectRequestCopyWithImpl<$Res>
    implements _$UpdateProjectRequestCopyWith<$Res> {
  __$UpdateProjectRequestCopyWithImpl(this._self, this._then);

  final _UpdateProjectRequest _self;
  final $Res Function(_UpdateProjectRequest) _then;

/// Create a copy of UpdateProjectRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = freezed,Object? description = freezed,Object? status = freezed,}) {
  return _then(_UpdateProjectRequest(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
