// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_project_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CreateProjectRequest {

 String get name; String get description;@JsonKey(name: 'org_id') String get orgId; String get status;
/// Create a copy of CreateProjectRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateProjectRequestCopyWith<CreateProjectRequest> get copyWith => _$CreateProjectRequestCopyWithImpl<CreateProjectRequest>(this as CreateProjectRequest, _$identity);

  /// Serializes this CreateProjectRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateProjectRequest&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.orgId, orgId) || other.orgId == orgId)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,description,orgId,status);

@override
String toString() {
  return 'CreateProjectRequest(name: $name, description: $description, orgId: $orgId, status: $status)';
}


}

/// @nodoc
abstract mixin class $CreateProjectRequestCopyWith<$Res>  {
  factory $CreateProjectRequestCopyWith(CreateProjectRequest value, $Res Function(CreateProjectRequest) _then) = _$CreateProjectRequestCopyWithImpl;
@useResult
$Res call({
 String name, String description,@JsonKey(name: 'org_id') String orgId, String status
});




}
/// @nodoc
class _$CreateProjectRequestCopyWithImpl<$Res>
    implements $CreateProjectRequestCopyWith<$Res> {
  _$CreateProjectRequestCopyWithImpl(this._self, this._then);

  final CreateProjectRequest _self;
  final $Res Function(CreateProjectRequest) _then;

/// Create a copy of CreateProjectRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? description = null,Object? orgId = null,Object? status = null,}) {
  return _then(CreateProjectRequest(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,orgId: null == orgId ? _self.orgId : orgId // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CreateProjectRequest].
extension CreateProjectRequestPatterns on CreateProjectRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateProjectRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateProjectRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateProjectRequest value)  $default,){
final _that = this;
switch (_that) {
case _CreateProjectRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateProjectRequest value)?  $default,){
final _that = this;
switch (_that) {
case _CreateProjectRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String description, @JsonKey(name: 'org_id')  String orgId,  String status)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateProjectRequest() when $default != null:
return $default(_that.name,_that.description,_that.orgId,_that.status);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String description, @JsonKey(name: 'org_id')  String orgId,  String status)  $default,) {final _that = this;
switch (_that) {
case _CreateProjectRequest():
return $default(_that.name,_that.description,_that.orgId,_that.status);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String description, @JsonKey(name: 'org_id')  String orgId,  String status)?  $default,) {final _that = this;
switch (_that) {
case _CreateProjectRequest() when $default != null:
return $default(_that.name,_that.description,_that.orgId,_that.status);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CreateProjectRequest implements CreateProjectRequest {
  const _CreateProjectRequest({required this.name, required this.description, @JsonKey(name: 'org_id') required this.orgId, this.status = 'active'});
  factory _CreateProjectRequest.fromJson(Map<String, dynamic> json) => _$CreateProjectRequestFromJson(json);

@override final  String name;
@override final  String description;
@override@JsonKey(name: 'org_id') final  String orgId;
@override@JsonKey() final  String status;

/// Create a copy of CreateProjectRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateProjectRequestCopyWith<_CreateProjectRequest> get copyWith => __$CreateProjectRequestCopyWithImpl<_CreateProjectRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreateProjectRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateProjectRequest&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.orgId, orgId) || other.orgId == orgId)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,description,orgId,status);

@override
String toString() {
  return 'CreateProjectRequest(name: $name, description: $description, orgId: $orgId, status: $status)';
}


}

/// @nodoc
abstract mixin class _$CreateProjectRequestCopyWith<$Res> implements $CreateProjectRequestCopyWith<$Res> {
  factory _$CreateProjectRequestCopyWith(_CreateProjectRequest value, $Res Function(_CreateProjectRequest) _then) = __$CreateProjectRequestCopyWithImpl;
@override @useResult
$Res call({
 String name, String description,@JsonKey(name: 'org_id') String orgId, String status
});




}
/// @nodoc
class __$CreateProjectRequestCopyWithImpl<$Res>
    implements _$CreateProjectRequestCopyWith<$Res> {
  __$CreateProjectRequestCopyWithImpl(this._self, this._then);

  final _CreateProjectRequest _self;
  final $Res Function(_CreateProjectRequest) _then;

/// Create a copy of CreateProjectRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? description = null,Object? orgId = null,Object? status = null,}) {
  return _then(_CreateProjectRequest(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,orgId: null == orgId ? _self.orgId : orgId // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
