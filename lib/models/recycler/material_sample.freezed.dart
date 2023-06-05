// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'material_sample.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MaterialSample {
  double get naoRecuperaveis => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(Map<RMaterial, double> materials, double naoRecuperaveis)
        $default, {
    required TResult Function(
            double ecal,
            double filmePlastico,
            double pet,
            double petOleo,
            double pead,
            double plasticosMistos,
            double metaisFerrosos,
            double metaisNaoFerrosos,
            double naoRecuperaveis)
        pm,
    required TResult Function(double papel, double cartao,
            double jornaisRevistas, double naoRecuperaveis)
        pc,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(Map<RMaterial, double> materials, double naoRecuperaveis)?
        $default, {
    TResult? Function(
            double ecal,
            double filmePlastico,
            double pet,
            double petOleo,
            double pead,
            double plasticosMistos,
            double metaisFerrosos,
            double metaisNaoFerrosos,
            double naoRecuperaveis)?
        pm,
    TResult? Function(double papel, double cartao, double jornaisRevistas,
            double naoRecuperaveis)?
        pc,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(Map<RMaterial, double> materials, double naoRecuperaveis)?
        $default, {
    TResult Function(
            double ecal,
            double filmePlastico,
            double pet,
            double petOleo,
            double pead,
            double plasticosMistos,
            double metaisFerrosos,
            double metaisNaoFerrosos,
            double naoRecuperaveis)?
        pm,
    TResult Function(double papel, double cartao, double jornaisRevistas,
            double naoRecuperaveis)?
        pc,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_MaterialSample value) $default, {
    required TResult Function(_MaterialSamplePM value) pm,
    required TResult Function(_MaterialSamplePC value) pc,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_MaterialSample value)? $default, {
    TResult? Function(_MaterialSamplePM value)? pm,
    TResult? Function(_MaterialSamplePC value)? pc,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_MaterialSample value)? $default, {
    TResult Function(_MaterialSamplePM value)? pm,
    TResult Function(_MaterialSamplePC value)? pc,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MaterialSampleCopyWith<MaterialSample> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MaterialSampleCopyWith<$Res> {
  factory $MaterialSampleCopyWith(
          MaterialSample value, $Res Function(MaterialSample) then) =
      _$MaterialSampleCopyWithImpl<$Res, MaterialSample>;
  @useResult
  $Res call({double naoRecuperaveis});
}

/// @nodoc
class _$MaterialSampleCopyWithImpl<$Res, $Val extends MaterialSample>
    implements $MaterialSampleCopyWith<$Res> {
  _$MaterialSampleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? naoRecuperaveis = null,
  }) {
    return _then(_value.copyWith(
      naoRecuperaveis: null == naoRecuperaveis
          ? _value.naoRecuperaveis
          : naoRecuperaveis // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MaterialSampleCopyWith<$Res>
    implements $MaterialSampleCopyWith<$Res> {
  factory _$$_MaterialSampleCopyWith(
          _$_MaterialSample value, $Res Function(_$_MaterialSample) then) =
      __$$_MaterialSampleCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Map<RMaterial, double> materials, double naoRecuperaveis});
}

/// @nodoc
class __$$_MaterialSampleCopyWithImpl<$Res>
    extends _$MaterialSampleCopyWithImpl<$Res, _$_MaterialSample>
    implements _$$_MaterialSampleCopyWith<$Res> {
  __$$_MaterialSampleCopyWithImpl(
      _$_MaterialSample _value, $Res Function(_$_MaterialSample) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? materials = null,
    Object? naoRecuperaveis = null,
  }) {
    return _then(_$_MaterialSample(
      materials: null == materials
          ? _value._materials
          : materials // ignore: cast_nullable_to_non_nullable
              as Map<RMaterial, double>,
      naoRecuperaveis: null == naoRecuperaveis
          ? _value.naoRecuperaveis
          : naoRecuperaveis // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$_MaterialSample extends _MaterialSample {
  const _$_MaterialSample(
      {final Map<RMaterial, double> materials = const <RMaterial, double>{},
      this.naoRecuperaveis = 0})
      : _materials = materials,
        super._();

  final Map<RMaterial, double> _materials;
  @override
  @JsonKey()
  Map<RMaterial, double> get materials {
    if (_materials is EqualUnmodifiableMapView) return _materials;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_materials);
  }

  @override
  @JsonKey()
  final double naoRecuperaveis;

  @override
  String toString() {
    return 'MaterialSample(materials: $materials, naoRecuperaveis: $naoRecuperaveis)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MaterialSample &&
            const DeepCollectionEquality()
                .equals(other._materials, _materials) &&
            (identical(other.naoRecuperaveis, naoRecuperaveis) ||
                other.naoRecuperaveis == naoRecuperaveis));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_materials), naoRecuperaveis);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MaterialSampleCopyWith<_$_MaterialSample> get copyWith =>
      __$$_MaterialSampleCopyWithImpl<_$_MaterialSample>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(Map<RMaterial, double> materials, double naoRecuperaveis)
        $default, {
    required TResult Function(
            double ecal,
            double filmePlastico,
            double pet,
            double petOleo,
            double pead,
            double plasticosMistos,
            double metaisFerrosos,
            double metaisNaoFerrosos,
            double naoRecuperaveis)
        pm,
    required TResult Function(double papel, double cartao,
            double jornaisRevistas, double naoRecuperaveis)
        pc,
  }) {
    return $default(materials, naoRecuperaveis);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(Map<RMaterial, double> materials, double naoRecuperaveis)?
        $default, {
    TResult? Function(
            double ecal,
            double filmePlastico,
            double pet,
            double petOleo,
            double pead,
            double plasticosMistos,
            double metaisFerrosos,
            double metaisNaoFerrosos,
            double naoRecuperaveis)?
        pm,
    TResult? Function(double papel, double cartao, double jornaisRevistas,
            double naoRecuperaveis)?
        pc,
  }) {
    return $default?.call(materials, naoRecuperaveis);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(Map<RMaterial, double> materials, double naoRecuperaveis)?
        $default, {
    TResult Function(
            double ecal,
            double filmePlastico,
            double pet,
            double petOleo,
            double pead,
            double plasticosMistos,
            double metaisFerrosos,
            double metaisNaoFerrosos,
            double naoRecuperaveis)?
        pm,
    TResult Function(double papel, double cartao, double jornaisRevistas,
            double naoRecuperaveis)?
        pc,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(materials, naoRecuperaveis);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_MaterialSample value) $default, {
    required TResult Function(_MaterialSamplePM value) pm,
    required TResult Function(_MaterialSamplePC value) pc,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_MaterialSample value)? $default, {
    TResult? Function(_MaterialSamplePM value)? pm,
    TResult? Function(_MaterialSamplePC value)? pc,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_MaterialSample value)? $default, {
    TResult Function(_MaterialSamplePM value)? pm,
    TResult Function(_MaterialSamplePC value)? pc,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class _MaterialSample extends MaterialSample {
  const factory _MaterialSample(
      {final Map<RMaterial, double> materials,
      final double naoRecuperaveis}) = _$_MaterialSample;
  const _MaterialSample._() : super._();

  Map<RMaterial, double> get materials;
  @override
  double get naoRecuperaveis;
  @override
  @JsonKey(ignore: true)
  _$$_MaterialSampleCopyWith<_$_MaterialSample> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_MaterialSamplePMCopyWith<$Res>
    implements $MaterialSampleCopyWith<$Res> {
  factory _$$_MaterialSamplePMCopyWith(
          _$_MaterialSamplePM value, $Res Function(_$_MaterialSamplePM) then) =
      __$$_MaterialSamplePMCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double ecal,
      double filmePlastico,
      double pet,
      double petOleo,
      double pead,
      double plasticosMistos,
      double metaisFerrosos,
      double metaisNaoFerrosos,
      double naoRecuperaveis});
}

/// @nodoc
class __$$_MaterialSamplePMCopyWithImpl<$Res>
    extends _$MaterialSampleCopyWithImpl<$Res, _$_MaterialSamplePM>
    implements _$$_MaterialSamplePMCopyWith<$Res> {
  __$$_MaterialSamplePMCopyWithImpl(
      _$_MaterialSamplePM _value, $Res Function(_$_MaterialSamplePM) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ecal = null,
    Object? filmePlastico = null,
    Object? pet = null,
    Object? petOleo = null,
    Object? pead = null,
    Object? plasticosMistos = null,
    Object? metaisFerrosos = null,
    Object? metaisNaoFerrosos = null,
    Object? naoRecuperaveis = null,
  }) {
    return _then(_$_MaterialSamplePM(
      ecal: null == ecal
          ? _value.ecal
          : ecal // ignore: cast_nullable_to_non_nullable
              as double,
      filmePlastico: null == filmePlastico
          ? _value.filmePlastico
          : filmePlastico // ignore: cast_nullable_to_non_nullable
              as double,
      pet: null == pet
          ? _value.pet
          : pet // ignore: cast_nullable_to_non_nullable
              as double,
      petOleo: null == petOleo
          ? _value.petOleo
          : petOleo // ignore: cast_nullable_to_non_nullable
              as double,
      pead: null == pead
          ? _value.pead
          : pead // ignore: cast_nullable_to_non_nullable
              as double,
      plasticosMistos: null == plasticosMistos
          ? _value.plasticosMistos
          : plasticosMistos // ignore: cast_nullable_to_non_nullable
              as double,
      metaisFerrosos: null == metaisFerrosos
          ? _value.metaisFerrosos
          : metaisFerrosos // ignore: cast_nullable_to_non_nullable
              as double,
      metaisNaoFerrosos: null == metaisNaoFerrosos
          ? _value.metaisNaoFerrosos
          : metaisNaoFerrosos // ignore: cast_nullable_to_non_nullable
              as double,
      naoRecuperaveis: null == naoRecuperaveis
          ? _value.naoRecuperaveis
          : naoRecuperaveis // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$_MaterialSamplePM extends _MaterialSamplePM {
  const _$_MaterialSamplePM(
      {this.ecal = 0,
      this.filmePlastico = 0,
      this.pet = 0,
      this.petOleo = 0,
      this.pead = 0,
      this.plasticosMistos = 0,
      this.metaisFerrosos = 0,
      this.metaisNaoFerrosos = 0,
      this.naoRecuperaveis = 0})
      : super._();

  @override
  @JsonKey()
  final double ecal;
  @override
  @JsonKey()
  final double filmePlastico;
  @override
  @JsonKey()
  final double pet;
  @override
  @JsonKey()
  final double petOleo;
  @override
  @JsonKey()
  final double pead;
  @override
  @JsonKey()
  final double plasticosMistos;
  @override
  @JsonKey()
  final double metaisFerrosos;
  @override
  @JsonKey()
  final double metaisNaoFerrosos;
  @override
  @JsonKey()
  final double naoRecuperaveis;

  @override
  String toString() {
    return 'MaterialSample.pm(ecal: $ecal, filmePlastico: $filmePlastico, pet: $pet, petOleo: $petOleo, pead: $pead, plasticosMistos: $plasticosMistos, metaisFerrosos: $metaisFerrosos, metaisNaoFerrosos: $metaisNaoFerrosos, naoRecuperaveis: $naoRecuperaveis)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MaterialSamplePM &&
            (identical(other.ecal, ecal) || other.ecal == ecal) &&
            (identical(other.filmePlastico, filmePlastico) ||
                other.filmePlastico == filmePlastico) &&
            (identical(other.pet, pet) || other.pet == pet) &&
            (identical(other.petOleo, petOleo) || other.petOleo == petOleo) &&
            (identical(other.pead, pead) || other.pead == pead) &&
            (identical(other.plasticosMistos, plasticosMistos) ||
                other.plasticosMistos == plasticosMistos) &&
            (identical(other.metaisFerrosos, metaisFerrosos) ||
                other.metaisFerrosos == metaisFerrosos) &&
            (identical(other.metaisNaoFerrosos, metaisNaoFerrosos) ||
                other.metaisNaoFerrosos == metaisNaoFerrosos) &&
            (identical(other.naoRecuperaveis, naoRecuperaveis) ||
                other.naoRecuperaveis == naoRecuperaveis));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      ecal,
      filmePlastico,
      pet,
      petOleo,
      pead,
      plasticosMistos,
      metaisFerrosos,
      metaisNaoFerrosos,
      naoRecuperaveis);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MaterialSamplePMCopyWith<_$_MaterialSamplePM> get copyWith =>
      __$$_MaterialSamplePMCopyWithImpl<_$_MaterialSamplePM>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(Map<RMaterial, double> materials, double naoRecuperaveis)
        $default, {
    required TResult Function(
            double ecal,
            double filmePlastico,
            double pet,
            double petOleo,
            double pead,
            double plasticosMistos,
            double metaisFerrosos,
            double metaisNaoFerrosos,
            double naoRecuperaveis)
        pm,
    required TResult Function(double papel, double cartao,
            double jornaisRevistas, double naoRecuperaveis)
        pc,
  }) {
    return pm(ecal, filmePlastico, pet, petOleo, pead, plasticosMistos,
        metaisFerrosos, metaisNaoFerrosos, naoRecuperaveis);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(Map<RMaterial, double> materials, double naoRecuperaveis)?
        $default, {
    TResult? Function(
            double ecal,
            double filmePlastico,
            double pet,
            double petOleo,
            double pead,
            double plasticosMistos,
            double metaisFerrosos,
            double metaisNaoFerrosos,
            double naoRecuperaveis)?
        pm,
    TResult? Function(double papel, double cartao, double jornaisRevistas,
            double naoRecuperaveis)?
        pc,
  }) {
    return pm?.call(ecal, filmePlastico, pet, petOleo, pead, plasticosMistos,
        metaisFerrosos, metaisNaoFerrosos, naoRecuperaveis);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(Map<RMaterial, double> materials, double naoRecuperaveis)?
        $default, {
    TResult Function(
            double ecal,
            double filmePlastico,
            double pet,
            double petOleo,
            double pead,
            double plasticosMistos,
            double metaisFerrosos,
            double metaisNaoFerrosos,
            double naoRecuperaveis)?
        pm,
    TResult Function(double papel, double cartao, double jornaisRevistas,
            double naoRecuperaveis)?
        pc,
    required TResult orElse(),
  }) {
    if (pm != null) {
      return pm(ecal, filmePlastico, pet, petOleo, pead, plasticosMistos,
          metaisFerrosos, metaisNaoFerrosos, naoRecuperaveis);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_MaterialSample value) $default, {
    required TResult Function(_MaterialSamplePM value) pm,
    required TResult Function(_MaterialSamplePC value) pc,
  }) {
    return pm(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_MaterialSample value)? $default, {
    TResult? Function(_MaterialSamplePM value)? pm,
    TResult? Function(_MaterialSamplePC value)? pc,
  }) {
    return pm?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_MaterialSample value)? $default, {
    TResult Function(_MaterialSamplePM value)? pm,
    TResult Function(_MaterialSamplePC value)? pc,
    required TResult orElse(),
  }) {
    if (pm != null) {
      return pm(this);
    }
    return orElse();
  }
}

abstract class _MaterialSamplePM extends MaterialSample {
  const factory _MaterialSamplePM(
      {final double ecal,
      final double filmePlastico,
      final double pet,
      final double petOleo,
      final double pead,
      final double plasticosMistos,
      final double metaisFerrosos,
      final double metaisNaoFerrosos,
      final double naoRecuperaveis}) = _$_MaterialSamplePM;
  const _MaterialSamplePM._() : super._();

  double get ecal;
  double get filmePlastico;
  double get pet;
  double get petOleo;
  double get pead;
  double get plasticosMistos;
  double get metaisFerrosos;
  double get metaisNaoFerrosos;
  @override
  double get naoRecuperaveis;
  @override
  @JsonKey(ignore: true)
  _$$_MaterialSamplePMCopyWith<_$_MaterialSamplePM> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_MaterialSamplePCCopyWith<$Res>
    implements $MaterialSampleCopyWith<$Res> {
  factory _$$_MaterialSamplePCCopyWith(
          _$_MaterialSamplePC value, $Res Function(_$_MaterialSamplePC) then) =
      __$$_MaterialSamplePCCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double papel,
      double cartao,
      double jornaisRevistas,
      double naoRecuperaveis});
}

/// @nodoc
class __$$_MaterialSamplePCCopyWithImpl<$Res>
    extends _$MaterialSampleCopyWithImpl<$Res, _$_MaterialSamplePC>
    implements _$$_MaterialSamplePCCopyWith<$Res> {
  __$$_MaterialSamplePCCopyWithImpl(
      _$_MaterialSamplePC _value, $Res Function(_$_MaterialSamplePC) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? papel = null,
    Object? cartao = null,
    Object? jornaisRevistas = null,
    Object? naoRecuperaveis = null,
  }) {
    return _then(_$_MaterialSamplePC(
      papel: null == papel
          ? _value.papel
          : papel // ignore: cast_nullable_to_non_nullable
              as double,
      cartao: null == cartao
          ? _value.cartao
          : cartao // ignore: cast_nullable_to_non_nullable
              as double,
      jornaisRevistas: null == jornaisRevistas
          ? _value.jornaisRevistas
          : jornaisRevistas // ignore: cast_nullable_to_non_nullable
              as double,
      naoRecuperaveis: null == naoRecuperaveis
          ? _value.naoRecuperaveis
          : naoRecuperaveis // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$_MaterialSamplePC extends _MaterialSamplePC {
  const _$_MaterialSamplePC(
      {this.papel = 0,
      this.cartao = 0,
      this.jornaisRevistas = 0,
      this.naoRecuperaveis = 0})
      : super._();

  @override
  @JsonKey()
  final double papel;
  @override
  @JsonKey()
  final double cartao;
  @override
  @JsonKey()
  final double jornaisRevistas;
  @override
  @JsonKey()
  final double naoRecuperaveis;

  @override
  String toString() {
    return 'MaterialSample.pc(papel: $papel, cartao: $cartao, jornaisRevistas: $jornaisRevistas, naoRecuperaveis: $naoRecuperaveis)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MaterialSamplePC &&
            (identical(other.papel, papel) || other.papel == papel) &&
            (identical(other.cartao, cartao) || other.cartao == cartao) &&
            (identical(other.jornaisRevistas, jornaisRevistas) ||
                other.jornaisRevistas == jornaisRevistas) &&
            (identical(other.naoRecuperaveis, naoRecuperaveis) ||
                other.naoRecuperaveis == naoRecuperaveis));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, papel, cartao, jornaisRevistas, naoRecuperaveis);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MaterialSamplePCCopyWith<_$_MaterialSamplePC> get copyWith =>
      __$$_MaterialSamplePCCopyWithImpl<_$_MaterialSamplePC>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(Map<RMaterial, double> materials, double naoRecuperaveis)
        $default, {
    required TResult Function(
            double ecal,
            double filmePlastico,
            double pet,
            double petOleo,
            double pead,
            double plasticosMistos,
            double metaisFerrosos,
            double metaisNaoFerrosos,
            double naoRecuperaveis)
        pm,
    required TResult Function(double papel, double cartao,
            double jornaisRevistas, double naoRecuperaveis)
        pc,
  }) {
    return pc(papel, cartao, jornaisRevistas, naoRecuperaveis);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(Map<RMaterial, double> materials, double naoRecuperaveis)?
        $default, {
    TResult? Function(
            double ecal,
            double filmePlastico,
            double pet,
            double petOleo,
            double pead,
            double plasticosMistos,
            double metaisFerrosos,
            double metaisNaoFerrosos,
            double naoRecuperaveis)?
        pm,
    TResult? Function(double papel, double cartao, double jornaisRevistas,
            double naoRecuperaveis)?
        pc,
  }) {
    return pc?.call(papel, cartao, jornaisRevistas, naoRecuperaveis);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(Map<RMaterial, double> materials, double naoRecuperaveis)?
        $default, {
    TResult Function(
            double ecal,
            double filmePlastico,
            double pet,
            double petOleo,
            double pead,
            double plasticosMistos,
            double metaisFerrosos,
            double metaisNaoFerrosos,
            double naoRecuperaveis)?
        pm,
    TResult Function(double papel, double cartao, double jornaisRevistas,
            double naoRecuperaveis)?
        pc,
    required TResult orElse(),
  }) {
    if (pc != null) {
      return pc(papel, cartao, jornaisRevistas, naoRecuperaveis);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_MaterialSample value) $default, {
    required TResult Function(_MaterialSamplePM value) pm,
    required TResult Function(_MaterialSamplePC value) pc,
  }) {
    return pc(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_MaterialSample value)? $default, {
    TResult? Function(_MaterialSamplePM value)? pm,
    TResult? Function(_MaterialSamplePC value)? pc,
  }) {
    return pc?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_MaterialSample value)? $default, {
    TResult Function(_MaterialSamplePM value)? pm,
    TResult Function(_MaterialSamplePC value)? pc,
    required TResult orElse(),
  }) {
    if (pc != null) {
      return pc(this);
    }
    return orElse();
  }
}

abstract class _MaterialSamplePC extends MaterialSample {
  const factory _MaterialSamplePC(
      {final double papel,
      final double cartao,
      final double jornaisRevistas,
      final double naoRecuperaveis}) = _$_MaterialSamplePC;
  const _MaterialSamplePC._() : super._();

  double get papel;
  double get cartao;
  double get jornaisRevistas;
  @override
  double get naoRecuperaveis;
  @override
  @JsonKey(ignore: true)
  _$$_MaterialSamplePCCopyWith<_$_MaterialSamplePC> get copyWith =>
      throw _privateConstructorUsedError;
}
