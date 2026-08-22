// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'project_list_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProjectListResponse {

 List<Project> get projects; int get totalCount;
/// Create a copy of ProjectListResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProjectListResponseCopyWith<ProjectListResponse> get copyWith => _$ProjectListResponseCopyWithImpl<ProjectListResponse>(this as ProjectListResponse, _$identity);

  /// Serializes this ProjectListResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProjectListResponse&&const DeepCollectionEquality().equals(other.projects, projects)&&(identical(other.totalCount, totalCount) || other.totalCount == totalCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(projects),totalCount);

@override
String toString() {
  return 'ProjectListResponse(projects: $projects, totalCount: $totalCount)';
}


}

/// @nodoc
abstract mixin class $ProjectListResponseCopyWith<$Res>  {
  factory $ProjectListResponseCopyWith(ProjectListResponse value, $Res Function(ProjectListResponse) _then) = _$ProjectListResponseCopyWithImpl;
@useResult
$Res call({
 List<Project> projects, int totalCount
});




}
/// @nodoc
class _$ProjectListResponseCopyWithImpl<$Res>
    implements $ProjectListResponseCopyWith<$Res> {
  _$ProjectListResponseCopyWithImpl(this._self, this._then);

  final ProjectListResponse _self;
  final $Res Function(ProjectListResponse) _then;

/// Create a copy of ProjectListResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? projects = null,Object? totalCount = null,}) {
  return _then(ProjectListResponse(
projects: null == projects ? _self.projects : projects // ignore: cast_nullable_to_non_nullable
as List<Project>,totalCount: null == totalCount ? _self.totalCount : totalCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ProjectListResponse].
extension ProjectListResponsePatterns on ProjectListResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProjectListResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProjectListResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProjectListResponse value)  $default,){
final _that = this;
switch (_that) {
case _ProjectListResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProjectListResponse value)?  $default,){
final _that = this;
switch (_that) {
case _ProjectListResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Project> projects,  int totalCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProjectListResponse() when $default != null:
return $default(_that.projects,_that.totalCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Project> projects,  int totalCount)  $default,) {final _that = this;
switch (_that) {
case _ProjectListResponse():
return $default(_that.projects,_that.totalCount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Project> projects,  int totalCount)?  $default,) {final _that = this;
switch (_that) {
case _ProjectListResponse() when $default != null:
return $default(_that.projects,_that.totalCount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProjectListResponse implements ProjectListResponse {
  const _ProjectListResponse({required  List<Project> projects, this.totalCount = 0}): _projects = projects;
  factory _ProjectListResponse.fromJson(Map<String, dynamic> json) => _$ProjectListResponseFromJson(json);

 final  List<Project> _projects;
@override List<Project> get projects {
  if (_projects is EqualUnmodifiableListView) return _projects;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_projects);
}

@override@JsonKey() final  int totalCount;

/// Create a copy of ProjectListResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProjectListResponseCopyWith<_ProjectListResponse> get copyWith => __$ProjectListResponseCopyWithImpl<_ProjectListResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProjectListResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProjectListResponse&&const DeepCollectionEquality().equals(other._projects, _projects)&&(identical(other.totalCount, totalCount) || other.totalCount == totalCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_projects),totalCount);

@override
String toString() {
  return 'ProjectListResponse(projects: $projects, totalCount: $totalCount)';
}


}

/// @nodoc
abstract mixin class _$ProjectListResponseCopyWith<$Res> implements $ProjectListResponseCopyWith<$Res> {
  factory _$ProjectListResponseCopyWith(_ProjectListResponse value, $Res Function(_ProjectListResponse) _then) = __$ProjectListResponseCopyWithImpl;
@override @useResult
$Res call({
 List<Project> projects, int totalCount
});




}
/// @nodoc
class __$ProjectListResponseCopyWithImpl<$Res>
    implements _$ProjectListResponseCopyWith<$Res> {
  __$ProjectListResponseCopyWithImpl(this._self, this._then);

  final _ProjectListResponse _self;
  final $Res Function(_ProjectListResponse) _then;

/// Create a copy of ProjectListResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? projects = null,Object? totalCount = null,}) {
  return _then(_ProjectListResponse(
projects: null == projects ? _self._projects : projects // ignore: cast_nullable_to_non_nullable
as List<Project>,totalCount: null == totalCount ? _self.totalCount : totalCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
