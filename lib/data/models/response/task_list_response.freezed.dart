// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_list_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TaskListResponse {

 List<Task> get tasks; int get totalCount;
/// Create a copy of TaskListResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TaskListResponseCopyWith<TaskListResponse> get copyWith => _$TaskListResponseCopyWithImpl<TaskListResponse>(this as TaskListResponse, _$identity);

  /// Serializes this TaskListResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TaskListResponse&&const DeepCollectionEquality().equals(other.tasks, tasks)&&(identical(other.totalCount, totalCount) || other.totalCount == totalCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(tasks),totalCount);

@override
String toString() {
  return 'TaskListResponse(tasks: $tasks, totalCount: $totalCount)';
}


}

/// @nodoc
abstract mixin class $TaskListResponseCopyWith<$Res>  {
  factory $TaskListResponseCopyWith(TaskListResponse value, $Res Function(TaskListResponse) _then) = _$TaskListResponseCopyWithImpl;
@useResult
$Res call({
 List<Task> tasks, int totalCount
});




}
/// @nodoc
class _$TaskListResponseCopyWithImpl<$Res>
    implements $TaskListResponseCopyWith<$Res> {
  _$TaskListResponseCopyWithImpl(this._self, this._then);

  final TaskListResponse _self;
  final $Res Function(TaskListResponse) _then;

/// Create a copy of TaskListResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? tasks = null,Object? totalCount = null,}) {
  return _then(TaskListResponse(
tasks: null == tasks ? _self.tasks : tasks // ignore: cast_nullable_to_non_nullable
as List<Task>,totalCount: null == totalCount ? _self.totalCount : totalCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [TaskListResponse].
extension TaskListResponsePatterns on TaskListResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TaskListResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TaskListResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TaskListResponse value)  $default,){
final _that = this;
switch (_that) {
case _TaskListResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TaskListResponse value)?  $default,){
final _that = this;
switch (_that) {
case _TaskListResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Task> tasks,  int totalCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TaskListResponse() when $default != null:
return $default(_that.tasks,_that.totalCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Task> tasks,  int totalCount)  $default,) {final _that = this;
switch (_that) {
case _TaskListResponse():
return $default(_that.tasks,_that.totalCount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Task> tasks,  int totalCount)?  $default,) {final _that = this;
switch (_that) {
case _TaskListResponse() when $default != null:
return $default(_that.tasks,_that.totalCount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TaskListResponse implements TaskListResponse {
  const _TaskListResponse({required  List<Task> tasks, this.totalCount = 0}): _tasks = tasks;
  factory _TaskListResponse.fromJson(Map<String, dynamic> json) => _$TaskListResponseFromJson(json);

 final  List<Task> _tasks;
@override List<Task> get tasks {
  if (_tasks is EqualUnmodifiableListView) return _tasks;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tasks);
}

@override@JsonKey() final  int totalCount;

/// Create a copy of TaskListResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TaskListResponseCopyWith<_TaskListResponse> get copyWith => __$TaskListResponseCopyWithImpl<_TaskListResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TaskListResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TaskListResponse&&const DeepCollectionEquality().equals(other._tasks, _tasks)&&(identical(other.totalCount, totalCount) || other.totalCount == totalCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_tasks),totalCount);

@override
String toString() {
  return 'TaskListResponse(tasks: $tasks, totalCount: $totalCount)';
}


}

/// @nodoc
abstract mixin class _$TaskListResponseCopyWith<$Res> implements $TaskListResponseCopyWith<$Res> {
  factory _$TaskListResponseCopyWith(_TaskListResponse value, $Res Function(_TaskListResponse) _then) = __$TaskListResponseCopyWithImpl;
@override @useResult
$Res call({
 List<Task> tasks, int totalCount
});




}
/// @nodoc
class __$TaskListResponseCopyWithImpl<$Res>
    implements _$TaskListResponseCopyWith<$Res> {
  __$TaskListResponseCopyWithImpl(this._self, this._then);

  final _TaskListResponse _self;
  final $Res Function(_TaskListResponse) _then;

/// Create a copy of TaskListResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? tasks = null,Object? totalCount = null,}) {
  return _then(_TaskListResponse(
tasks: null == tasks ? _self._tasks : tasks // ignore: cast_nullable_to_non_nullable
as List<Task>,totalCount: null == totalCount ? _self.totalCount : totalCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
