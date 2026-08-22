// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'org_member_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OrgMember {

@JsonKey(name: 'org_id') String get orgId;@JsonKey(name: 'user_id') String get userId; String get role;
/// Create a copy of OrgMember
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrgMemberCopyWith<OrgMember> get copyWith => _$OrgMemberCopyWithImpl<OrgMember>(this as OrgMember, _$identity);

  /// Serializes this OrgMember to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrgMember&&(identical(other.orgId, orgId) || other.orgId == orgId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.role, role) || other.role == role));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,orgId,userId,role);

@override
String toString() {
  return 'OrgMember(orgId: $orgId, userId: $userId, role: $role)';
}


}

/// @nodoc
abstract mixin class $OrgMemberCopyWith<$Res>  {
  factory $OrgMemberCopyWith(OrgMember value, $Res Function(OrgMember) _then) = _$OrgMemberCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'org_id') String orgId,@JsonKey(name: 'user_id') String userId, String role
});




}
/// @nodoc
class _$OrgMemberCopyWithImpl<$Res>
    implements $OrgMemberCopyWith<$Res> {
  _$OrgMemberCopyWithImpl(this._self, this._then);

  final OrgMember _self;
  final $Res Function(OrgMember) _then;

/// Create a copy of OrgMember
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? orgId = null,Object? userId = null,Object? role = null,}) {
  return _then(OrgMember(
orgId: null == orgId ? _self.orgId : orgId // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [OrgMember].
extension OrgMemberPatterns on OrgMember {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrgMember value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrgMember() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrgMember value)  $default,){
final _that = this;
switch (_that) {
case _OrgMember():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrgMember value)?  $default,){
final _that = this;
switch (_that) {
case _OrgMember() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'org_id')  String orgId, @JsonKey(name: 'user_id')  String userId,  String role)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrgMember() when $default != null:
return $default(_that.orgId,_that.userId,_that.role);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'org_id')  String orgId, @JsonKey(name: 'user_id')  String userId,  String role)  $default,) {final _that = this;
switch (_that) {
case _OrgMember():
return $default(_that.orgId,_that.userId,_that.role);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'org_id')  String orgId, @JsonKey(name: 'user_id')  String userId,  String role)?  $default,) {final _that = this;
switch (_that) {
case _OrgMember() when $default != null:
return $default(_that.orgId,_that.userId,_that.role);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OrgMember implements OrgMember {
  const _OrgMember({@JsonKey(name: 'org_id') required this.orgId, @JsonKey(name: 'user_id') required this.userId, required this.role});
  factory _OrgMember.fromJson(Map<String, dynamic> json) => _$OrgMemberFromJson(json);

@override@JsonKey(name: 'org_id') final  String orgId;
@override@JsonKey(name: 'user_id') final  String userId;
@override final  String role;

/// Create a copy of OrgMember
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrgMemberCopyWith<_OrgMember> get copyWith => __$OrgMemberCopyWithImpl<_OrgMember>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrgMemberToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrgMember&&(identical(other.orgId, orgId) || other.orgId == orgId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.role, role) || other.role == role));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,orgId,userId,role);

@override
String toString() {
  return 'OrgMember(orgId: $orgId, userId: $userId, role: $role)';
}


}

/// @nodoc
abstract mixin class _$OrgMemberCopyWith<$Res> implements $OrgMemberCopyWith<$Res> {
  factory _$OrgMemberCopyWith(_OrgMember value, $Res Function(_OrgMember) _then) = __$OrgMemberCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'org_id') String orgId,@JsonKey(name: 'user_id') String userId, String role
});




}
/// @nodoc
class __$OrgMemberCopyWithImpl<$Res>
    implements _$OrgMemberCopyWith<$Res> {
  __$OrgMemberCopyWithImpl(this._self, this._then);

  final _OrgMember _self;
  final $Res Function(_OrgMember) _then;

/// Create a copy of OrgMember
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? orgId = null,Object? userId = null,Object? role = null,}) {
  return _then(_OrgMember(
orgId: null == orgId ? _self.orgId : orgId // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
