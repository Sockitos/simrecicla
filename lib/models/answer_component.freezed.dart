// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'answer_component.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AnswerComponent _$AnswerComponentFromJson(Map<String, dynamic> json) {
  return _AnswerComponent.fromJson(json);
}

/// @nodoc
mixin _$AnswerComponent {
  int? get value => throw _privateConstructorUsedError;
  String? get recommendation => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AnswerComponentCopyWith<AnswerComponent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnswerComponentCopyWith<$Res> {
  factory $AnswerComponentCopyWith(
          AnswerComponent value, $Res Function(AnswerComponent) then) =
      _$AnswerComponentCopyWithImpl<$Res>;
  $Res call({int? value, String? recommendation});
}

/// @nodoc
class _$AnswerComponentCopyWithImpl<$Res>
    implements $AnswerComponentCopyWith<$Res> {
  _$AnswerComponentCopyWithImpl(this._value, this._then);

  final AnswerComponent _value;
  // ignore: unused_field
  final $Res Function(AnswerComponent) _then;

  @override
  $Res call({
    Object? value = freezed,
    Object? recommendation = freezed,
  }) {
    return _then(_value.copyWith(
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int?,
      recommendation: recommendation == freezed
          ? _value.recommendation
          : recommendation // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_AnswerComponentCopyWith<$Res>
    implements $AnswerComponentCopyWith<$Res> {
  factory _$$_AnswerComponentCopyWith(
          _$_AnswerComponent value, $Res Function(_$_AnswerComponent) then) =
      __$$_AnswerComponentCopyWithImpl<$Res>;
  @override
  $Res call({int? value, String? recommendation});
}

/// @nodoc
class __$$_AnswerComponentCopyWithImpl<$Res>
    extends _$AnswerComponentCopyWithImpl<$Res>
    implements _$$_AnswerComponentCopyWith<$Res> {
  __$$_AnswerComponentCopyWithImpl(
      _$_AnswerComponent _value, $Res Function(_$_AnswerComponent) _then)
      : super(_value, (v) => _then(v as _$_AnswerComponent));

  @override
  _$_AnswerComponent get _value => super._value as _$_AnswerComponent;

  @override
  $Res call({
    Object? value = freezed,
    Object? recommendation = freezed,
  }) {
    return _then(_$_AnswerComponent(
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int?,
      recommendation: recommendation == freezed
          ? _value.recommendation
          : recommendation // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AnswerComponent extends _AnswerComponent {
  const _$_AnswerComponent({required this.value, required this.recommendation})
      : super._();

  factory _$_AnswerComponent.fromJson(Map<String, dynamic> json) =>
      _$$_AnswerComponentFromJson(json);

  @override
  final int? value;
  @override
  final String? recommendation;

  @override
  String toString() {
    return 'AnswerComponent(value: $value, recommendation: $recommendation)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AnswerComponent &&
            const DeepCollectionEquality().equals(other.value, value) &&
            const DeepCollectionEquality()
                .equals(other.recommendation, recommendation));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(value),
      const DeepCollectionEquality().hash(recommendation));

  @JsonKey(ignore: true)
  @override
  _$$_AnswerComponentCopyWith<_$_AnswerComponent> get copyWith =>
      __$$_AnswerComponentCopyWithImpl<_$_AnswerComponent>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AnswerComponentToJson(this);
  }
}

abstract class _AnswerComponent extends AnswerComponent {
  const factory _AnswerComponent(
      {required final int? value,
      required final String? recommendation}) = _$_AnswerComponent;
  const _AnswerComponent._() : super._();

  factory _AnswerComponent.fromJson(Map<String, dynamic> json) =
      _$_AnswerComponent.fromJson;

  @override
  int? get value => throw _privateConstructorUsedError;
  @override
  String? get recommendation => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_AnswerComponentCopyWith<_$_AnswerComponent> get copyWith =>
      throw _privateConstructorUsedError;
}