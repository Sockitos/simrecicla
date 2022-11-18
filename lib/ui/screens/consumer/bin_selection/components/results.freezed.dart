// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'results.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ResultsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() packageResults,
    required TResult Function(String componentId) componentResults,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? packageResults,
    TResult? Function(String componentId)? componentResults,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? packageResults,
    TResult Function(String componentId)? componentResults,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PackageResults value) packageResults,
    required TResult Function(ComponentResults value) componentResults,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PackageResults value)? packageResults,
    TResult? Function(ComponentResults value)? componentResults,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PackageResults value)? packageResults,
    TResult Function(ComponentResults value)? componentResults,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResultsStateCopyWith<$Res> {
  factory $ResultsStateCopyWith(
          ResultsState value, $Res Function(ResultsState) then) =
      _$ResultsStateCopyWithImpl<$Res, ResultsState>;
}

/// @nodoc
class _$ResultsStateCopyWithImpl<$Res, $Val extends ResultsState>
    implements $ResultsStateCopyWith<$Res> {
  _$ResultsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$PackageResultsCopyWith<$Res> {
  factory _$$PackageResultsCopyWith(
          _$PackageResults value, $Res Function(_$PackageResults) then) =
      __$$PackageResultsCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PackageResultsCopyWithImpl<$Res>
    extends _$ResultsStateCopyWithImpl<$Res, _$PackageResults>
    implements _$$PackageResultsCopyWith<$Res> {
  __$$PackageResultsCopyWithImpl(
      _$PackageResults _value, $Res Function(_$PackageResults) _then)
      : super(_value, _then);
}

/// @nodoc

class _$PackageResults implements PackageResults {
  const _$PackageResults();

  @override
  String toString() {
    return 'ResultsState.packageResults()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$PackageResults);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() packageResults,
    required TResult Function(String componentId) componentResults,
  }) {
    return packageResults();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? packageResults,
    TResult? Function(String componentId)? componentResults,
  }) {
    return packageResults?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? packageResults,
    TResult Function(String componentId)? componentResults,
    required TResult orElse(),
  }) {
    if (packageResults != null) {
      return packageResults();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PackageResults value) packageResults,
    required TResult Function(ComponentResults value) componentResults,
  }) {
    return packageResults(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PackageResults value)? packageResults,
    TResult? Function(ComponentResults value)? componentResults,
  }) {
    return packageResults?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PackageResults value)? packageResults,
    TResult Function(ComponentResults value)? componentResults,
    required TResult orElse(),
  }) {
    if (packageResults != null) {
      return packageResults(this);
    }
    return orElse();
  }
}

abstract class PackageResults implements ResultsState {
  const factory PackageResults() = _$PackageResults;
}

/// @nodoc
abstract class _$$ComponentResultsCopyWith<$Res> {
  factory _$$ComponentResultsCopyWith(
          _$ComponentResults value, $Res Function(_$ComponentResults) then) =
      __$$ComponentResultsCopyWithImpl<$Res>;
  @useResult
  $Res call({String componentId});
}

/// @nodoc
class __$$ComponentResultsCopyWithImpl<$Res>
    extends _$ResultsStateCopyWithImpl<$Res, _$ComponentResults>
    implements _$$ComponentResultsCopyWith<$Res> {
  __$$ComponentResultsCopyWithImpl(
      _$ComponentResults _value, $Res Function(_$ComponentResults) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? componentId = null,
  }) {
    return _then(_$ComponentResults(
      componentId: null == componentId
          ? _value.componentId
          : componentId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ComponentResults implements ComponentResults {
  const _$ComponentResults({required this.componentId});

  @override
  final String componentId;

  @override
  String toString() {
    return 'ResultsState.componentResults(componentId: $componentId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ComponentResults &&
            (identical(other.componentId, componentId) ||
                other.componentId == componentId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, componentId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ComponentResultsCopyWith<_$ComponentResults> get copyWith =>
      __$$ComponentResultsCopyWithImpl<_$ComponentResults>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() packageResults,
    required TResult Function(String componentId) componentResults,
  }) {
    return componentResults(componentId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? packageResults,
    TResult? Function(String componentId)? componentResults,
  }) {
    return componentResults?.call(componentId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? packageResults,
    TResult Function(String componentId)? componentResults,
    required TResult orElse(),
  }) {
    if (componentResults != null) {
      return componentResults(componentId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PackageResults value) packageResults,
    required TResult Function(ComponentResults value) componentResults,
  }) {
    return componentResults(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PackageResults value)? packageResults,
    TResult? Function(ComponentResults value)? componentResults,
  }) {
    return componentResults?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PackageResults value)? packageResults,
    TResult Function(ComponentResults value)? componentResults,
    required TResult orElse(),
  }) {
    if (componentResults != null) {
      return componentResults(this);
    }
    return orElse();
  }
}

abstract class ComponentResults implements ResultsState {
  const factory ComponentResults({required final String componentId}) =
      _$ComponentResults;

  String get componentId;
  @JsonKey(ignore: true)
  _$$ComponentResultsCopyWith<_$ComponentResults> get copyWith =>
      throw _privateConstructorUsedError;
}
