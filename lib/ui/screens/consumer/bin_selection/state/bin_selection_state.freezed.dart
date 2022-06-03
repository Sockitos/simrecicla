// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'bin_selection_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BinSelectionState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() packageResults,
    required TResult Function(String componentId) componentResults,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? packageResults,
    TResult Function(String componentId)? componentResults,
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
    TResult Function(PackageResults value)? packageResults,
    TResult Function(ComponentResults value)? componentResults,
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
abstract class $BinSelectionStateCopyWith<$Res> {
  factory $BinSelectionStateCopyWith(
          BinSelectionState value, $Res Function(BinSelectionState) then) =
      _$BinSelectionStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$BinSelectionStateCopyWithImpl<$Res>
    implements $BinSelectionStateCopyWith<$Res> {
  _$BinSelectionStateCopyWithImpl(this._value, this._then);

  final BinSelectionState _value;
  // ignore: unused_field
  final $Res Function(BinSelectionState) _then;
}

/// @nodoc
abstract class _$$PackageResultsCopyWith<$Res> {
  factory _$$PackageResultsCopyWith(
          _$PackageResults value, $Res Function(_$PackageResults) then) =
      __$$PackageResultsCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PackageResultsCopyWithImpl<$Res>
    extends _$BinSelectionStateCopyWithImpl<$Res>
    implements _$$PackageResultsCopyWith<$Res> {
  __$$PackageResultsCopyWithImpl(
      _$PackageResults _value, $Res Function(_$PackageResults) _then)
      : super(_value, (v) => _then(v as _$PackageResults));

  @override
  _$PackageResults get _value => super._value as _$PackageResults;
}

/// @nodoc

class _$PackageResults implements PackageResults {
  const _$PackageResults();

  @override
  String toString() {
    return 'BinSelectionState.packageResults()';
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
    TResult Function()? packageResults,
    TResult Function(String componentId)? componentResults,
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
    TResult Function(PackageResults value)? packageResults,
    TResult Function(ComponentResults value)? componentResults,
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

abstract class PackageResults implements BinSelectionState {
  const factory PackageResults() = _$PackageResults;
}

/// @nodoc
abstract class _$$ComponentResultsCopyWith<$Res> {
  factory _$$ComponentResultsCopyWith(
          _$ComponentResults value, $Res Function(_$ComponentResults) then) =
      __$$ComponentResultsCopyWithImpl<$Res>;
  $Res call({String componentId});
}

/// @nodoc
class __$$ComponentResultsCopyWithImpl<$Res>
    extends _$BinSelectionStateCopyWithImpl<$Res>
    implements _$$ComponentResultsCopyWith<$Res> {
  __$$ComponentResultsCopyWithImpl(
      _$ComponentResults _value, $Res Function(_$ComponentResults) _then)
      : super(_value, (v) => _then(v as _$ComponentResults));

  @override
  _$ComponentResults get _value => super._value as _$ComponentResults;

  @override
  $Res call({
    Object? componentId = freezed,
  }) {
    return _then(_$ComponentResults(
      componentId: componentId == freezed
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
    return 'BinSelectionState.componentResults(componentId: $componentId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ComponentResults &&
            const DeepCollectionEquality()
                .equals(other.componentId, componentId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(componentId));

  @JsonKey(ignore: true)
  @override
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
    TResult Function()? packageResults,
    TResult Function(String componentId)? componentResults,
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
    TResult Function(PackageResults value)? packageResults,
    TResult Function(ComponentResults value)? componentResults,
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

abstract class ComponentResults implements BinSelectionState {
  const factory ComponentResults({required final String componentId}) =
      _$ComponentResults;

  String get componentId => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$ComponentResultsCopyWith<_$ComponentResults> get copyWith =>
      throw _privateConstructorUsedError;
}
