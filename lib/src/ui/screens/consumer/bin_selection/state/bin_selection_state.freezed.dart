// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'bin_selection_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$BinSelectionStateTearOff {
  const _$BinSelectionStateTearOff();

  PackageResults packageResults() {
    return const PackageResults();
  }

  ComponentResults componentResults({required String componentId}) {
    return ComponentResults(
      componentId: componentId,
    );
  }
}

/// @nodoc
const $BinSelectionState = _$BinSelectionStateTearOff();

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
abstract class $PackageResultsCopyWith<$Res> {
  factory $PackageResultsCopyWith(
          PackageResults value, $Res Function(PackageResults) then) =
      _$PackageResultsCopyWithImpl<$Res>;
}

/// @nodoc
class _$PackageResultsCopyWithImpl<$Res>
    extends _$BinSelectionStateCopyWithImpl<$Res>
    implements $PackageResultsCopyWith<$Res> {
  _$PackageResultsCopyWithImpl(
      PackageResults _value, $Res Function(PackageResults) _then)
      : super(_value, (v) => _then(v as PackageResults));

  @override
  PackageResults get _value => super._value as PackageResults;
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
        (other.runtimeType == runtimeType && other is PackageResults);
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
abstract class $ComponentResultsCopyWith<$Res> {
  factory $ComponentResultsCopyWith(
          ComponentResults value, $Res Function(ComponentResults) then) =
      _$ComponentResultsCopyWithImpl<$Res>;
  $Res call({String componentId});
}

/// @nodoc
class _$ComponentResultsCopyWithImpl<$Res>
    extends _$BinSelectionStateCopyWithImpl<$Res>
    implements $ComponentResultsCopyWith<$Res> {
  _$ComponentResultsCopyWithImpl(
      ComponentResults _value, $Res Function(ComponentResults) _then)
      : super(_value, (v) => _then(v as ComponentResults));

  @override
  ComponentResults get _value => super._value as ComponentResults;

  @override
  $Res call({
    Object? componentId = freezed,
  }) {
    return _then(ComponentResults(
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
            other is ComponentResults &&
            const DeepCollectionEquality()
                .equals(other.componentId, componentId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(componentId));

  @JsonKey(ignore: true)
  @override
  $ComponentResultsCopyWith<ComponentResults> get copyWith =>
      _$ComponentResultsCopyWithImpl<ComponentResults>(this, _$identity);

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
  const factory ComponentResults({required String componentId}) =
      _$ComponentResults;

  String get componentId;
  @JsonKey(ignore: true)
  $ComponentResultsCopyWith<ComponentResults> get copyWith =>
      throw _privateConstructorUsedError;
}
