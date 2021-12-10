// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'question_requirement.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

QuestionRequirement _$QuestionRequirementFromJson(Map<String, dynamic> json) {
  return _QuestionRequirement.fromJson(json);
}

/// @nodoc
class _$QuestionRequirementTearOff {
  const _$QuestionRequirementTearOff();

  _QuestionRequirement call(
      {required int question, required List<int> answers}) {
    return _QuestionRequirement(
      question: question,
      answers: answers,
    );
  }

  QuestionRequirement fromJson(Map<String, Object?> json) {
    return QuestionRequirement.fromJson(json);
  }
}

/// @nodoc
const $QuestionRequirement = _$QuestionRequirementTearOff();

/// @nodoc
mixin _$QuestionRequirement {
  int get question => throw _privateConstructorUsedError;
  List<int> get answers => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QuestionRequirementCopyWith<QuestionRequirement> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuestionRequirementCopyWith<$Res> {
  factory $QuestionRequirementCopyWith(
          QuestionRequirement value, $Res Function(QuestionRequirement) then) =
      _$QuestionRequirementCopyWithImpl<$Res>;
  $Res call({int question, List<int> answers});
}

/// @nodoc
class _$QuestionRequirementCopyWithImpl<$Res>
    implements $QuestionRequirementCopyWith<$Res> {
  _$QuestionRequirementCopyWithImpl(this._value, this._then);

  final QuestionRequirement _value;
  // ignore: unused_field
  final $Res Function(QuestionRequirement) _then;

  @override
  $Res call({
    Object? question = freezed,
    Object? answers = freezed,
  }) {
    return _then(_value.copyWith(
      question: question == freezed
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as int,
      answers: answers == freezed
          ? _value.answers
          : answers // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ));
  }
}

/// @nodoc
abstract class _$QuestionRequirementCopyWith<$Res>
    implements $QuestionRequirementCopyWith<$Res> {
  factory _$QuestionRequirementCopyWith(_QuestionRequirement value,
          $Res Function(_QuestionRequirement) then) =
      __$QuestionRequirementCopyWithImpl<$Res>;
  @override
  $Res call({int question, List<int> answers});
}

/// @nodoc
class __$QuestionRequirementCopyWithImpl<$Res>
    extends _$QuestionRequirementCopyWithImpl<$Res>
    implements _$QuestionRequirementCopyWith<$Res> {
  __$QuestionRequirementCopyWithImpl(
      _QuestionRequirement _value, $Res Function(_QuestionRequirement) _then)
      : super(_value, (v) => _then(v as _QuestionRequirement));

  @override
  _QuestionRequirement get _value => super._value as _QuestionRequirement;

  @override
  $Res call({
    Object? question = freezed,
    Object? answers = freezed,
  }) {
    return _then(_QuestionRequirement(
      question: question == freezed
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as int,
      answers: answers == freezed
          ? _value.answers
          : answers // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_QuestionRequirement extends _QuestionRequirement {
  const _$_QuestionRequirement({required this.question, required this.answers})
      : super._();

  factory _$_QuestionRequirement.fromJson(Map<String, dynamic> json) =>
      _$$_QuestionRequirementFromJson(json);

  @override
  final int question;
  @override
  final List<int> answers;

  @override
  String toString() {
    return 'QuestionRequirement(question: $question, answers: $answers)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _QuestionRequirement &&
            const DeepCollectionEquality().equals(other.question, question) &&
            const DeepCollectionEquality().equals(other.answers, answers));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(question),
      const DeepCollectionEquality().hash(answers));

  @JsonKey(ignore: true)
  @override
  _$QuestionRequirementCopyWith<_QuestionRequirement> get copyWith =>
      __$QuestionRequirementCopyWithImpl<_QuestionRequirement>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_QuestionRequirementToJson(this);
  }
}

abstract class _QuestionRequirement extends QuestionRequirement {
  const factory _QuestionRequirement(
      {required int question,
      required List<int> answers}) = _$_QuestionRequirement;
  const _QuestionRequirement._() : super._();

  factory _QuestionRequirement.fromJson(Map<String, dynamic> json) =
      _$_QuestionRequirement.fromJson;

  @override
  int get question;
  @override
  List<int> get answers;
  @override
  @JsonKey(ignore: true)
  _$QuestionRequirementCopyWith<_QuestionRequirement> get copyWith =>
      throw _privateConstructorUsedError;
}
