// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'package_impact.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$PackageImpactTearOff {
  const _$PackageImpactTearOff();

  _PackageImpact call(
      {required double producao,
      required double incorporacao,
      required double eol,
      required double impacteTotal}) {
    return _PackageImpact(
      producao: producao,
      incorporacao: incorporacao,
      eol: eol,
      impacteTotal: impacteTotal,
    );
  }
}

/// @nodoc
const $PackageImpact = _$PackageImpactTearOff();

/// @nodoc
mixin _$PackageImpact {
  double get producao => throw _privateConstructorUsedError;
  double get incorporacao => throw _privateConstructorUsedError;
  double get eol => throw _privateConstructorUsedError;
  double get impacteTotal => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PackageImpactCopyWith<PackageImpact> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PackageImpactCopyWith<$Res> {
  factory $PackageImpactCopyWith(
          PackageImpact value, $Res Function(PackageImpact) then) =
      _$PackageImpactCopyWithImpl<$Res>;
  $Res call(
      {double producao, double incorporacao, double eol, double impacteTotal});
}

/// @nodoc
class _$PackageImpactCopyWithImpl<$Res>
    implements $PackageImpactCopyWith<$Res> {
  _$PackageImpactCopyWithImpl(this._value, this._then);

  final PackageImpact _value;
  // ignore: unused_field
  final $Res Function(PackageImpact) _then;

  @override
  $Res call({
    Object? producao = freezed,
    Object? incorporacao = freezed,
    Object? eol = freezed,
    Object? impacteTotal = freezed,
  }) {
    return _then(_value.copyWith(
      producao: producao == freezed
          ? _value.producao
          : producao // ignore: cast_nullable_to_non_nullable
              as double,
      incorporacao: incorporacao == freezed
          ? _value.incorporacao
          : incorporacao // ignore: cast_nullable_to_non_nullable
              as double,
      eol: eol == freezed
          ? _value.eol
          : eol // ignore: cast_nullable_to_non_nullable
              as double,
      impacteTotal: impacteTotal == freezed
          ? _value.impacteTotal
          : impacteTotal // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
abstract class _$PackageImpactCopyWith<$Res>
    implements $PackageImpactCopyWith<$Res> {
  factory _$PackageImpactCopyWith(
          _PackageImpact value, $Res Function(_PackageImpact) then) =
      __$PackageImpactCopyWithImpl<$Res>;
  @override
  $Res call(
      {double producao, double incorporacao, double eol, double impacteTotal});
}

/// @nodoc
class __$PackageImpactCopyWithImpl<$Res>
    extends _$PackageImpactCopyWithImpl<$Res>
    implements _$PackageImpactCopyWith<$Res> {
  __$PackageImpactCopyWithImpl(
      _PackageImpact _value, $Res Function(_PackageImpact) _then)
      : super(_value, (v) => _then(v as _PackageImpact));

  @override
  _PackageImpact get _value => super._value as _PackageImpact;

  @override
  $Res call({
    Object? producao = freezed,
    Object? incorporacao = freezed,
    Object? eol = freezed,
    Object? impacteTotal = freezed,
  }) {
    return _then(_PackageImpact(
      producao: producao == freezed
          ? _value.producao
          : producao // ignore: cast_nullable_to_non_nullable
              as double,
      incorporacao: incorporacao == freezed
          ? _value.incorporacao
          : incorporacao // ignore: cast_nullable_to_non_nullable
              as double,
      eol: eol == freezed
          ? _value.eol
          : eol // ignore: cast_nullable_to_non_nullable
              as double,
      impacteTotal: impacteTotal == freezed
          ? _value.impacteTotal
          : impacteTotal // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$_PackageImpact extends _PackageImpact {
  const _$_PackageImpact(
      {required this.producao,
      required this.incorporacao,
      required this.eol,
      required this.impacteTotal})
      : super._();

  @override
  final double producao;
  @override
  final double incorporacao;
  @override
  final double eol;
  @override
  final double impacteTotal;

  @override
  String toString() {
    return 'PackageImpact(producao: $producao, incorporacao: $incorporacao, eol: $eol, impacteTotal: $impacteTotal)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PackageImpact &&
            const DeepCollectionEquality().equals(other.producao, producao) &&
            const DeepCollectionEquality()
                .equals(other.incorporacao, incorporacao) &&
            const DeepCollectionEquality().equals(other.eol, eol) &&
            const DeepCollectionEquality()
                .equals(other.impacteTotal, impacteTotal));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(producao),
      const DeepCollectionEquality().hash(incorporacao),
      const DeepCollectionEquality().hash(eol),
      const DeepCollectionEquality().hash(impacteTotal));

  @JsonKey(ignore: true)
  @override
  _$PackageImpactCopyWith<_PackageImpact> get copyWith =>
      __$PackageImpactCopyWithImpl<_PackageImpact>(this, _$identity);
}

abstract class _PackageImpact extends PackageImpact {
  const factory _PackageImpact(
      {required double producao,
      required double incorporacao,
      required double eol,
      required double impacteTotal}) = _$_PackageImpact;
  const _PackageImpact._() : super._();

  @override
  double get producao;
  @override
  double get incorporacao;
  @override
  double get eol;
  @override
  double get impacteTotal;
  @override
  @JsonKey(ignore: true)
  _$PackageImpactCopyWith<_PackageImpact> get copyWith =>
      throw _privateConstructorUsedError;
}
