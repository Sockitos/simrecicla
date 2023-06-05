// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'question.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Question {
  int get id => throw _privateConstructorUsedError;
  String get question => throw _privateConstructorUsedError;
  List<Answer> get answers => throw _privateConstructorUsedError;
  QuestionRequirement? get requirement => throw _privateConstructorUsedError;
  String? get info => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $QuestionCopyWith<Question> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuestionCopyWith<$Res> {
  factory $QuestionCopyWith(Question value, $Res Function(Question) then) =
      _$QuestionCopyWithImpl<$Res, Question>;
  @useResult
  $Res call(
      {int id,
      String question,
      List<Answer> answers,
      QuestionRequirement? requirement,
      String? info});

  $QuestionRequirementCopyWith<$Res>? get requirement;
}

/// @nodoc
class _$QuestionCopyWithImpl<$Res, $Val extends Question>
    implements $QuestionCopyWith<$Res> {
  _$QuestionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? question = null,
    Object? answers = null,
    Object? requirement = freezed,
    Object? info = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      question: null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      answers: null == answers
          ? _value.answers
          : answers // ignore: cast_nullable_to_non_nullable
              as List<Answer>,
      requirement: freezed == requirement
          ? _value.requirement
          : requirement // ignore: cast_nullable_to_non_nullable
              as QuestionRequirement?,
      info: freezed == info
          ? _value.info
          : info // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $QuestionRequirementCopyWith<$Res>? get requirement {
    if (_value.requirement == null) {
      return null;
    }

    return $QuestionRequirementCopyWith<$Res>(_value.requirement!, (value) {
      return _then(_value.copyWith(requirement: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_QuestionCopyWith<$Res> implements $QuestionCopyWith<$Res> {
  factory _$$_QuestionCopyWith(
          _$_Question value, $Res Function(_$_Question) then) =
      __$$_QuestionCopyWithImpl<$Res>;
  @override
  @useResult
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
class __$$_QuestionCopyWithImpl<$Res>
    extends _$QuestionCopyWithImpl<$Res, _$_Question>
    implements _$$_QuestionCopyWith<$Res> {
  __$$_QuestionCopyWithImpl(
      _$_Question _value, $Res Function(_$_Question) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? question = null,
    Object? answers = null,
    Object? requirement = freezed,
    Object? info = freezed,
  }) {
    return _then(_$_Question(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      question: null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      answers: null == answers
          ? _value._answers
          : answers // ignore: cast_nullable_to_non_nullable
              as List<Answer>,
      requirement: freezed == requirement
          ? _value.requirement
          : requirement // ignore: cast_nullable_to_non_nullable
              as QuestionRequirement?,
      info: freezed == info
          ? _value.info
          : info // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_Question extends _Question {
  const _$_Question(
      {required this.id,
      required this.question,
      required final List<Answer> answers,
      this.requirement,
      this.info})
      : _answers = answers,
        super._();

  @override
  final int id;
  @override
  final String question;
  final List<Answer> _answers;
  @override
  List<Answer> get answers {
    if (_answers is EqualUnmodifiableListView) return _answers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_answers);
  }

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
            other is _$_Question &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.question, question) ||
                other.question == question) &&
            const DeepCollectionEquality().equals(other._answers, _answers) &&
            (identical(other.requirement, requirement) ||
                other.requirement == requirement) &&
            (identical(other.info, info) || other.info == info));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, question,
      const DeepCollectionEquality().hash(_answers), requirement, info);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_QuestionCopyWith<_$_Question> get copyWith =>
      __$$_QuestionCopyWithImpl<_$_Question>(this, _$identity);
}

abstract class _Question extends Question {
  const factory _Question(
      {required final int id,
      required final String question,
      required final List<Answer> answers,
      final QuestionRequirement? requirement,
      final String? info}) = _$_Question;
  const _Question._() : super._();

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
  _$$_QuestionCopyWith<_$_Question> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$QuestionRequirement {
  int get question => throw _privateConstructorUsedError;
  List<int> get answers => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $QuestionRequirementCopyWith<QuestionRequirement> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuestionRequirementCopyWith<$Res> {
  factory $QuestionRequirementCopyWith(
          QuestionRequirement value, $Res Function(QuestionRequirement) then) =
      _$QuestionRequirementCopyWithImpl<$Res, QuestionRequirement>;
  @useResult
  $Res call({int question, List<int> answers});
}

/// @nodoc
class _$QuestionRequirementCopyWithImpl<$Res, $Val extends QuestionRequirement>
    implements $QuestionRequirementCopyWith<$Res> {
  _$QuestionRequirementCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? question = null,
    Object? answers = null,
  }) {
    return _then(_value.copyWith(
      question: null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as int,
      answers: null == answers
          ? _value.answers
          : answers // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_QuestionRequirementCopyWith<$Res>
    implements $QuestionRequirementCopyWith<$Res> {
  factory _$$_QuestionRequirementCopyWith(_$_QuestionRequirement value,
          $Res Function(_$_QuestionRequirement) then) =
      __$$_QuestionRequirementCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int question, List<int> answers});
}

/// @nodoc
class __$$_QuestionRequirementCopyWithImpl<$Res>
    extends _$QuestionRequirementCopyWithImpl<$Res, _$_QuestionRequirement>
    implements _$$_QuestionRequirementCopyWith<$Res> {
  __$$_QuestionRequirementCopyWithImpl(_$_QuestionRequirement _value,
      $Res Function(_$_QuestionRequirement) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? question = null,
    Object? answers = null,
  }) {
    return _then(_$_QuestionRequirement(
      question: null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as int,
      answers: null == answers
          ? _value._answers
          : answers // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ));
  }
}

/// @nodoc

class _$_QuestionRequirement implements _QuestionRequirement {
  const _$_QuestionRequirement(
      {required this.question, required final List<int> answers})
      : _answers = answers;

  @override
  final int question;
  final List<int> _answers;
  @override
  List<int> get answers {
    if (_answers is EqualUnmodifiableListView) return _answers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_answers);
  }

  @override
  String toString() {
    return 'QuestionRequirement(question: $question, answers: $answers)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_QuestionRequirement &&
            (identical(other.question, question) ||
                other.question == question) &&
            const DeepCollectionEquality().equals(other._answers, _answers));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, question, const DeepCollectionEquality().hash(_answers));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_QuestionRequirementCopyWith<_$_QuestionRequirement> get copyWith =>
      __$$_QuestionRequirementCopyWithImpl<_$_QuestionRequirement>(
          this, _$identity);
}

abstract class _QuestionRequirement implements QuestionRequirement {
  const factory _QuestionRequirement(
      {required final int question,
      required final List<int> answers}) = _$_QuestionRequirement;

  @override
  int get question;
  @override
  List<int> get answers;
  @override
  @JsonKey(ignore: true)
  _$$_QuestionRequirementCopyWith<_$_QuestionRequirement> get copyWith =>
      throw _privateConstructorUsedError;
}
