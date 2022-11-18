// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'form_screen_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FormScreenModel {
  PMaterial? get material => throw _privateConstructorUsedError;
  int? get weight => throw _privateConstructorUsedError;
  double get recycledPercentage => throw _privateConstructorUsedError;
  Map<int, Answer> get answers => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FormScreenModelCopyWith<FormScreenModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FormScreenModelCopyWith<$Res> {
  factory $FormScreenModelCopyWith(
          FormScreenModel value, $Res Function(FormScreenModel) then) =
      _$FormScreenModelCopyWithImpl<$Res, FormScreenModel>;
  @useResult
  $Res call(
      {PMaterial? material,
      int? weight,
      double recycledPercentage,
      Map<int, Answer> answers});
}

/// @nodoc
class _$FormScreenModelCopyWithImpl<$Res, $Val extends FormScreenModel>
    implements $FormScreenModelCopyWith<$Res> {
  _$FormScreenModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? material = freezed,
    Object? weight = freezed,
    Object? recycledPercentage = null,
    Object? answers = null,
  }) {
    return _then(_value.copyWith(
      material: freezed == material
          ? _value.material
          : material // ignore: cast_nullable_to_non_nullable
              as PMaterial?,
      weight: freezed == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as int?,
      recycledPercentage: null == recycledPercentage
          ? _value.recycledPercentage
          : recycledPercentage // ignore: cast_nullable_to_non_nullable
              as double,
      answers: null == answers
          ? _value.answers
          : answers // ignore: cast_nullable_to_non_nullable
              as Map<int, Answer>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FormScreenModelCopyWith<$Res>
    implements $FormScreenModelCopyWith<$Res> {
  factory _$$_FormScreenModelCopyWith(
          _$_FormScreenModel value, $Res Function(_$_FormScreenModel) then) =
      __$$_FormScreenModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {PMaterial? material,
      int? weight,
      double recycledPercentage,
      Map<int, Answer> answers});
}

/// @nodoc
class __$$_FormScreenModelCopyWithImpl<$Res>
    extends _$FormScreenModelCopyWithImpl<$Res, _$_FormScreenModel>
    implements _$$_FormScreenModelCopyWith<$Res> {
  __$$_FormScreenModelCopyWithImpl(
      _$_FormScreenModel _value, $Res Function(_$_FormScreenModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? material = freezed,
    Object? weight = freezed,
    Object? recycledPercentage = null,
    Object? answers = null,
  }) {
    return _then(_$_FormScreenModel(
      material: freezed == material
          ? _value.material
          : material // ignore: cast_nullable_to_non_nullable
              as PMaterial?,
      weight: freezed == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as int?,
      recycledPercentage: null == recycledPercentage
          ? _value.recycledPercentage
          : recycledPercentage // ignore: cast_nullable_to_non_nullable
              as double,
      answers: null == answers
          ? _value._answers
          : answers // ignore: cast_nullable_to_non_nullable
              as Map<int, Answer>,
    ));
  }
}

/// @nodoc

class _$_FormScreenModel extends _FormScreenModel {
  const _$_FormScreenModel(
      {this.material,
      this.weight,
      this.recycledPercentage = 0,
      final Map<int, Answer> answers = const <int, Answer>{}})
      : _answers = answers,
        super._();

  @override
  final PMaterial? material;
  @override
  final int? weight;
  @override
  @JsonKey()
  final double recycledPercentage;
  final Map<int, Answer> _answers;
  @override
  @JsonKey()
  Map<int, Answer> get answers {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_answers);
  }

  @override
  String toString() {
    return 'FormScreenModel(material: $material, weight: $weight, recycledPercentage: $recycledPercentage, answers: $answers)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FormScreenModel &&
            (identical(other.material, material) ||
                other.material == material) &&
            (identical(other.weight, weight) || other.weight == weight) &&
            (identical(other.recycledPercentage, recycledPercentage) ||
                other.recycledPercentage == recycledPercentage) &&
            const DeepCollectionEquality().equals(other._answers, _answers));
  }

  @override
  int get hashCode => Object.hash(runtimeType, material, weight,
      recycledPercentage, const DeepCollectionEquality().hash(_answers));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FormScreenModelCopyWith<_$_FormScreenModel> get copyWith =>
      __$$_FormScreenModelCopyWithImpl<_$_FormScreenModel>(this, _$identity);
}

abstract class _FormScreenModel extends FormScreenModel {
  const factory _FormScreenModel(
      {final PMaterial? material,
      final int? weight,
      final double recycledPercentage,
      final Map<int, Answer> answers}) = _$_FormScreenModel;
  const _FormScreenModel._() : super._();

  @override
  PMaterial? get material;
  @override
  int? get weight;
  @override
  double get recycledPercentage;
  @override
  Map<int, Answer> get answers;
  @override
  @JsonKey(ignore: true)
  _$$_FormScreenModelCopyWith<_$_FormScreenModel> get copyWith =>
      throw _privateConstructorUsedError;
}
