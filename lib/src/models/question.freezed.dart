// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'question.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Question _$QuestionFromJson(Map<String, dynamic> json) {
  return _Question.fromJson(json);
}

/// @nodoc
class _$QuestionTearOff {
  const _$QuestionTearOff();

  _Question call(
      {required int id,
      required String question,
      required List<Answer> answers,
      required QuestionRequirement? requirement,
      required String? info}) {
    return _Question(
      id: id,
      question: question,
      answers: answers,
      requirement: requirement,
      info: info,
    );
  }

  Question fromJson(Map<String, Object?> json) {
    return Question.fromJson(json);
  }
}

/// @nodoc
const $Question = _$QuestionTearOff();

/// @nodoc
mixin _$Question {
  int get id => throw _privateConstructorUsedError;
  String get question => throw _privateConstructorUsedError;
  List<Answer> get answers => throw _privateConstructorUsedError;
  QuestionRequirement? get requirement => throw _privateConstructorUsedError;
  String? get info => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QuestionCopyWith<Question> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuestionCopyWith<$Res> {
  factory $QuestionCopyWith(Question value, $Res Function(Question) then) =
      _$QuestionCopyWithImpl<$Res>;
  $Res call(
      {int id,
      String question,
      List<Answer> answers,
      QuestionRequirement? requirement,
      String? info});

  $QuestionRequirementCopyWith<$Res>? get requirement;
}

/// @nodoc
class _$QuestionCopyWithImpl<$Res> implements $QuestionCopyWith<$Res> {
  _$QuestionCopyWithImpl(this._value, this._then);

  final Question _value;
  // ignore: unused_field
  final $Res Function(Question) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? question = freezed,
    Object? answers = freezed,
    Object? requirement = freezed,
    Object? info = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      question: question == freezed
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      answers: answers == freezed
          ? _value.answers
          : answers // ignore: cast_nullable_to_non_nullable
              as List<Answer>,
      requirement: requirement == freezed
          ? _value.requirement
          : requirement // ignore: cast_nullable_to_non_nullable
              as QuestionRequirement?,
      info: info == freezed
          ? _value.info
          : info // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  @override
  $QuestionRequirementCopyWith<$Res>? get requirement {
    if (_value.requirement == null) {
      return null;
    }

    return $QuestionRequirementCopyWith<$Res>(_value.requirement!, (value) {
      return _then(_value.copyWith(requirement: value));
    });
  }
}

/// @nodoc
abstract class _$QuestionCopyWith<$Res> implements $QuestionCopyWith<$Res> {
  factory _$QuestionCopyWith(_Question value, $Res Function(_Question) then) =
      __$QuestionCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      String question,
      List<Answer> answers,
      QuestionRequirement? requirement,
      String? info});

  @override
  $QuestionRequirementCopyWith<$Res>? get requirement;
}

/// @nodoc
class __$QuestionCopyWithImpl<$Res> extends _$QuestionCopyWithImpl<$Res>
    implements _$QuestionCopyWith<$Res> {
  __$QuestionCopyWithImpl(_Question _value, $Res Function(_Question) _then)
      : super(_value, (v) => _then(v as _Question));

  @override
  _Question get _value => super._value as _Question;

  @override
  $Res call({
    Object? id = freezed,
    Object? question = freezed,
    Object? answers = freezed,
    Object? requirement = freezed,
    Object? info = freezed,
  }) {
    return _then(_Question(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      question: question == freezed
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      answers: answers == freezed
          ? _value.answers
          : answers // ignore: cast_nullable_to_non_nullable
              as List<Answer>,
      requirement: requirement == freezed
          ? _value.requirement
          : requirement // ignore: cast_nullable_to_non_nullable
              as QuestionRequirement?,
      info: info == freezed
          ? _value.info
          : info // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Question extends _Question {
  const _$_Question(
      {required this.id,
      required this.question,
      required this.answers,
      required this.requirement,
      required this.info})
      : super._();

  factory _$_Question.fromJson(Map<String, dynamic> json) =>
      _$$_QuestionFromJson(json);

  @override
  final int id;
  @override
  final String question;
  @override
  final List<Answer> answers;
  @override
  final QuestionRequirement? requirement;
  @override
  final String? info;

  @override
  String toString() {
    return 'Question(id: $id, question: $question, answers: $answers, requirement: $requirement, info: $info)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Question &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.question, question) &&
            const DeepCollectionEquality().equals(other.answers, answers) &&
            const DeepCollectionEquality()
                .equals(other.requirement, requirement) &&
            const DeepCollectionEquality().equals(other.info, info));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(question),
      const DeepCollectionEquality().hash(answers),
      const DeepCollectionEquality().hash(requirement),
      const DeepCollectionEquality().hash(info));

  @JsonKey(ignore: true)
  @override
  _$QuestionCopyWith<_Question> get copyWith =>
      __$QuestionCopyWithImpl<_Question>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_QuestionToJson(this);
  }
}

abstract class _Question extends Question {
  const factory _Question(
      {required int id,
      required String question,
      required List<Answer> answers,
      required QuestionRequirement? requirement,
      required String? info}) = _$_Question;
  const _Question._() : super._();

  factory _Question.fromJson(Map<String, dynamic> json) = _$_Question.fromJson;

  @override
  int get id;
  @override
  String get question;
  @override
  List<Answer> get answers;
  @override
  QuestionRequirement? get requirement;
  @override
  String? get info;
  @override
  @JsonKey(ignore: true)
  _$QuestionCopyWith<_Question> get copyWith =>
      throw _privateConstructorUsedError;
}
