// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'component.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Component _$ComponentFromJson(Map<String, dynamic> json) {
  return _Component.fromJson(json);
}

/// @nodoc
class _$ComponentTearOff {
  const _$ComponentTearOff();

  _Component call(
      {required String component,
      @JsonKey(defaultValue: 'assets/svgs/lid.svg') required String svgPath,
      required double? papel,
      required double? cartao,
      required double? ecal,
      required double? pebd,
      required double? pet,
      required double? pead,
      @JsonKey(name: 'plasticos_mistos') required double? plasticosMistos,
      @JsonKey(name: 'metais_ferrosos') required double? metaisFerrosos,
      @JsonKey(name: 'metais_nao_ferrosos') required double? metaisNaoFerrosos,
      required double? vidro,
      required double? eps,
      @JsonKey(name: 'fracao_resto') required double? fracaoResto,
      required Where where,
      @JsonKey(name: 'if_true') required String ifTrue,
      @JsonKey(name: 'if_false') required String ifFalse,
      required String recomendacoes}) {
    return _Component(
      component: component,
      svgPath: svgPath,
      papel: papel,
      cartao: cartao,
      ecal: ecal,
      pebd: pebd,
      pet: pet,
      pead: pead,
      plasticosMistos: plasticosMistos,
      metaisFerrosos: metaisFerrosos,
      metaisNaoFerrosos: metaisNaoFerrosos,
      vidro: vidro,
      eps: eps,
      fracaoResto: fracaoResto,
      where: where,
      ifTrue: ifTrue,
      ifFalse: ifFalse,
      recomendacoes: recomendacoes,
    );
  }

  Component fromJson(Map<String, Object?> json) {
    return Component.fromJson(json);
  }
}

/// @nodoc
const $Component = _$ComponentTearOff();

/// @nodoc
mixin _$Component {
  String get component => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: 'assets/svgs/lid.svg')
  String get svgPath => throw _privateConstructorUsedError;
  double? get papel => throw _privateConstructorUsedError;
  double? get cartao => throw _privateConstructorUsedError;
  double? get ecal => throw _privateConstructorUsedError;
  double? get pebd => throw _privateConstructorUsedError;
  double? get pet => throw _privateConstructorUsedError;
  double? get pead => throw _privateConstructorUsedError;
  @JsonKey(name: 'plasticos_mistos')
  double? get plasticosMistos => throw _privateConstructorUsedError;
  @JsonKey(name: 'metais_ferrosos')
  double? get metaisFerrosos => throw _privateConstructorUsedError;
  @JsonKey(name: 'metais_nao_ferrosos')
  double? get metaisNaoFerrosos => throw _privateConstructorUsedError;
  double? get vidro => throw _privateConstructorUsedError;
  double? get eps => throw _privateConstructorUsedError;
  @JsonKey(name: 'fracao_resto')
  double? get fracaoResto => throw _privateConstructorUsedError;
  Where get where => throw _privateConstructorUsedError;
  @JsonKey(name: 'if_true')
  String get ifTrue => throw _privateConstructorUsedError;
  @JsonKey(name: 'if_false')
  String get ifFalse => throw _privateConstructorUsedError;
  String get recomendacoes => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ComponentCopyWith<Component> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ComponentCopyWith<$Res> {
  factory $ComponentCopyWith(Component value, $Res Function(Component) then) =
      _$ComponentCopyWithImpl<$Res>;
  $Res call(
      {String component,
      @JsonKey(defaultValue: 'assets/svgs/lid.svg') String svgPath,
      double? papel,
      double? cartao,
      double? ecal,
      double? pebd,
      double? pet,
      double? pead,
      @JsonKey(name: 'plasticos_mistos') double? plasticosMistos,
      @JsonKey(name: 'metais_ferrosos') double? metaisFerrosos,
      @JsonKey(name: 'metais_nao_ferrosos') double? metaisNaoFerrosos,
      double? vidro,
      double? eps,
      @JsonKey(name: 'fracao_resto') double? fracaoResto,
      Where where,
      @JsonKey(name: 'if_true') String ifTrue,
      @JsonKey(name: 'if_false') String ifFalse,
      String recomendacoes});
}

/// @nodoc
class _$ComponentCopyWithImpl<$Res> implements $ComponentCopyWith<$Res> {
  _$ComponentCopyWithImpl(this._value, this._then);

  final Component _value;
  // ignore: unused_field
  final $Res Function(Component) _then;

  @override
  $Res call({
    Object? component = freezed,
    Object? svgPath = freezed,
    Object? papel = freezed,
    Object? cartao = freezed,
    Object? ecal = freezed,
    Object? pebd = freezed,
    Object? pet = freezed,
    Object? pead = freezed,
    Object? plasticosMistos = freezed,
    Object? metaisFerrosos = freezed,
    Object? metaisNaoFerrosos = freezed,
    Object? vidro = freezed,
    Object? eps = freezed,
    Object? fracaoResto = freezed,
    Object? where = freezed,
    Object? ifTrue = freezed,
    Object? ifFalse = freezed,
    Object? recomendacoes = freezed,
  }) {
    return _then(_value.copyWith(
      component: component == freezed
          ? _value.component
          : component // ignore: cast_nullable_to_non_nullable
              as String,
      svgPath: svgPath == freezed
          ? _value.svgPath
          : svgPath // ignore: cast_nullable_to_non_nullable
              as String,
      papel: papel == freezed
          ? _value.papel
          : papel // ignore: cast_nullable_to_non_nullable
              as double?,
      cartao: cartao == freezed
          ? _value.cartao
          : cartao // ignore: cast_nullable_to_non_nullable
              as double?,
      ecal: ecal == freezed
          ? _value.ecal
          : ecal // ignore: cast_nullable_to_non_nullable
              as double?,
      pebd: pebd == freezed
          ? _value.pebd
          : pebd // ignore: cast_nullable_to_non_nullable
              as double?,
      pet: pet == freezed
          ? _value.pet
          : pet // ignore: cast_nullable_to_non_nullable
              as double?,
      pead: pead == freezed
          ? _value.pead
          : pead // ignore: cast_nullable_to_non_nullable
              as double?,
      plasticosMistos: plasticosMistos == freezed
          ? _value.plasticosMistos
          : plasticosMistos // ignore: cast_nullable_to_non_nullable
              as double?,
      metaisFerrosos: metaisFerrosos == freezed
          ? _value.metaisFerrosos
          : metaisFerrosos // ignore: cast_nullable_to_non_nullable
              as double?,
      metaisNaoFerrosos: metaisNaoFerrosos == freezed
          ? _value.metaisNaoFerrosos
          : metaisNaoFerrosos // ignore: cast_nullable_to_non_nullable
              as double?,
      vidro: vidro == freezed
          ? _value.vidro
          : vidro // ignore: cast_nullable_to_non_nullable
              as double?,
      eps: eps == freezed
          ? _value.eps
          : eps // ignore: cast_nullable_to_non_nullable
              as double?,
      fracaoResto: fracaoResto == freezed
          ? _value.fracaoResto
          : fracaoResto // ignore: cast_nullable_to_non_nullable
              as double?,
      where: where == freezed
          ? _value.where
          : where // ignore: cast_nullable_to_non_nullable
              as Where,
      ifTrue: ifTrue == freezed
          ? _value.ifTrue
          : ifTrue // ignore: cast_nullable_to_non_nullable
              as String,
      ifFalse: ifFalse == freezed
          ? _value.ifFalse
          : ifFalse // ignore: cast_nullable_to_non_nullable
              as String,
      recomendacoes: recomendacoes == freezed
          ? _value.recomendacoes
          : recomendacoes // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$ComponentCopyWith<$Res> implements $ComponentCopyWith<$Res> {
  factory _$ComponentCopyWith(
          _Component value, $Res Function(_Component) then) =
      __$ComponentCopyWithImpl<$Res>;
  @override
  $Res call(
      {String component,
      @JsonKey(defaultValue: 'assets/svgs/lid.svg') String svgPath,
      double? papel,
      double? cartao,
      double? ecal,
      double? pebd,
      double? pet,
      double? pead,
      @JsonKey(name: 'plasticos_mistos') double? plasticosMistos,
      @JsonKey(name: 'metais_ferrosos') double? metaisFerrosos,
      @JsonKey(name: 'metais_nao_ferrosos') double? metaisNaoFerrosos,
      double? vidro,
      double? eps,
      @JsonKey(name: 'fracao_resto') double? fracaoResto,
      Where where,
      @JsonKey(name: 'if_true') String ifTrue,
      @JsonKey(name: 'if_false') String ifFalse,
      String recomendacoes});
}

/// @nodoc
class __$ComponentCopyWithImpl<$Res> extends _$ComponentCopyWithImpl<$Res>
    implements _$ComponentCopyWith<$Res> {
  __$ComponentCopyWithImpl(_Component _value, $Res Function(_Component) _then)
      : super(_value, (v) => _then(v as _Component));

  @override
  _Component get _value => super._value as _Component;

  @override
  $Res call({
    Object? component = freezed,
    Object? svgPath = freezed,
    Object? papel = freezed,
    Object? cartao = freezed,
    Object? ecal = freezed,
    Object? pebd = freezed,
    Object? pet = freezed,
    Object? pead = freezed,
    Object? plasticosMistos = freezed,
    Object? metaisFerrosos = freezed,
    Object? metaisNaoFerrosos = freezed,
    Object? vidro = freezed,
    Object? eps = freezed,
    Object? fracaoResto = freezed,
    Object? where = freezed,
    Object? ifTrue = freezed,
    Object? ifFalse = freezed,
    Object? recomendacoes = freezed,
  }) {
    return _then(_Component(
      component: component == freezed
          ? _value.component
          : component // ignore: cast_nullable_to_non_nullable
              as String,
      svgPath: svgPath == freezed
          ? _value.svgPath
          : svgPath // ignore: cast_nullable_to_non_nullable
              as String,
      papel: papel == freezed
          ? _value.papel
          : papel // ignore: cast_nullable_to_non_nullable
              as double?,
      cartao: cartao == freezed
          ? _value.cartao
          : cartao // ignore: cast_nullable_to_non_nullable
              as double?,
      ecal: ecal == freezed
          ? _value.ecal
          : ecal // ignore: cast_nullable_to_non_nullable
              as double?,
      pebd: pebd == freezed
          ? _value.pebd
          : pebd // ignore: cast_nullable_to_non_nullable
              as double?,
      pet: pet == freezed
          ? _value.pet
          : pet // ignore: cast_nullable_to_non_nullable
              as double?,
      pead: pead == freezed
          ? _value.pead
          : pead // ignore: cast_nullable_to_non_nullable
              as double?,
      plasticosMistos: plasticosMistos == freezed
          ? _value.plasticosMistos
          : plasticosMistos // ignore: cast_nullable_to_non_nullable
              as double?,
      metaisFerrosos: metaisFerrosos == freezed
          ? _value.metaisFerrosos
          : metaisFerrosos // ignore: cast_nullable_to_non_nullable
              as double?,
      metaisNaoFerrosos: metaisNaoFerrosos == freezed
          ? _value.metaisNaoFerrosos
          : metaisNaoFerrosos // ignore: cast_nullable_to_non_nullable
              as double?,
      vidro: vidro == freezed
          ? _value.vidro
          : vidro // ignore: cast_nullable_to_non_nullable
              as double?,
      eps: eps == freezed
          ? _value.eps
          : eps // ignore: cast_nullable_to_non_nullable
              as double?,
      fracaoResto: fracaoResto == freezed
          ? _value.fracaoResto
          : fracaoResto // ignore: cast_nullable_to_non_nullable
              as double?,
      where: where == freezed
          ? _value.where
          : where // ignore: cast_nullable_to_non_nullable
              as Where,
      ifTrue: ifTrue == freezed
          ? _value.ifTrue
          : ifTrue // ignore: cast_nullable_to_non_nullable
              as String,
      ifFalse: ifFalse == freezed
          ? _value.ifFalse
          : ifFalse // ignore: cast_nullable_to_non_nullable
              as String,
      recomendacoes: recomendacoes == freezed
          ? _value.recomendacoes
          : recomendacoes // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Component extends _Component {
  const _$_Component(
      {required this.component,
      @JsonKey(defaultValue: 'assets/svgs/lid.svg') required this.svgPath,
      required this.papel,
      required this.cartao,
      required this.ecal,
      required this.pebd,
      required this.pet,
      required this.pead,
      @JsonKey(name: 'plasticos_mistos') required this.plasticosMistos,
      @JsonKey(name: 'metais_ferrosos') required this.metaisFerrosos,
      @JsonKey(name: 'metais_nao_ferrosos') required this.metaisNaoFerrosos,
      required this.vidro,
      required this.eps,
      @JsonKey(name: 'fracao_resto') required this.fracaoResto,
      required this.where,
      @JsonKey(name: 'if_true') required this.ifTrue,
      @JsonKey(name: 'if_false') required this.ifFalse,
      required this.recomendacoes})
      : super._();

  factory _$_Component.fromJson(Map<String, dynamic> json) =>
      _$$_ComponentFromJson(json);

  @override
  final String component;
  @override
  @JsonKey(defaultValue: 'assets/svgs/lid.svg')
  final String svgPath;
  @override
  final double? papel;
  @override
  final double? cartao;
  @override
  final double? ecal;
  @override
  final double? pebd;
  @override
  final double? pet;
  @override
  final double? pead;
  @override
  @JsonKey(name: 'plasticos_mistos')
  final double? plasticosMistos;
  @override
  @JsonKey(name: 'metais_ferrosos')
  final double? metaisFerrosos;
  @override
  @JsonKey(name: 'metais_nao_ferrosos')
  final double? metaisNaoFerrosos;
  @override
  final double? vidro;
  @override
  final double? eps;
  @override
  @JsonKey(name: 'fracao_resto')
  final double? fracaoResto;
  @override
  final Where where;
  @override
  @JsonKey(name: 'if_true')
  final String ifTrue;
  @override
  @JsonKey(name: 'if_false')
  final String ifFalse;
  @override
  final String recomendacoes;

  @override
  String toString() {
    return 'Component(component: $component, svgPath: $svgPath, papel: $papel, cartao: $cartao, ecal: $ecal, pebd: $pebd, pet: $pet, pead: $pead, plasticosMistos: $plasticosMistos, metaisFerrosos: $metaisFerrosos, metaisNaoFerrosos: $metaisNaoFerrosos, vidro: $vidro, eps: $eps, fracaoResto: $fracaoResto, where: $where, ifTrue: $ifTrue, ifFalse: $ifFalse, recomendacoes: $recomendacoes)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Component &&
            const DeepCollectionEquality().equals(other.component, component) &&
            const DeepCollectionEquality().equals(other.svgPath, svgPath) &&
            const DeepCollectionEquality().equals(other.papel, papel) &&
            const DeepCollectionEquality().equals(other.cartao, cartao) &&
            const DeepCollectionEquality().equals(other.ecal, ecal) &&
            const DeepCollectionEquality().equals(other.pebd, pebd) &&
            const DeepCollectionEquality().equals(other.pet, pet) &&
            const DeepCollectionEquality().equals(other.pead, pead) &&
            const DeepCollectionEquality()
                .equals(other.plasticosMistos, plasticosMistos) &&
            const DeepCollectionEquality()
                .equals(other.metaisFerrosos, metaisFerrosos) &&
            const DeepCollectionEquality()
                .equals(other.metaisNaoFerrosos, metaisNaoFerrosos) &&
            const DeepCollectionEquality().equals(other.vidro, vidro) &&
            const DeepCollectionEquality().equals(other.eps, eps) &&
            const DeepCollectionEquality()
                .equals(other.fracaoResto, fracaoResto) &&
            const DeepCollectionEquality().equals(other.where, where) &&
            const DeepCollectionEquality().equals(other.ifTrue, ifTrue) &&
            const DeepCollectionEquality().equals(other.ifFalse, ifFalse) &&
            const DeepCollectionEquality()
                .equals(other.recomendacoes, recomendacoes));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(component),
      const DeepCollectionEquality().hash(svgPath),
      const DeepCollectionEquality().hash(papel),
      const DeepCollectionEquality().hash(cartao),
      const DeepCollectionEquality().hash(ecal),
      const DeepCollectionEquality().hash(pebd),
      const DeepCollectionEquality().hash(pet),
      const DeepCollectionEquality().hash(pead),
      const DeepCollectionEquality().hash(plasticosMistos),
      const DeepCollectionEquality().hash(metaisFerrosos),
      const DeepCollectionEquality().hash(metaisNaoFerrosos),
      const DeepCollectionEquality().hash(vidro),
      const DeepCollectionEquality().hash(eps),
      const DeepCollectionEquality().hash(fracaoResto),
      const DeepCollectionEquality().hash(where),
      const DeepCollectionEquality().hash(ifTrue),
      const DeepCollectionEquality().hash(ifFalse),
      const DeepCollectionEquality().hash(recomendacoes));

  @JsonKey(ignore: true)
  @override
  _$ComponentCopyWith<_Component> get copyWith =>
      __$ComponentCopyWithImpl<_Component>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ComponentToJson(this);
  }
}

abstract class _Component extends Component {
  const factory _Component(
      {required String component,
      @JsonKey(defaultValue: 'assets/svgs/lid.svg') required String svgPath,
      required double? papel,
      required double? cartao,
      required double? ecal,
      required double? pebd,
      required double? pet,
      required double? pead,
      @JsonKey(name: 'plasticos_mistos') required double? plasticosMistos,
      @JsonKey(name: 'metais_ferrosos') required double? metaisFerrosos,
      @JsonKey(name: 'metais_nao_ferrosos') required double? metaisNaoFerrosos,
      required double? vidro,
      required double? eps,
      @JsonKey(name: 'fracao_resto') required double? fracaoResto,
      required Where where,
      @JsonKey(name: 'if_true') required String ifTrue,
      @JsonKey(name: 'if_false') required String ifFalse,
      required String recomendacoes}) = _$_Component;
  const _Component._() : super._();

  factory _Component.fromJson(Map<String, dynamic> json) =
      _$_Component.fromJson;

  @override
  String get component;
  @override
  @JsonKey(defaultValue: 'assets/svgs/lid.svg')
  String get svgPath;
  @override
  double? get papel;
  @override
  double? get cartao;
  @override
  double? get ecal;
  @override
  double? get pebd;
  @override
  double? get pet;
  @override
  double? get pead;
  @override
  @JsonKey(name: 'plasticos_mistos')
  double? get plasticosMistos;
  @override
  @JsonKey(name: 'metais_ferrosos')
  double? get metaisFerrosos;
  @override
  @JsonKey(name: 'metais_nao_ferrosos')
  double? get metaisNaoFerrosos;
  @override
  double? get vidro;
  @override
  double? get eps;
  @override
  @JsonKey(name: 'fracao_resto')
  double? get fracaoResto;
  @override
  Where get where;
  @override
  @JsonKey(name: 'if_true')
  String get ifTrue;
  @override
  @JsonKey(name: 'if_false')
  String get ifFalse;
  @override
  String get recomendacoes;
  @override
  @JsonKey(ignore: true)
  _$ComponentCopyWith<_Component> get copyWith =>
      throw _privateConstructorUsedError;
}
