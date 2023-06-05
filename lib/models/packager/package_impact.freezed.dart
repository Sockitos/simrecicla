// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'package_impact.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

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
      _$PackageImpactCopyWithImpl<$Res, PackageImpact>;
  @useResult
  $Res call(
      {double producao, double incorporacao, double eol, double impacteTotal});
}

/// @nodoc
class _$PackageImpactCopyWithImpl<$Res, $Val extends PackageImpact>
    implements $PackageImpactCopyWith<$Res> {
  _$PackageImpactCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? producao = null,
    Object? incorporacao = null,
    Object? eol = null,
    Object? impacteTotal = null,
  }) {
    return _then(_value.copyWith(
      producao: null == producao
          ? _value.producao
          : producao // ignore: cast_nullable_to_non_nullable
              as double,
      incorporacao: null == incorporacao
          ? _value.incorporacao
          : incorporacao // ignore: cast_nullable_to_non_nullable
              as double,
      eol: null == eol
          ? _value.eol
          : eol // ignore: cast_nullable_to_non_nullable
              as double,
      impacteTotal: null == impacteTotal
          ? _value.impacteTotal
          : impacteTotal // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PackageImpactCopyWith<$Res>
    implements $PackageImpactCopyWith<$Res> {
  factory _$$_PackageImpactCopyWith(
          _$_PackageImpact value, $Res Function(_$_PackageImpact) then) =
      __$$_PackageImpactCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double producao, double incorporacao, double eol, double impacteTotal});
}

/// @nodoc
class __$$_PackageImpactCopyWithImpl<$Res>
    extends _$PackageImpactCopyWithImpl<$Res, _$_PackageImpact>
    implements _$$_PackageImpactCopyWith<$Res> {
  __$$_PackageImpactCopyWithImpl(
      _$_PackageImpact _value, $Res Function(_$_PackageImpact) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? producao = null,
    Object? incorporacao = null,
    Object? eol = null,
    Object? impacteTotal = null,
  }) {
    return _then(_$_PackageImpact(
      producao: null == producao
          ? _value.producao
          : producao // ignore: cast_nullable_to_non_nullable
              as double,
      incorporacao: null == incorporacao
          ? _value.incorporacao
          : incorporacao // ignore: cast_nullable_to_non_nullable
              as double,
      eol: null == eol
          ? _value.eol
          : eol // ignore: cast_nullable_to_non_nullable
              as double,
      impacteTotal: null == impacteTotal
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
            other is _$_PackageImpact &&
            (identical(other.producao, producao) ||
                other.producao == producao) &&
            (identical(other.incorporacao, incorporacao) ||
                other.incorporacao == incorporacao) &&
            (identical(other.eol, eol) || other.eol == eol) &&
            (identical(other.impacteTotal, impacteTotal) ||
                other.impacteTotal == impacteTotal));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, producao, incorporacao, eol, impacteTotal);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PackageImpactCopyWith<_$_PackageImpact> get copyWith =>
      __$$_PackageImpactCopyWithImpl<_$_PackageImpact>(this, _$identity);
}

abstract class _PackageImpact extends PackageImpact {
  const factory _PackageImpact(
      {required final double producao,
      required final double incorporacao,
      required final double eol,
      required final double impacteTotal}) = _$_PackageImpact;
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
  _$$_PackageImpactCopyWith<_$_PackageImpact> get copyWith =>
      throw _privateConstructorUsedError;
}
