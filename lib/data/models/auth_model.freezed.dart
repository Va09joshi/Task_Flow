// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AuthCredentials {

 String get email; String get password;@JsonKey(name: 'org_id') String get orgId; String get role;
/// Create a copy of AuthCredentials
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthCredentialsCopyWith<AuthCredentials> get copyWith => _$AuthCredentialsCopyWithImpl<AuthCredentials>(this as AuthCredentials, _$identity);

  /// Serializes this AuthCredentials to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthCredentials&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password)&&(identical(other.orgId, orgId) || other.orgId == orgId)&&(identical(other.role, role) || other.role == role));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,email,password,orgId,role);

@override
String toString() {
  return 'AuthCredentials(email: $email, password: $password, orgId: $orgId, role: $role)';
}


}

/// @nodoc
abstract mixin class $AuthCredentialsCopyWith<$Res>  {
  factory $AuthCredentialsCopyWith(AuthCredentials value, $Res Function(AuthCredentials) _then) = _$AuthCredentialsCopyWithImpl;
@useResult
$Res call({
 String email, String password,@JsonKey(name: 'org_id') String orgId, String role
});




}
/// @nodoc
class _$AuthCredentialsCopyWithImpl<$Res>
    implements $AuthCredentialsCopyWith<$Res> {
  _$AuthCredentialsCopyWithImpl(this._self, this._then);

  final AuthCredentials _self;
  final $Res Function(AuthCredentials) _then;

/// Create a copy of AuthCredentials
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? email = null,Object? password = null,Object? orgId = null,Object? role = null,}) {
  return _then(AuthCredentials(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,orgId: null == orgId ? _self.orgId : orgId // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [AuthCredentials].
extension AuthCredentialsPatterns on AuthCredentials {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AuthCredentials value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AuthCredentials() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AuthCredentials value)  $default,){
final _that = this;
switch (_that) {
case _AuthCredentials():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AuthCredentials value)?  $default,){
final _that = this;
switch (_that) {
case _AuthCredentials() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String email,  String password, @JsonKey(name: 'org_id')  String orgId,  String role)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AuthCredentials() when $default != null:
return $default(_that.email,_that.password,_that.orgId,_that.role);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String email,  String password, @JsonKey(name: 'org_id')  String orgId,  String role)  $default,) {final _that = this;
switch (_that) {
case _AuthCredentials():
return $default(_that.email,_that.password,_that.orgId,_that.role);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String email,  String password, @JsonKey(name: 'org_id')  String orgId,  String role)?  $default,) {final _that = this;
switch (_that) {
case _AuthCredentials() when $default != null:
return $default(_that.email,_that.password,_that.orgId,_that.role);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AuthCredentials implements AuthCredentials {
  const _AuthCredentials({required this.email, required this.password, @JsonKey(name: 'org_id') required this.orgId, required this.role});
  factory _AuthCredentials.fromJson(Map<String, dynamic> json) => _$AuthCredentialsFromJson(json);

@override final  String email;
@override final  String password;
@override@JsonKey(name: 'org_id') final  String orgId;
@override final  String role;

/// Create a copy of AuthCredentials
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthCredentialsCopyWith<_AuthCredentials> get copyWith => __$AuthCredentialsCopyWithImpl<_AuthCredentials>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AuthCredentialsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthCredentials&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password)&&(identical(other.orgId, orgId) || other.orgId == orgId)&&(identical(other.role, role) || other.role == role));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,email,password,orgId,role);

@override
String toString() {
  return 'AuthCredentials(email: $email, password: $password, orgId: $orgId, role: $role)';
}


}

/// @nodoc
abstract mixin class _$AuthCredentialsCopyWith<$Res> implements $AuthCredentialsCopyWith<$Res> {
  factory _$AuthCredentialsCopyWith(_AuthCredentials value, $Res Function(_AuthCredentials) _then) = __$AuthCredentialsCopyWithImpl;
@override @useResult
$Res call({
 String email, String password,@JsonKey(name: 'org_id') String orgId, String role
});




}
/// @nodoc
class __$AuthCredentialsCopyWithImpl<$Res>
    implements _$AuthCredentialsCopyWith<$Res> {
  __$AuthCredentialsCopyWithImpl(this._self, this._then);

  final _AuthCredentials _self;
  final $Res Function(_AuthCredentials) _then;

/// Create a copy of AuthCredentials
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? email = null,Object? password = null,Object? orgId = null,Object? role = null,}) {
  return _then(_AuthCredentials(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,orgId: null == orgId ? _self.orgId : orgId // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$AuthResponse {

@JsonKey(name: 'access_token') String get accessToken;@JsonKey(name: 'refresh_token') String get refreshToken;@JsonKey(name: 'access_token_expires_in_seconds') int get accessTokenExpiresInSeconds;@JsonKey(name: 'refresh_token_expires_in_seconds') int get refreshTokenExpiresInSeconds;
/// Create a copy of AuthResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthResponseCopyWith<AuthResponse> get copyWith => _$AuthResponseCopyWithImpl<AuthResponse>(this as AuthResponse, _$identity);

  /// Serializes this AuthResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthResponse&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken)&&(identical(other.refreshToken, refreshToken) || other.refreshToken == refreshToken)&&(identical(other.accessTokenExpiresInSeconds, accessTokenExpiresInSeconds) || other.accessTokenExpiresInSeconds == accessTokenExpiresInSeconds)&&(identical(other.refreshTokenExpiresInSeconds, refreshTokenExpiresInSeconds) || other.refreshTokenExpiresInSeconds == refreshTokenExpiresInSeconds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,accessToken,refreshToken,accessTokenExpiresInSeconds,refreshTokenExpiresInSeconds);

@override
String toString() {
  return 'AuthResponse(accessToken: $accessToken, refreshToken: $refreshToken, accessTokenExpiresInSeconds: $accessTokenExpiresInSeconds, refreshTokenExpiresInSeconds: $refreshTokenExpiresInSeconds)';
}


}

/// @nodoc
abstract mixin class $AuthResponseCopyWith<$Res>  {
  factory $AuthResponseCopyWith(AuthResponse value, $Res Function(AuthResponse) _then) = _$AuthResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'access_token') String accessToken,@JsonKey(name: 'refresh_token') String refreshToken,@JsonKey(name: 'access_token_expires_in_seconds') int accessTokenExpiresInSeconds,@JsonKey(name: 'refresh_token_expires_in_seconds') int refreshTokenExpiresInSeconds
});




}
/// @nodoc
class _$AuthResponseCopyWithImpl<$Res>
    implements $AuthResponseCopyWith<$Res> {
  _$AuthResponseCopyWithImpl(this._self, this._then);

  final AuthResponse _self;
  final $Res Function(AuthResponse) _then;

/// Create a copy of AuthResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? accessToken = null,Object? refreshToken = null,Object? accessTokenExpiresInSeconds = null,Object? refreshTokenExpiresInSeconds = null,}) {
  return _then(AuthResponse(
accessToken: null == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String,refreshToken: null == refreshToken ? _self.refreshToken : refreshToken // ignore: cast_nullable_to_non_nullable
as String,accessTokenExpiresInSeconds: null == accessTokenExpiresInSeconds ? _self.accessTokenExpiresInSeconds : accessTokenExpiresInSeconds // ignore: cast_nullable_to_non_nullable
as int,refreshTokenExpiresInSeconds: null == refreshTokenExpiresInSeconds ? _self.refreshTokenExpiresInSeconds : refreshTokenExpiresInSeconds // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [AuthResponse].
extension AuthResponsePatterns on AuthResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AuthResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AuthResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AuthResponse value)  $default,){
final _that = this;
switch (_that) {
case _AuthResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AuthResponse value)?  $default,){
final _that = this;
switch (_that) {
case _AuthResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'access_token')  String accessToken, @JsonKey(name: 'refresh_token')  String refreshToken, @JsonKey(name: 'access_token_expires_in_seconds')  int accessTokenExpiresInSeconds, @JsonKey(name: 'refresh_token_expires_in_seconds')  int refreshTokenExpiresInSeconds)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AuthResponse() when $default != null:
return $default(_that.accessToken,_that.refreshToken,_that.accessTokenExpiresInSeconds,_that.refreshTokenExpiresInSeconds);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'access_token')  String accessToken, @JsonKey(name: 'refresh_token')  String refreshToken, @JsonKey(name: 'access_token_expires_in_seconds')  int accessTokenExpiresInSeconds, @JsonKey(name: 'refresh_token_expires_in_seconds')  int refreshTokenExpiresInSeconds)  $default,) {final _that = this;
switch (_that) {
case _AuthResponse():
return $default(_that.accessToken,_that.refreshToken,_that.accessTokenExpiresInSeconds,_that.refreshTokenExpiresInSeconds);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'access_token')  String accessToken, @JsonKey(name: 'refresh_token')  String refreshToken, @JsonKey(name: 'access_token_expires_in_seconds')  int accessTokenExpiresInSeconds, @JsonKey(name: 'refresh_token_expires_in_seconds')  int refreshTokenExpiresInSeconds)?  $default,) {final _that = this;
switch (_that) {
case _AuthResponse() when $default != null:
return $default(_that.accessToken,_that.refreshToken,_that.accessTokenExpiresInSeconds,_that.refreshTokenExpiresInSeconds);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AuthResponse implements AuthResponse {
  const _AuthResponse({@JsonKey(name: 'access_token') required this.accessToken, @JsonKey(name: 'refresh_token') required this.refreshToken, @JsonKey(name: 'access_token_expires_in_seconds') required this.accessTokenExpiresInSeconds, @JsonKey(name: 'refresh_token_expires_in_seconds') required this.refreshTokenExpiresInSeconds});
  factory _AuthResponse.fromJson(Map<String, dynamic> json) => _$AuthResponseFromJson(json);

@override@JsonKey(name: 'access_token') final  String accessToken;
@override@JsonKey(name: 'refresh_token') final  String refreshToken;
@override@JsonKey(name: 'access_token_expires_in_seconds') final  int accessTokenExpiresInSeconds;
@override@JsonKey(name: 'refresh_token_expires_in_seconds') final  int refreshTokenExpiresInSeconds;

/// Create a copy of AuthResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthResponseCopyWith<_AuthResponse> get copyWith => __$AuthResponseCopyWithImpl<_AuthResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AuthResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthResponse&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken)&&(identical(other.refreshToken, refreshToken) || other.refreshToken == refreshToken)&&(identical(other.accessTokenExpiresInSeconds, accessTokenExpiresInSeconds) || other.accessTokenExpiresInSeconds == accessTokenExpiresInSeconds)&&(identical(other.refreshTokenExpiresInSeconds, refreshTokenExpiresInSeconds) || other.refreshTokenExpiresInSeconds == refreshTokenExpiresInSeconds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,accessToken,refreshToken,accessTokenExpiresInSeconds,refreshTokenExpiresInSeconds);

@override
String toString() {
  return 'AuthResponse(accessToken: $accessToken, refreshToken: $refreshToken, accessTokenExpiresInSeconds: $accessTokenExpiresInSeconds, refreshTokenExpiresInSeconds: $refreshTokenExpiresInSeconds)';
}


}

/// @nodoc
abstract mixin class _$AuthResponseCopyWith<$Res> implements $AuthResponseCopyWith<$Res> {
  factory _$AuthResponseCopyWith(_AuthResponse value, $Res Function(_AuthResponse) _then) = __$AuthResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'access_token') String accessToken,@JsonKey(name: 'refresh_token') String refreshToken,@JsonKey(name: 'access_token_expires_in_seconds') int accessTokenExpiresInSeconds,@JsonKey(name: 'refresh_token_expires_in_seconds') int refreshTokenExpiresInSeconds
});




}
/// @nodoc
class __$AuthResponseCopyWithImpl<$Res>
    implements _$AuthResponseCopyWith<$Res> {
  __$AuthResponseCopyWithImpl(this._self, this._then);

  final _AuthResponse _self;
  final $Res Function(_AuthResponse) _then;

/// Create a copy of AuthResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? accessToken = null,Object? refreshToken = null,Object? accessTokenExpiresInSeconds = null,Object? refreshTokenExpiresInSeconds = null,}) {
  return _then(_AuthResponse(
accessToken: null == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String,refreshToken: null == refreshToken ? _self.refreshToken : refreshToken // ignore: cast_nullable_to_non_nullable
as String,accessTokenExpiresInSeconds: null == accessTokenExpiresInSeconds ? _self.accessTokenExpiresInSeconds : accessTokenExpiresInSeconds // ignore: cast_nullable_to_non_nullable
as int,refreshTokenExpiresInSeconds: null == refreshTokenExpiresInSeconds ? _self.refreshTokenExpiresInSeconds : refreshTokenExpiresInSeconds // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$AuthMockData {

@JsonKey(name: 'test_credentials') List<AuthCredentials> get testCredentials;@JsonKey(name: 'mock_login_response') AuthResponse get mockLoginResponse;
/// Create a copy of AuthMockData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthMockDataCopyWith<AuthMockData> get copyWith => _$AuthMockDataCopyWithImpl<AuthMockData>(this as AuthMockData, _$identity);

  /// Serializes this AuthMockData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthMockData&&const DeepCollectionEquality().equals(other.testCredentials, testCredentials)&&(identical(other.mockLoginResponse, mockLoginResponse) || other.mockLoginResponse == mockLoginResponse));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(testCredentials),mockLoginResponse);

@override
String toString() {
  return 'AuthMockData(testCredentials: $testCredentials, mockLoginResponse: $mockLoginResponse)';
}


}

/// @nodoc
abstract mixin class $AuthMockDataCopyWith<$Res>  {
  factory $AuthMockDataCopyWith(AuthMockData value, $Res Function(AuthMockData) _then) = _$AuthMockDataCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'test_credentials') List<AuthCredentials> testCredentials,@JsonKey(name: 'mock_login_response') AuthResponse mockLoginResponse
});


$AuthResponseCopyWith<$Res> get mockLoginResponse;

}
/// @nodoc
class _$AuthMockDataCopyWithImpl<$Res>
    implements $AuthMockDataCopyWith<$Res> {
  _$AuthMockDataCopyWithImpl(this._self, this._then);

  final AuthMockData _self;
  final $Res Function(AuthMockData) _then;

/// Create a copy of AuthMockData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? testCredentials = null,Object? mockLoginResponse = null,}) {
  return _then(AuthMockData(
testCredentials: null == testCredentials ? _self.testCredentials : testCredentials // ignore: cast_nullable_to_non_nullable
as List<AuthCredentials>,mockLoginResponse: null == mockLoginResponse ? _self.mockLoginResponse : mockLoginResponse // ignore: cast_nullable_to_non_nullable
as AuthResponse,
  ));
}
/// Create a copy of AuthMockData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AuthResponseCopyWith<$Res> get mockLoginResponse {
  
  return $AuthResponseCopyWith<$Res>(_self.mockLoginResponse, (value) {
    return _then(_self.copyWith(mockLoginResponse: value));
  });
}
}


/// Adds pattern-matching-related methods to [AuthMockData].
extension AuthMockDataPatterns on AuthMockData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AuthMockData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AuthMockData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AuthMockData value)  $default,){
final _that = this;
switch (_that) {
case _AuthMockData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AuthMockData value)?  $default,){
final _that = this;
switch (_that) {
case _AuthMockData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'test_credentials')  List<AuthCredentials> testCredentials, @JsonKey(name: 'mock_login_response')  AuthResponse mockLoginResponse)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AuthMockData() when $default != null:
return $default(_that.testCredentials,_that.mockLoginResponse);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'test_credentials')  List<AuthCredentials> testCredentials, @JsonKey(name: 'mock_login_response')  AuthResponse mockLoginResponse)  $default,) {final _that = this;
switch (_that) {
case _AuthMockData():
return $default(_that.testCredentials,_that.mockLoginResponse);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'test_credentials')  List<AuthCredentials> testCredentials, @JsonKey(name: 'mock_login_response')  AuthResponse mockLoginResponse)?  $default,) {final _that = this;
switch (_that) {
case _AuthMockData() when $default != null:
return $default(_that.testCredentials,_that.mockLoginResponse);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AuthMockData implements AuthMockData {
  const _AuthMockData({@JsonKey(name: 'test_credentials') required  List<AuthCredentials> testCredentials, @JsonKey(name: 'mock_login_response') required this.mockLoginResponse}): _testCredentials = testCredentials;
  factory _AuthMockData.fromJson(Map<String, dynamic> json) => _$AuthMockDataFromJson(json);

 final  List<AuthCredentials> _testCredentials;
@override@JsonKey(name: 'test_credentials') List<AuthCredentials> get testCredentials {
  if (_testCredentials is EqualUnmodifiableListView) return _testCredentials;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_testCredentials);
}

@override@JsonKey(name: 'mock_login_response') final  AuthResponse mockLoginResponse;

/// Create a copy of AuthMockData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthMockDataCopyWith<_AuthMockData> get copyWith => __$AuthMockDataCopyWithImpl<_AuthMockData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AuthMockDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthMockData&&const DeepCollectionEquality().equals(other._testCredentials, _testCredentials)&&(identical(other.mockLoginResponse, mockLoginResponse) || other.mockLoginResponse == mockLoginResponse));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_testCredentials),mockLoginResponse);

@override
String toString() {
  return 'AuthMockData(testCredentials: $testCredentials, mockLoginResponse: $mockLoginResponse)';
}


}

/// @nodoc
abstract mixin class _$AuthMockDataCopyWith<$Res> implements $AuthMockDataCopyWith<$Res> {
  factory _$AuthMockDataCopyWith(_AuthMockData value, $Res Function(_AuthMockData) _then) = __$AuthMockDataCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'test_credentials') List<AuthCredentials> testCredentials,@JsonKey(name: 'mock_login_response') AuthResponse mockLoginResponse
});


@override $AuthResponseCopyWith<$Res> get mockLoginResponse;

}
/// @nodoc
class __$AuthMockDataCopyWithImpl<$Res>
    implements _$AuthMockDataCopyWith<$Res> {
  __$AuthMockDataCopyWithImpl(this._self, this._then);

  final _AuthMockData _self;
  final $Res Function(_AuthMockData) _then;

/// Create a copy of AuthMockData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? testCredentials = null,Object? mockLoginResponse = null,}) {
  return _then(_AuthMockData(
testCredentials: null == testCredentials ? _self._testCredentials : testCredentials // ignore: cast_nullable_to_non_nullable
as List<AuthCredentials>,mockLoginResponse: null == mockLoginResponse ? _self.mockLoginResponse : mockLoginResponse // ignore: cast_nullable_to_non_nullable
as AuthResponse,
  ));
}

/// Create a copy of AuthMockData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AuthResponseCopyWith<$Res> get mockLoginResponse {
  
  return $AuthResponseCopyWith<$Res>(_self.mockLoginResponse, (value) {
    return _then(_self.copyWith(mockLoginResponse: value));
  });
}
}

// dart format on
